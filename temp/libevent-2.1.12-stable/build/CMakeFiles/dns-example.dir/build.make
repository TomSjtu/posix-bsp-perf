# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
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
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/builder/temp/libevent-2.1.12-stable

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/builder/temp/libevent-2.1.12-stable/build

# Include any dependencies generated for this target.
include CMakeFiles/dns-example.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/dns-example.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/dns-example.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/dns-example.dir/flags.make

CMakeFiles/dns-example.dir/sample/dns-example.c.o: CMakeFiles/dns-example.dir/flags.make
CMakeFiles/dns-example.dir/sample/dns-example.c.o: ../sample/dns-example.c
CMakeFiles/dns-example.dir/sample/dns-example.c.o: CMakeFiles/dns-example.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/builder/temp/libevent-2.1.12-stable/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/dns-example.dir/sample/dns-example.c.o"
	/opt/cross_env/rk3588s/gcc-linaro-11.3.1-2022.06-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/dns-example.dir/sample/dns-example.c.o -MF CMakeFiles/dns-example.dir/sample/dns-example.c.o.d -o CMakeFiles/dns-example.dir/sample/dns-example.c.o -c /home/builder/temp/libevent-2.1.12-stable/sample/dns-example.c

CMakeFiles/dns-example.dir/sample/dns-example.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/dns-example.dir/sample/dns-example.c.i"
	/opt/cross_env/rk3588s/gcc-linaro-11.3.1-2022.06-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/builder/temp/libevent-2.1.12-stable/sample/dns-example.c > CMakeFiles/dns-example.dir/sample/dns-example.c.i

CMakeFiles/dns-example.dir/sample/dns-example.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/dns-example.dir/sample/dns-example.c.s"
	/opt/cross_env/rk3588s/gcc-linaro-11.3.1-2022.06-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/builder/temp/libevent-2.1.12-stable/sample/dns-example.c -o CMakeFiles/dns-example.dir/sample/dns-example.c.s

# Object files for target dns-example
dns__example_OBJECTS = \
"CMakeFiles/dns-example.dir/sample/dns-example.c.o"

# External object files for target dns-example
dns__example_EXTERNAL_OBJECTS =

bin/dns-example: CMakeFiles/dns-example.dir/sample/dns-example.c.o
bin/dns-example: CMakeFiles/dns-example.dir/build.make
bin/dns-example: lib/libevent_extra-2.1.so.7.0.1
bin/dns-example: lib/libevent_core-2.1.so.7.0.1
bin/dns-example: CMakeFiles/dns-example.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/builder/temp/libevent-2.1.12-stable/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable bin/dns-example"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/dns-example.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/dns-example.dir/build: bin/dns-example
.PHONY : CMakeFiles/dns-example.dir/build

CMakeFiles/dns-example.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/dns-example.dir/cmake_clean.cmake
.PHONY : CMakeFiles/dns-example.dir/clean

CMakeFiles/dns-example.dir/depend:
	cd /home/builder/temp/libevent-2.1.12-stable/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/builder/temp/libevent-2.1.12-stable /home/builder/temp/libevent-2.1.12-stable /home/builder/temp/libevent-2.1.12-stable/build /home/builder/temp/libevent-2.1.12-stable/build /home/builder/temp/libevent-2.1.12-stable/build/CMakeFiles/dns-example.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/dns-example.dir/depend

