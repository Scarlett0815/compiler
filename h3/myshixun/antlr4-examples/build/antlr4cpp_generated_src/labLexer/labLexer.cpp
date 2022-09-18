
// Generated from /home/scarlett/Documents/compile/h3/myshixun/antlr4-examples/grammar/labLexer.g4 by ANTLR 4.8


#include "labLexer.h"


using namespace antlr4;

using namespace antlr4;

labLexer::labLexer(CharStream *input) : Lexer(input) {
  _interpreter = new atn::LexerATNSimulator(this, _atn, _decisionToDFA, _sharedContextCache);
}

labLexer::~labLexer() {
  delete _interpreter;
}

std::string labLexer::getGrammarFileName() const {
  return "labLexer.g4";
}

const std::vector<std::string>& labLexer::getRuleNames() const {
  return _ruleNames;
}

const std::vector<std::string>& labLexer::getChannelNames() const {
  return _channelNames;
}

const std::vector<std::string>& labLexer::getModeNames() const {
  return _modeNames;
}

const std::vector<std::string>& labLexer::getTokenNames() const {
  return _tokenNames;
}

dfa::Vocabulary& labLexer::getVocabulary() const {
  return _vocabulary;
}

const std::vector<uint16_t> labLexer::getSerializedATN() const {
  return _serializedATN;
}

const atn::ATN& labLexer::getATN() const {
  return _atn;
}




// Static vars and initialization.
std::vector<dfa::DFA> labLexer::_decisionToDFA;
atn::PredictionContextCache labLexer::_sharedContextCache;

// We own the ATN which in turn owns the ATN states.
atn::ATN labLexer::_atn;
std::vector<uint16_t> labLexer::_serializedATN;

std::vector<std::string> labLexer::_ruleNames = {
  u8"LeftParen", u8"RightParen", u8"Plus", u8"Minus", u8"Multiply", u8"Divide", 
  u8"Modulo", u8"WhiteSpace"
};

std::vector<std::string> labLexer::_channelNames = {
  "DEFAULT_TOKEN_CHANNEL", "HIDDEN"
};

std::vector<std::string> labLexer::_modeNames = {
  u8"DEFAULT_MODE"
};

std::vector<std::string> labLexer::_literalNames = {
  "", "", "", "", "", "", "", "", u8"'('", u8"')'", "", "", "", "", "", 
  "", "", "", "", "", u8"'+'", u8"'-'", u8"'*'", u8"'/'", u8"'%'"
};

std::vector<std::string> labLexer::_symbolicNames = {
  "", u8"Comma", u8"SemiColon", u8"Assign", u8"LeftBracket", u8"RightBracket", 
  u8"LeftBrace", u8"RightBrace", u8"LeftParen", u8"RightParen", u8"If", 
  u8"Else", u8"While", u8"Const", u8"Equal", u8"NonEqual", u8"Less", u8"Greater", 
  u8"LessEqual", u8"GreaterEqual", u8"Plus", u8"Minus", u8"Multiply", u8"Divide", 
  u8"Modulo", u8"Int", u8"Float", u8"Void", u8"Identifier", u8"IntConst", 
  u8"FloatConst", u8"WhiteSpace"
};

dfa::Vocabulary labLexer::_vocabulary(_literalNames, _symbolicNames);

std::vector<std::string> labLexer::_tokenNames;

labLexer::Initializer::Initializer() {
  // This code could be in a static initializer lambda, but VS doesn't allow access to private class members from there.
	for (size_t i = 0; i < _symbolicNames.size(); ++i) {
		std::string name = _vocabulary.getLiteralName(i);
		if (name.empty()) {
			name = _vocabulary.getSymbolicName(i);
		}

		if (name.empty()) {
			_tokenNames.push_back("<INVALID>");
		} else {
      _tokenNames.push_back(name);
    }
	}

  _serializedATN = {
    0x3, 0x608b, 0xa72a, 0x8133, 0xb9ed, 0x417c, 0x3be7, 0x7786, 0x5964, 
    0x2, 0x21, 0x28, 0x8, 0x1, 0x4, 0x2, 0x9, 0x2, 0x4, 0x3, 0x9, 0x3, 0x4, 
    0x4, 0x9, 0x4, 0x4, 0x5, 0x9, 0x5, 0x4, 0x6, 0x9, 0x6, 0x4, 0x7, 0x9, 
    0x7, 0x4, 0x8, 0x9, 0x8, 0x4, 0x9, 0x9, 0x9, 0x3, 0x2, 0x3, 0x2, 0x3, 
    0x3, 0x3, 0x3, 0x3, 0x4, 0x3, 0x4, 0x3, 0x5, 0x3, 0x5, 0x3, 0x6, 0x3, 
    0x6, 0x3, 0x7, 0x3, 0x7, 0x3, 0x8, 0x3, 0x8, 0x3, 0x9, 0x6, 0x9, 0x23, 
    0xa, 0x9, 0xd, 0x9, 0xe, 0x9, 0x24, 0x3, 0x9, 0x3, 0x9, 0x2, 0x2, 0xa, 
    0x3, 0xa, 0x5, 0xb, 0x7, 0x16, 0x9, 0x17, 0xb, 0x18, 0xd, 0x19, 0xf, 
    0x1a, 0x11, 0x21, 0x3, 0x2, 0x3, 0x5, 0x2, 0xb, 0xc, 0xf, 0xf, 0x22, 
    0x22, 0x2, 0x28, 0x2, 0x3, 0x3, 0x2, 0x2, 0x2, 0x2, 0x5, 0x3, 0x2, 0x2, 
    0x2, 0x2, 0x7, 0x3, 0x2, 0x2, 0x2, 0x2, 0x9, 0x3, 0x2, 0x2, 0x2, 0x2, 
    0xb, 0x3, 0x2, 0x2, 0x2, 0x2, 0xd, 0x3, 0x2, 0x2, 0x2, 0x2, 0xf, 0x3, 
    0x2, 0x2, 0x2, 0x2, 0x11, 0x3, 0x2, 0x2, 0x2, 0x3, 0x13, 0x3, 0x2, 0x2, 
    0x2, 0x5, 0x15, 0x3, 0x2, 0x2, 0x2, 0x7, 0x17, 0x3, 0x2, 0x2, 0x2, 0x9, 
    0x19, 0x3, 0x2, 0x2, 0x2, 0xb, 0x1b, 0x3, 0x2, 0x2, 0x2, 0xd, 0x1d, 
    0x3, 0x2, 0x2, 0x2, 0xf, 0x1f, 0x3, 0x2, 0x2, 0x2, 0x11, 0x22, 0x3, 
    0x2, 0x2, 0x2, 0x13, 0x14, 0x7, 0x2a, 0x2, 0x2, 0x14, 0x4, 0x3, 0x2, 
    0x2, 0x2, 0x15, 0x16, 0x7, 0x2b, 0x2, 0x2, 0x16, 0x6, 0x3, 0x2, 0x2, 
    0x2, 0x17, 0x18, 0x7, 0x2d, 0x2, 0x2, 0x18, 0x8, 0x3, 0x2, 0x2, 0x2, 
    0x19, 0x1a, 0x7, 0x2f, 0x2, 0x2, 0x1a, 0xa, 0x3, 0x2, 0x2, 0x2, 0x1b, 
    0x1c, 0x7, 0x2c, 0x2, 0x2, 0x1c, 0xc, 0x3, 0x2, 0x2, 0x2, 0x1d, 0x1e, 
    0x7, 0x31, 0x2, 0x2, 0x1e, 0xe, 0x3, 0x2, 0x2, 0x2, 0x1f, 0x20, 0x7, 
    0x27, 0x2, 0x2, 0x20, 0x10, 0x3, 0x2, 0x2, 0x2, 0x21, 0x23, 0x9, 0x2, 
    0x2, 0x2, 0x22, 0x21, 0x3, 0x2, 0x2, 0x2, 0x23, 0x24, 0x3, 0x2, 0x2, 
    0x2, 0x24, 0x22, 0x3, 0x2, 0x2, 0x2, 0x24, 0x25, 0x3, 0x2, 0x2, 0x2, 
    0x25, 0x26, 0x3, 0x2, 0x2, 0x2, 0x26, 0x27, 0x8, 0x9, 0x2, 0x2, 0x27, 
    0x12, 0x3, 0x2, 0x2, 0x2, 0x4, 0x2, 0x24, 0x3, 0x8, 0x2, 0x2, 
  };

  atn::ATNDeserializer deserializer;
  _atn = deserializer.deserialize(_serializedATN);

  size_t count = _atn.getNumberOfDecisions();
  _decisionToDFA.reserve(count);
  for (size_t i = 0; i < count; i++) { 
    _decisionToDFA.emplace_back(_atn.getDecisionState(i), i);
  }
}

labLexer::Initializer labLexer::_init;
