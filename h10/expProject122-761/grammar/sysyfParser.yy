%skeleton "lalr1.cc" /* -*- c++ -*- */
%require "3.0"
%defines
//%define parser_class_name {sysyfParser}
%define api.parser.class {sysyfParser}

%define api.token.constructor
%define api.value.type variant
%define parse.assert

%code requires
{
#include <string>
#include "SyntaxTree.h"
class sysyfDriver;
}

// The parsing context.
%param { sysyfDriver& driver }

// Location tracking
%locations
%initial-action
{
// Initialize the initial location.
@$.begin.filename = @$.end.filename = &driver.file;
};

// Enable tracing and verbose errors (which may be wrong!)
%define parse.trace
%define parse.error verbose

// Parser needs to know about the driver:
%code
{
#include "sysyfDriver.h"
#define yylex driver.lexer.yylex
}

// Tokens:
%define api.token.prefix {TOK_}

%token END
/*********add your token here*********/
%token <int>INTCONST
%token <float>FLOATCONST
%token INT
%token FLOAT
%token VOID
%token CONST
%token PLUS
%token MINUS
%token MULTIPLY
%token DIVIDE
%token MODULO
%token ASSIGN
%token SEMICOLON
%token COMMA
%token LPARENTHESE
%token RPARENTHESE
%token LBRACE
%token RBRACE
%token RETURN
%token <std::string>IDENTIFIER
%token NOT
%token LBRACKET
%token RBRACKET
%token WHILE
%token IF
%token BREAK
%token CONTINUE
%token ELSE
%token NEQ
%token LT
%token GT
%token EQ
%token LAND
%token LOR
%token LTE
%token GTE
// Use variant-based semantic values: %type and %token expect genuine types
%type <SyntaxTree::Assembly*>CompUnit
%type <SyntaxTree::PtrList<SyntaxTree::GlobalDef>>GlobalDecl

/*********add semantic value definition here*********/
%type <SyntaxTree::PtrList<SyntaxTree::VarDef>> Decl
%type <SyntaxTree::PtrList<SyntaxTree::VarDef>> ConstDecl
%type <SyntaxTree::PtrList<SyntaxTree::VarDef>> ConstDefList
%type <SyntaxTree::Type> BType
%type <SyntaxTree::VarDef*> ConstDef
%type <SyntaxTree::PtrList<SyntaxTree::Expr>>EXPLIST
%type <SyntaxTree::InitVal*> ConstInitVal
%type <SyntaxTree::PtrList<SyntaxTree::InitVal>> ConstInitValList
%type <SyntaxTree::PtrList<SyntaxTree::InitVal>>ConstInitValListComplete
%type <SyntaxTree::PtrList<SyntaxTree::VarDef>> VarDecl
%type <SyntaxTree::PtrList<SyntaxTree::VarDef>> VarDefList
%type <SyntaxTree::VarDef*> VarDef
%type <SyntaxTree::InitVal*> InitVal
%type <SyntaxTree::PtrList<SyntaxTree::InitVal>> InitValList
%type <SyntaxTree::PtrList<SyntaxTree::InitVal>>InitValListComplete
%type <SyntaxTree::FuncDef*>FuncDef
%type <SyntaxTree::FuncFParamList*>FuncFParams
%type <SyntaxTree::FuncFParamList*>FuncFParamsComplete
%type <SyntaxTree::FuncCallStmt*>FuncCallStmt
%type <SyntaxTree::FuncParam*>FuncFParam
%type <SyntaxTree::PtrList<SyntaxTree::Expr>>ParamVar
%type <SyntaxTree::BlockStmt*>Block
%type <SyntaxTree::PtrList<SyntaxTree::Stmt>>BlockItemListComplete
%type <SyntaxTree::PtrList<SyntaxTree::Stmt>>BlockItemList
%type <SyntaxTree::PtrList<SyntaxTree::Stmt>>BlockItem
%type <SyntaxTree::Stmt*>Stmt

%type <SyntaxTree::Expr*>Exp
%type <SyntaxTree::Expr*>Cond
%type <SyntaxTree::LVal*>LVal
%type <SyntaxTree::Literal*>Number
%type <SyntaxTree::Expr*>UnaryExp

%type <SyntaxTree::UnaryOp>UnaryOp
%type <SyntaxTree::UnaryCondOp>UnaryCondOp
%type <SyntaxTree::PtrList<SyntaxTree::Expr>>FuncRParams
%type <SyntaxTree::PtrList<SyntaxTree::Expr>>FuncRParamsComplete
%type <SyntaxTree::Expr*>MulExp
%type <SyntaxTree::Expr*>AddExp
%type <SyntaxTree::Expr*>RelExp
%type <SyntaxTree::Expr*>EqExp
%type <SyntaxTree::Expr*>LAndExp
%type <SyntaxTree::Expr*>LOrExp
%type <SyntaxTree::Stmt*>OtherStmt
%type <SyntaxTree::Stmt*>MatchedStmt
%type <SyntaxTree::Stmt*>OpenStmt
// No %destructors are needed, since memory will be reclaimed by the
// regular destructors.

// Grammar:
%start Begin

%%
Begin: CompUnit END {
      $1->loc = @$;
      driver.root = $1;
      return 0;
    }
    ;

CompUnit:CompUnit GlobalDecl{
		  $1->global_defs.insert($1->global_defs.end(), $2.begin(), $2.end());
		  $$=$1;
	  }
	  | GlobalDecl{
		  $$=new SyntaxTree::Assembly();
		  $$->global_defs.insert($$->global_defs.end(), $1.begin(), $1.end());
    }
    ;
/*********add other semantic symbol definition here*********/
GlobalDecl: Decl{
      $$=SyntaxTree::PtrList<SyntaxTree::GlobalDef>();
      $$.insert($$.end(),$1.begin(),$1.end());
    }
    | FuncDef{
      $$=SyntaxTree::PtrList<SyntaxTree::GlobalDef>();
      $$.push_back(SyntaxTree::Ptr<SyntaxTree::GlobalDef>($1));
    }
    ;

Decl: ConstDecl{
      $$ = $1;
    }
    | VarDecl{
      $$ = $1;
    }
    ;

ConstDecl: CONST BType ConstDefList SEMICOLON{
      $$ = $3;
      for (auto &node : $$) {
        node -> is_constant = true;
        node -> btype = $2;
      }
    }
    ;

ConstDefList: ConstDefList COMMA ConstDef{
      $1.push_back(SyntaxTree::Ptr<SyntaxTree::VarDef>($3));
      $$=$1;
    }
    | ConstDef{
      $$=SyntaxTree::PtrList<SyntaxTree::VarDef>();
      $$.push_back(SyntaxTree::Ptr<SyntaxTree::VarDef>($1));
    }
    ;

ConstDef: IDENTIFIER EXPLIST ASSIGN ConstInitVal{
      $$=new SyntaxTree::VarDef();
      $$->is_inited = true;
      $$ -> name = $1;
      $$ -> array_length = $2;
      $$ -> initializers = SyntaxTree::Ptr<SyntaxTree::InitVal>($4);
      $$->loc = @$;
    }
    ;

EXPLIST:EXPLIST LBRACKET Exp RBRACKET{
    $1.push_back(SyntaxTree::Ptr<SyntaxTree::Expr>($3));
    $$ = $1;
  }
  | %empty {
    $$ = SyntaxTree::PtrList<SyntaxTree::Expr>();
  }
  ;

ConstInitVal:Exp{
      $$ = new SyntaxTree::InitVal();
      $$ -> isExp = true;
      $$ -> expr = SyntaxTree::Ptr<SyntaxTree::Expr>($1);
      $$->loc = @$;
    }
    | LBRACE ConstInitValListComplete RBRACE{
      $$ = new SyntaxTree::InitVal();
      $$ -> isExp = false;
      $$ -> elementList = $2;
      $$->loc = @$;
    }
    ;

ConstInitValList: ConstInitValList COMMA ConstInitVal{
      $1.push_back(SyntaxTree::Ptr<SyntaxTree::InitVal>($3));
      $$ = $1;
    }
    |ConstInitVal{
      $$ = SyntaxTree::PtrList<SyntaxTree::InitVal>();
      $$.push_back(SyntaxTree::Ptr<SyntaxTree::InitVal>($1));
    }
    ;

ConstInitValListComplete:ConstInitValList{
      $$ = $1;
    }
    | %empty{
      $$ = SyntaxTree::PtrList<SyntaxTree::InitVal>();
    }
    ;

BType: INT{
      $$ = SyntaxTree::Type::INT;
    }
    | FLOAT{
      $$ = SyntaxTree::Type::FLOAT;
    }
    ;

VarDecl:BType VarDefList SEMICOLON{
      $$ = $2;
      for (auto &node : $$){
        node -> is_constant = false;
        node -> btype = $1;
      }
    }
    ;

VarDefList: VarDefList COMMA VarDef {
      $1.push_back(SyntaxTree::Ptr<SyntaxTree::VarDef>($3));
      $$ = $1;
    }
    | VarDef{
      $$=SyntaxTree::PtrList<SyntaxTree::VarDef>();
      $$.push_back(SyntaxTree::Ptr<SyntaxTree::VarDef>($1));
    }
    ;

VarDef: IDENTIFIER EXPLIST{
      $$ = new SyntaxTree::VarDef();
      $$ -> name = $1;
      $$ -> is_inited = false;
      $$ -> array_length = $2;
      $$ -> initializers = NULL;
      $$->loc = @$;
    }
    | IDENTIFIER EXPLIST ASSIGN InitVal{
      $$ = new SyntaxTree::VarDef();
      $$ -> name = $1;
      $$ -> is_inited = true;
      $$ -> array_length = $2;
      $$ -> initializers = SyntaxTree::Ptr<SyntaxTree::InitVal>($4);
      $$->loc = @$;
    }
    ;

InitVal:Exp{
      $$ = new SyntaxTree::InitVal();
      $$ -> isExp = true;
      $$ -> expr = SyntaxTree::Ptr<SyntaxTree::Expr>($1);
      $$->loc = @$;
    }
    | LBRACE InitValListComplete RBRACE{
      $$ = new SyntaxTree::InitVal();
      $$ -> isExp = false;
      $$ -> elementList = $2;
      $$->loc = @$;
    }
    ;

InitValList:InitValList COMMA InitVal{
      $1.push_back(SyntaxTree::Ptr<SyntaxTree::InitVal>($3));
      $$ = $1;
  }
  | InitVal{
      $$ = SyntaxTree::PtrList<SyntaxTree::InitVal>();
      $$.push_back(SyntaxTree::Ptr<SyntaxTree::InitVal>($1));
  }
  ;

InitValListComplete:InitValList{
    $$ = $1;
  };
  | %empty{
    $$ = SyntaxTree::PtrList<SyntaxTree::InitVal>();
  }
  ;

FuncDef:VOID IDENTIFIER LPARENTHESE FuncFParamsComplete RPARENTHESE Block{
    $$ = new SyntaxTree::FuncDef();
    $$ -> ret_type = SyntaxTree::Type::VOID;
    $$ -> name = $2;
    $$ -> body = SyntaxTree::Ptr<SyntaxTree::BlockStmt>($6);
    $$ -> param_list = SyntaxTree::Ptr<SyntaxTree::FuncFParamList>($4);
    $$->loc = @$;
  }
  | BType IDENTIFIER LPARENTHESE FuncFParamsComplete RPARENTHESE Block{
    $$ = new SyntaxTree::FuncDef();
    $$ -> ret_type = $1;
    $$ -> name = $2;
    $$ -> body = SyntaxTree::Ptr<SyntaxTree::BlockStmt>($6);
    $$ -> param_list = SyntaxTree::Ptr<SyntaxTree::FuncFParamList>($4);
    $$->loc = @$;
  }
  ;

FuncFParamsComplete:FuncFParams{
    $$ = $1;
  }
  | %empty{
    $$ = new SyntaxTree::FuncFParamList();
    $$ -> params = SyntaxTree::PtrList<SyntaxTree::FuncParam>();
  }
  ;

FuncFParams: FuncFParams COMMA FuncFParam{
    $1 -> params.push_back(SyntaxTree::Ptr<SyntaxTree::FuncParam>($3));
    $$ = $1;
  }
  | FuncFParam{
      $$ = new SyntaxTree::FuncFParamList();
      $$ -> params.push_back(SyntaxTree::Ptr<SyntaxTree::FuncParam>($1));
  }
  ;

FuncFParam:BType IDENTIFIER{
    $$ = new SyntaxTree::FuncParam();
    $$ -> name = $2;
    $$ -> param_type = $1;
  }
  |BType IDENTIFIER ParamVar{
    $$ = new SyntaxTree::FuncParam();
    $$ -> name = $2;
    $$ -> param_type = $1;
    $$ -> array_index = $3;
  }
  ;

ParamVar:ParamVar LBRACKET Exp RBRACKET{
    $1.push_back(SyntaxTree::Ptr<SyntaxTree::Expr>($3));
    $$ = $1;
  }
  | LBRACKET RBRACKET{
    $$ = SyntaxTree::PtrList<SyntaxTree::Expr>();
    $$.push_back(nullptr);
  }
  ;

Block:LBRACE BlockItemListComplete RBRACE{
    $$ = new SyntaxTree::BlockStmt();
    $$ -> body = $2;
    $$->loc = @$;
  }
  ;

BlockItemListComplete:BlockItemList{
    $$ = $1;
  }
  | %empty{
    $$ = SyntaxTree::PtrList<SyntaxTree::Stmt>();
  }
  ;

BlockItemList:BlockItemList BlockItem{
    $1.insert($1.end(), $2.begin(), $2.end());
    $$ = $1;
  }
  | BlockItem{
    $$ = SyntaxTree::PtrList<SyntaxTree::Stmt>();
    $$.insert($$.end(), $1.begin(), $1.end());
  }
  ;

BlockItem:Decl{
    $$ = SyntaxTree::PtrList<SyntaxTree::Stmt>();
    $$.insert($$.end(), $1.begin(), $1.end());
  }
  | Stmt{
    $$ = SyntaxTree::PtrList<SyntaxTree::Stmt>();
    $$.push_back(SyntaxTree::Ptr<SyntaxTree::Stmt>($1));
  }
  ;

OtherStmt:LVal ASSIGN Exp SEMICOLON{
    auto temp = new SyntaxTree::AssignStmt();
    temp->target = SyntaxTree::Ptr<SyntaxTree::LVal>($1);
    temp->value = SyntaxTree::Ptr<SyntaxTree::Expr>($3);
    $$ = temp;
    $$->loc = @$;
  }
  | SEMICOLON{
    $$ = new SyntaxTree::EmptyStmt();
    $$->loc = @$;
  }
  | Exp SEMICOLON{
    auto temp = new SyntaxTree::ExprStmt();
    temp->exp = SyntaxTree::Ptr<SyntaxTree::Expr>($1);
    $$ = temp;
    $$->loc = @$;
  }
  | Block{
    $$ = $1;
  }
  | BREAK SEMICOLON{
    auto temp = new SyntaxTree::BreakStmt();
    $$ = temp;
    $$->loc = @$;
  }
  | CONTINUE SEMICOLON{
    auto temp = new SyntaxTree::ContinueStmt();
    $$ = temp;
    $$->loc = @$;
  }
  | RETURN Exp SEMICOLON{
    auto temp = new SyntaxTree::ReturnStmt();
    temp -> ret = SyntaxTree::Ptr<SyntaxTree::Expr>($2);
    $$ = temp;
    $$->loc = @$;
  }
  | RETURN SEMICOLON{
    auto temp = new SyntaxTree::ReturnStmt();
    temp -> ret = NULL;
    $$ = temp;
    $$->loc = @$;
  }
  ;

Stmt: MatchedStmt{
    $$ = $1;
  };
  | OpenStmt{
    $$ = $1;
  };

MatchedStmt: IF LPARENTHESE Cond RPARENTHESE MatchedStmt ELSE MatchedStmt{
    auto temp = new SyntaxTree::IfStmt();
    temp -> cond_exp = SyntaxTree::Ptr<SyntaxTree::Expr>($3);
    temp -> if_statement = SyntaxTree::Ptr<SyntaxTree::Stmt>($5);
    temp -> else_statement = SyntaxTree::Ptr<SyntaxTree::Stmt>($7);
    $$ = temp;
    $$->loc = @$;
  }
  | WHILE LPARENTHESE Cond RPARENTHESE MatchedStmt{
    auto temp = new SyntaxTree::WhileStmt();
    temp -> cond_exp = SyntaxTree::Ptr<SyntaxTree::Expr>($3);
    temp -> statement = SyntaxTree::Ptr<SyntaxTree::Stmt>($5);
    $$ = temp;
    $$->loc = @$;
  }
  | OtherStmt{
    $$ = $1;
  };
OpenStmt: IF LPARENTHESE Cond RPARENTHESE Stmt{
    auto temp = new SyntaxTree::IfStmt();
    temp -> cond_exp = SyntaxTree::Ptr<SyntaxTree::Expr>($3);
    temp -> if_statement = SyntaxTree::Ptr<SyntaxTree::Stmt>($5);
    temp -> else_statement = NULL;
    $$ = temp;
    $$->loc = @$;
  }
  | IF LPARENTHESE Cond RPARENTHESE MatchedStmt ELSE OpenStmt{
    auto temp = new SyntaxTree::IfStmt();
    temp -> cond_exp = SyntaxTree::Ptr<SyntaxTree::Expr>($3);
    temp -> if_statement = SyntaxTree::Ptr<SyntaxTree::Stmt>($5);
    temp -> else_statement = SyntaxTree::Ptr<SyntaxTree::Stmt>($7);
    $$ = temp;
    $$->loc = @$;
  }
  | WHILE LPARENTHESE Cond RPARENTHESE OpenStmt{
    auto temp = new SyntaxTree::WhileStmt();
    temp -> cond_exp = SyntaxTree::Ptr<SyntaxTree::Expr>($3);
    temp -> statement = SyntaxTree::Ptr<SyntaxTree::Stmt>($5);
    $$ = temp;
    $$->loc = @$;
  }
  ;


Exp:AddExp{
    $$ = $1;
  }
  ;
Cond:LOrExp{
    $$ = $1;
  }
  ;
LVal:LVal LBRACKET Exp RBRACKET{
    $1 -> array_index.push_back(SyntaxTree::Ptr<SyntaxTree::Expr>($3));
    $$ = $1;
  }
  | IDENTIFIER{
    $$ = new SyntaxTree::LVal();
    $$ -> name = $1;
    $$ -> array_index = SyntaxTree::PtrList<SyntaxTree::Expr>();
  }
  ;
Number:INTCONST{
    $$ = new SyntaxTree::Literal();
    $$ -> literal_type = SyntaxTree::Type::INT;
    $$ -> int_const = $1;
    $$->loc = @$;
  }
  | FLOATCONST{
    $$ = new SyntaxTree::Literal();
    $$ -> literal_type = SyntaxTree::Type::FLOAT;
    $$ -> float_const = $1;
    $$->loc = @$;
  }
  ;

UnaryExp:LPARENTHESE Exp RPARENTHESE{
    $$ = $2;
  }
  | LPARENTHESE Cond RPARENTHESE{
    $$ = $2;
  }
  | LVal{
    auto temp = new SyntaxTree::LVal();
    temp = $1;
    $$ = temp;
  }
  | Number{
    auto temp = new SyntaxTree::Literal();
    temp = $1;
    $$ = temp;
  }
  | FuncCallStmt{
    auto temp = new SyntaxTree::FuncCallStmt();
    temp = $1;
    $$ = temp;
  }
  | UnaryOp UnaryExp{
    auto temp = new SyntaxTree::UnaryExpr();
    temp -> op = $1;
    temp -> rhs = SyntaxTree::Ptr<SyntaxTree::Expr>($2);
    $$ = temp;
  }
  | UnaryCondOp UnaryExp{
    auto temp = new SyntaxTree::UnaryCondExpr();
    temp -> op = $1;
    temp -> rhs = SyntaxTree::Ptr<SyntaxTree::Expr>($2);
    $$ = temp;
  }
  ;

FuncCallStmt:IDENTIFIER LPARENTHESE  FuncRParamsComplete RPARENTHESE{
    $$ = new SyntaxTree::FuncCallStmt();
    $$ -> name = $1;
    $$ -> params = $3;
  }
  ;

UnaryOp:PLUS{
    $$ = SyntaxTree::UnaryOp::PLUS;
  }
  | MINUS{
    $$ = SyntaxTree::UnaryOp::MINUS;
  }
  ;
UnaryCondOp:NOT{
    $$ = SyntaxTree::UnaryCondOp::NOT;
  }
  ;
FuncRParams:FuncRParams COMMA Exp{
    $1.push_back(SyntaxTree::Ptr<SyntaxTree::Expr>($3));
    $$ = $1;
  }
  | Exp{
    $$ = SyntaxTree::PtrList<SyntaxTree::Expr>();
    $$.push_back(SyntaxTree::Ptr<SyntaxTree::Expr>($1));
  }
  ;

FuncRParamsComplete: FuncRParams{
    $$ = $1;
  }
  | %empty{
    $$ = SyntaxTree::PtrList<SyntaxTree::Expr>();
  }
  ;
MulExp:UnaryExp{
    $$ = $1;
  }
  | MulExp MULTIPLY UnaryExp{
    auto temp = new SyntaxTree::BinaryExpr();
    temp->op = SyntaxTree::BinOp::MULTIPLY;
    temp->lhs = SyntaxTree::Ptr<SyntaxTree::Expr>($1);
    temp->rhs = SyntaxTree::Ptr<SyntaxTree::Expr>($3);
    $$ = temp;
    $$->loc = @$;
  }
  |MulExp DIVIDE UnaryExp{
    auto temp = new SyntaxTree::BinaryExpr();
    temp->op = SyntaxTree::BinOp::DIVIDE;
    temp->lhs = SyntaxTree::Ptr<SyntaxTree::Expr>($1);
    temp->rhs = SyntaxTree::Ptr<SyntaxTree::Expr>($3);
    $$ = temp;
    $$->loc = @$;
  }
  |MulExp MODULO UnaryExp{
    auto temp = new SyntaxTree::BinaryExpr();
    temp->op = SyntaxTree::BinOp::MODULO;
    temp->lhs = SyntaxTree::Ptr<SyntaxTree::Expr>($1);
    temp->rhs = SyntaxTree::Ptr<SyntaxTree::Expr>($3);
    $$ = temp;
    $$->loc = @$;
  }
  ;
AddExp:MulExp{
    $$ = $1;
  }
  | AddExp PLUS MulExp{
    auto temp = new SyntaxTree::BinaryExpr();
    temp->op = SyntaxTree::BinOp::PLUS;
    temp->lhs = SyntaxTree::Ptr<SyntaxTree::Expr>($1);
    temp->rhs = SyntaxTree::Ptr<SyntaxTree::Expr>($3);
    $$ = temp;
    $$->loc = @$;
  }
  |AddExp MINUS MulExp{
    auto temp = new SyntaxTree::BinaryExpr();
    temp->op = SyntaxTree::BinOp::MINUS;
    temp->lhs = SyntaxTree::Ptr<SyntaxTree::Expr>($1);
    temp->rhs = SyntaxTree::Ptr<SyntaxTree::Expr>($3);
    $$ = temp;
    $$->loc = @$;
  }
  ;
RelExp:AddExp{
    $$ = $1;
  }
  | RelExp LT AddExp{
    auto temp = new SyntaxTree::BinaryCondExpr();
    temp->op = SyntaxTree::BinaryCondOp::LT;
    temp->lhs = SyntaxTree::Ptr<SyntaxTree::Expr>($1);
    temp->rhs = SyntaxTree::Ptr<SyntaxTree::Expr>($3);
    $$ = temp;
    $$->loc = @$;
  }
  |RelExp GT AddExp{
    auto temp = new SyntaxTree::BinaryCondExpr();
    temp->op = SyntaxTree::BinaryCondOp::GT;
    temp->lhs = SyntaxTree::Ptr<SyntaxTree::Expr>($1);
    temp->rhs = SyntaxTree::Ptr<SyntaxTree::Expr>($3);
    $$ = temp;
    $$->loc = @$;
  }
  |RelExp LTE AddExp{
    auto temp = new SyntaxTree::BinaryCondExpr();
    temp->op = SyntaxTree::BinaryCondOp::LTE;
    temp->lhs = SyntaxTree::Ptr<SyntaxTree::Expr>($1);
    temp->rhs = SyntaxTree::Ptr<SyntaxTree::Expr>($3);
    $$ = temp;
    $$->loc = @$;
  }
  |RelExp GTE AddExp{
    auto temp = new SyntaxTree::BinaryCondExpr();
    temp->op = SyntaxTree::BinaryCondOp::GTE;
    temp->lhs = SyntaxTree::Ptr<SyntaxTree::Expr>($1);
    temp->rhs = SyntaxTree::Ptr<SyntaxTree::Expr>($3);
    $$ = temp;
    $$->loc = @$;
  }
  ;
EqExp:RelExp{
    $$ = $1;
  }
  | EqExp EQ RelExp{
    auto temp = new SyntaxTree::BinaryCondExpr();
    temp->op = SyntaxTree::BinaryCondOp::EQ;
    temp->lhs = SyntaxTree::Ptr<SyntaxTree::Expr>($1);
    temp->rhs = SyntaxTree::Ptr<SyntaxTree::Expr>($3);
    $$ = temp;
    $$->loc = @$;
  }
  |EqExp NEQ RelExp{
    auto temp = new SyntaxTree::BinaryCondExpr();
    temp->op = SyntaxTree::BinaryCondOp::NEQ;
    temp->lhs = SyntaxTree::Ptr<SyntaxTree::Expr>($1);
    temp->rhs = SyntaxTree::Ptr<SyntaxTree::Expr>($3);
    $$ = temp;
    $$->loc = @$;
  }
  ;
LAndExp:EqExp{
    $$ = $1;
  };
  | LAndExp LAND EqExp{
    auto temp = new SyntaxTree::BinaryCondExpr();
    temp->op = SyntaxTree::BinaryCondOp::LAND;
    temp->lhs = SyntaxTree::Ptr<SyntaxTree::Expr>($1);
    temp->rhs = SyntaxTree::Ptr<SyntaxTree::Expr>($3);
    $$ = temp;
    $$->loc = @$;
  }
  ;
LOrExp:LAndExp{
    $$ = $1;
  }
  | LOrExp LOR LAndExp{
    auto temp = new SyntaxTree::BinaryCondExpr();
    temp->op = SyntaxTree::BinaryCondOp::LOR;
    temp->lhs = SyntaxTree::Ptr<SyntaxTree::Expr>($1);
    temp->rhs = SyntaxTree::Ptr<SyntaxTree::Expr>($3);
    $$ = temp;
    $$->loc = @$;
  }
  ;


%%

// Register errors to the driver:
void yy::sysyfParser::error (const location_type& l,
                          const std::string& m)
{
    driver.error(l, m);
}
