
// Generated from /home/scarlett/Documents/compile/h3/myshixun/labLexer/grammar/labLexer.g4 by ANTLR 4.8


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
  u8"NE", u8"GE", u8"LE", u8"EQ", u8"LT", u8"GT", u8"OTHER"
};

std::vector<std::string> labLexer::_channelNames = {
  "DEFAULT_TOKEN_CHANNEL", "HIDDEN"
};

std::vector<std::string> labLexer::_modeNames = {
  u8"DEFAULT_MODE"
};

std::vector<std::string> labLexer::_literalNames = {
  "", u8"'<>'", u8"'='", u8"'>'", u8"'>='", u8"'<'", u8"'<='"
};

std::vector<std::string> labLexer::_symbolicNames = {
  "", u8"NE", u8"EQ", u8"GT", u8"GE", u8"LT", u8"LE", u8"OTHER"
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
    0x2, 0x9, 0x25, 0x8, 0x1, 0x4, 0x2, 0x9, 0x2, 0x4, 0x3, 0x9, 0x3, 0x4, 
    0x4, 0x9, 0x4, 0x4, 0x5, 0x9, 0x5, 0x4, 0x6, 0x9, 0x6, 0x4, 0x7, 0x9, 
    0x7, 0x4, 0x8, 0x9, 0x8, 0x3, 0x2, 0x3, 0x2, 0x3, 0x2, 0x3, 0x3, 0x3, 
    0x3, 0x3, 0x3, 0x3, 0x4, 0x3, 0x4, 0x3, 0x4, 0x3, 0x5, 0x3, 0x5, 0x3, 
    0x6, 0x3, 0x6, 0x3, 0x7, 0x3, 0x7, 0x3, 0x8, 0x6, 0x8, 0x22, 0xa, 0x8, 
    0xd, 0x8, 0xe, 0x8, 0x23, 0x2, 0x2, 0x9, 0x3, 0x3, 0x5, 0x6, 0x7, 0x8, 
    0x9, 0x4, 0xb, 0x7, 0xd, 0x5, 0xf, 0x9, 0x3, 0x2, 0x3, 0x3, 0x2, 0x3e, 
    0x40, 0x2, 0x25, 0x2, 0x3, 0x3, 0x2, 0x2, 0x2, 0x2, 0x5, 0x3, 0x2, 0x2, 
    0x2, 0x2, 0x7, 0x3, 0x2, 0x2, 0x2, 0x2, 0x9, 0x3, 0x2, 0x2, 0x2, 0x2, 
    0xb, 0x3, 0x2, 0x2, 0x2, 0x2, 0xd, 0x3, 0x2, 0x2, 0x2, 0x2, 0xf, 0x3, 
    0x2, 0x2, 0x2, 0x3, 0x11, 0x3, 0x2, 0x2, 0x2, 0x5, 0x14, 0x3, 0x2, 0x2, 
    0x2, 0x7, 0x17, 0x3, 0x2, 0x2, 0x2, 0x9, 0x1a, 0x3, 0x2, 0x2, 0x2, 0xb, 
    0x1c, 0x3, 0x2, 0x2, 0x2, 0xd, 0x1e, 0x3, 0x2, 0x2, 0x2, 0xf, 0x21, 
    0x3, 0x2, 0x2, 0x2, 0x11, 0x12, 0x7, 0x3e, 0x2, 0x2, 0x12, 0x13, 0x7, 
    0x40, 0x2, 0x2, 0x13, 0x4, 0x3, 0x2, 0x2, 0x2, 0x14, 0x15, 0x7, 0x40, 
    0x2, 0x2, 0x15, 0x16, 0x7, 0x3f, 0x2, 0x2, 0x16, 0x6, 0x3, 0x2, 0x2, 
    0x2, 0x17, 0x18, 0x7, 0x3e, 0x2, 0x2, 0x18, 0x19, 0x7, 0x3f, 0x2, 0x2, 
    0x19, 0x8, 0x3, 0x2, 0x2, 0x2, 0x1a, 0x1b, 0x7, 0x3f, 0x2, 0x2, 0x1b, 
    0xa, 0x3, 0x2, 0x2, 0x2, 0x1c, 0x1d, 0x7, 0x3e, 0x2, 0x2, 0x1d, 0xc, 
    0x3, 0x2, 0x2, 0x2, 0x1e, 0x1f, 0x7, 0x40, 0x2, 0x2, 0x1f, 0xe, 0x3, 
    0x2, 0x2, 0x2, 0x20, 0x22, 0xa, 0x2, 0x2, 0x2, 0x21, 0x20, 0x3, 0x2, 
    0x2, 0x2, 0x22, 0x23, 0x3, 0x2, 0x2, 0x2, 0x23, 0x21, 0x3, 0x2, 0x2, 
    0x2, 0x23, 0x24, 0x3, 0x2, 0x2, 0x2, 0x24, 0x10, 0x3, 0x2, 0x2, 0x2, 
    0x4, 0x2, 0x23, 0x2, 
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
