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
include CMakeFiles/event_pthreads_shared.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/event_pthreads_shared.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/event_pthreads_shared.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/event_pthreads_shared.dir/flags.make

CMakeFiles/event_pthreads_shared.dir/evthread_pthread.c.o: CMakeFiles/event_pthreads_shared.dir/flags.make
CMakeFiles/event_pthreads_shared.dir/evthread_pthread.c.o: ../evthread_pthread.c
CMakeFiles/event_pthreads_shared.dir/evthread_pthread.c.o: CMakeFiles/event_pthreads_shared.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/builder/temp/libevent-2.1.12-stable/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/event_pthreads_shared.dir/evthread_pthread.c.o"
	/opt/cross_env/rk3588s/gcc-linaro-11.3.1-2022.06-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/event_pthreads_shared.dir/evthread_pthread.c.o -MF CMakeFiles/event_pthreads_shared.dir/evthread_pthread.c.o.d -o CMakeFiles/event_pthreads_shared.dir/evthread_pthread.c.o -c /home/builder/temp/libevent-2.1.12-stable/evthread_pthread.c

CMakeFiles/event_pthreads_shared.dir/evthread_pthread.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/event_pthreads_shared.dir/evthread_pthread.c.i"
	/opt/cross_env/rk3588s/gcc-linaro-11.3.1-2022.06-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/builder/temp/libevent-2.1.12-stable/evthread_pthread.c > CMakeFiles/event_pthreads_shared.dir/evthread_pthread.c.i

CMakeFiles/event_pthreads_shared.dir/evthread_pthread.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/event_pthreads_shared.dir/evthread_pthread.c.s"
	/opt/cross_env/rk3588s/gcc-linaro-11.3.1-2022.06-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/builder/temp/libevent-2.1.12-stable/evthread_pthread.c -o CMakeFiles/event_pthreads_shared.dir/evthread_pthread.c.s

# Object files for target event_pthreads_shared
event_pthreads_shared_OBJECTS = \
"CMakeFiles/event_pthreads_shared.dir/evthread_pthread.c.o"

# External object files for target event_pthreads_shared
event_pthreads_shared_EXTERNAL_OBJECTS =

lib/libevent_pthreads-2.1.so.7.0.1: CMakeFiles/event_pthreads_shared.dir/evthread_pthread.c.o
lib/libevent_pthreads-2.1.so.7.0.1: CMakeFiles/event_pthreads_shared.dir/build.make
lib/libevent_pthreads-2.1.so.7.0.1: lib/libevent_core-2.1.so.7.0.1
lib/libevent_pthreads-2.1.so.7.0.1: CMakeFiles/event_pthreads_shared.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/builder/temp/libevent-2.1.12-stable/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C shared library lib/libevent_pthreads-2.1.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/event_pthreads_shared.dir/link.txt --verbose=$(VERBOSE)
	$(CMAKE_COMMAND) -E cmake_symlink_library lib/libevent_pthreads-2.1.so.7.0.1 lib/libevent_pthreads-2.1.so.7 lib/libevent_pthreads-2.1.so
	cd /home/builder/temp/libevent-2.1.12-stable/build/lib && /usr/bin/cmake -E create_symlink libevent_pthreads-2.1.so.7.0.1 libevent_pthreads.so

lib/libevent_pthreads-2.1.so.7: lib/libevent_pthreads-2.1.so.7.0.1
	@$(CMAKE_COMMAND) -E touch_nocreate lib/libevent_pthreads-2.1.so.7

lib/libevent_pthreads-2.1.so: lib/libevent_pthreads-2.1.so.7.0.1
	@$(CMAKE_COMMAND) -E touch_nocreate lib/libevent_pthreads-2.1.so

# Rule to build all files generated by this target.
CMakeFiles/event_pthreads_shared.dir/build: lib/libevent_pthreads-2.1.so
.PHONY : CMakeFiles/event_pthreads_shared.dir/build

CMakeFiles/event_pthreads_shared.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/event_pthreads_shared.dir/cmake_clean.cmake
.PHONY : CMakeFiles/event_pthreads_shared.dir/clean

CMakeFiles/event_pthreads_shared.dir/depend:
	cd /home/builder/temp/libevent-2.1.12-stable/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/builder/temp/libevent-2.1.12-stable /home/builder/temp/libevent-2.1.12-stable /home/builder/temp/libevent-2.1.12-stable/build /home/builder/temp/libevent-2.1.12-stable/build /home/builder/temp/libevent-2.1.12-stable/build/CMakeFiles/event_pthreads_shared.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/event_pthreads_shared.dir/depend

