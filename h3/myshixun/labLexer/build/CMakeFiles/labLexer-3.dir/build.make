# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/scarlett/Documents/compile/h3/myshixun/labLexer

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/scarlett/Documents/compile/h3/myshixun/labLexer/build

# Include any dependencies generated for this target.
include CMakeFiles/labLexer-3.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/labLexer-3.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/labLexer-3.dir/flags.make

antlr4cpp_generated_src/labLexer/labLexer.interp: ../grammar/labLexer.g4
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/scarlett/Documents/compile/h3/myshixun/labLexer/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building SampleGrammarLexer with ANTLR 4.8"
	cd /home/scarlett/Documents/compile/h3/myshixun/labLexer && /usr/bin/java -jar /bin/antlr-4.8-complete.jar /home/scarlett/Documents/compile/h3/myshixun/labLexer/grammar/labLexer.g4 -o /home/scarlett/Documents/compile/h3/myshixun/labLexer/build/antlr4cpp_generated_src/labLexer -no-listener -Dlanguage=Cpp -package antlr4

antlr4cpp_generated_src/labLexer/labLexer.tokens: antlr4cpp_generated_src/labLexer/labLexer.interp
	@$(CMAKE_COMMAND) -E touch_nocreate antlr4cpp_generated_src/labLexer/labLexer.tokens

antlr4cpp_generated_src/labLexer/labLexer.h: antlr4cpp_generated_src/labLexer/labLexer.interp
	@$(CMAKE_COMMAND) -E touch_nocreate antlr4cpp_generated_src/labLexer/labLexer.h

antlr4cpp_generated_src/labLexer/labLexer.cpp: antlr4cpp_generated_src/labLexer/labLexer.interp
	@$(CMAKE_COMMAND) -E touch_nocreate antlr4cpp_generated_src/labLexer/labLexer.cpp

CMakeFiles/labLexer-3.dir/src/labLexer-3.cpp.o: CMakeFiles/labLexer-3.dir/flags.make
CMakeFiles/labLexer-3.dir/src/labLexer-3.cpp.o: ../src/labLexer-3.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/scarlett/Documents/compile/h3/myshixun/labLexer/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/labLexer-3.dir/src/labLexer-3.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/labLexer-3.dir/src/labLexer-3.cpp.o -c /home/scarlett/Documents/compile/h3/myshixun/labLexer/src/labLexer-3.cpp

CMakeFiles/labLexer-3.dir/src/labLexer-3.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/labLexer-3.dir/src/labLexer-3.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/scarlett/Documents/compile/h3/myshixun/labLexer/src/labLexer-3.cpp > CMakeFiles/labLexer-3.dir/src/labLexer-3.cpp.i

CMakeFiles/labLexer-3.dir/src/labLexer-3.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/labLexer-3.dir/src/labLexer-3.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/scarlett/Documents/compile/h3/myshixun/labLexer/src/labLexer-3.cpp -o CMakeFiles/labLexer-3.dir/src/labLexer-3.cpp.s

CMakeFiles/labLexer-3.dir/antlr4cpp_generated_src/labLexer/labLexer.cpp.o: CMakeFiles/labLexer-3.dir/flags.make
CMakeFiles/labLexer-3.dir/antlr4cpp_generated_src/labLexer/labLexer.cpp.o: antlr4cpp_generated_src/labLexer/labLexer.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/scarlett/Documents/compile/h3/myshixun/labLexer/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/labLexer-3.dir/antlr4cpp_generated_src/labLexer/labLexer.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/labLexer-3.dir/antlr4cpp_generated_src/labLexer/labLexer.cpp.o -c /home/scarlett/Documents/compile/h3/myshixun/labLexer/build/antlr4cpp_generated_src/labLexer/labLexer.cpp

CMakeFiles/labLexer-3.dir/antlr4cpp_generated_src/labLexer/labLexer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/labLexer-3.dir/antlr4cpp_generated_src/labLexer/labLexer.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/scarlett/Documents/compile/h3/myshixun/labLexer/build/antlr4cpp_generated_src/labLexer/labLexer.cpp > CMakeFiles/labLexer-3.dir/antlr4cpp_generated_src/labLexer/labLexer.cpp.i

CMakeFiles/labLexer-3.dir/antlr4cpp_generated_src/labLexer/labLexer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/labLexer-3.dir/antlr4cpp_generated_src/labLexer/labLexer.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/scarlett/Documents/compile/h3/myshixun/labLexer/build/antlr4cpp_generated_src/labLexer/labLexer.cpp -o CMakeFiles/labLexer-3.dir/antlr4cpp_generated_src/labLexer/labLexer.cpp.s

# Object files for target labLexer-3
labLexer__3_OBJECTS = \
"CMakeFiles/labLexer-3.dir/src/labLexer-3.cpp.o" \
"CMakeFiles/labLexer-3.dir/antlr4cpp_generated_src/labLexer/labLexer.cpp.o"

# External object files for target labLexer-3
labLexer__3_EXTERNAL_OBJECTS =

labLexer-3: CMakeFiles/labLexer-3.dir/src/labLexer-3.cpp.o
labLexer-3: CMakeFiles/labLexer-3.dir/antlr4cpp_generated_src/labLexer/labLexer.cpp.o
labLexer-3: CMakeFiles/labLexer-3.dir/build.make
labLexer-3: ../lib/libantlr4-runtime.so.4.8
labLexer-3: CMakeFiles/labLexer-3.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/scarlett/Documents/compile/h3/myshixun/labLexer/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX executable labLexer-3"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/labLexer-3.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/labLexer-3.dir/build: labLexer-3

.PHONY : CMakeFiles/labLexer-3.dir/build

CMakeFiles/labLexer-3.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/labLexer-3.dir/cmake_clean.cmake
.PHONY : CMakeFiles/labLexer-3.dir/clean

CMakeFiles/labLexer-3.dir/depend: antlr4cpp_generated_src/labLexer/labLexer.interp
CMakeFiles/labLexer-3.dir/depend: antlr4cpp_generated_src/labLexer/labLexer.tokens
CMakeFiles/labLexer-3.dir/depend: antlr4cpp_generated_src/labLexer/labLexer.h
CMakeFiles/labLexer-3.dir/depend: antlr4cpp_generated_src/labLexer/labLexer.cpp
	cd /home/scarlett/Documents/compile/h3/myshixun/labLexer/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/scarlett/Documents/compile/h3/myshixun/labLexer /home/scarlett/Documents/compile/h3/myshixun/labLexer /home/scarlett/Documents/compile/h3/myshixun/labLexer/build /home/scarlett/Documents/compile/h3/myshixun/labLexer/build /home/scarlett/Documents/compile/h3/myshixun/labLexer/build/CMakeFiles/labLexer-3.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/labLexer-3.dir/depend

