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
include CMakeFiles/regress.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/regress.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/regress.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/regress.dir/flags.make

../test/regress.gen.c: ../event_rpcgen.py
../test/regress.gen.c: ../test/regress.rpc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/builder/temp/libevent-2.1.12-stable/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating ../test/regress.gen.c, ../test/regress.gen.h"
	cd /home/builder/temp/libevent-2.1.12-stable/test && /usr/bin/python3 ../event_rpcgen.py --quiet regress.rpc

../test/regress.gen.h: ../test/regress.gen.c
	@$(CMAKE_COMMAND) -E touch_nocreate ../test/regress.gen.h

CMakeFiles/regress.dir/test/regress.c.o: CMakeFiles/regress.dir/flags.make
CMakeFiles/regress.dir/test/regress.c.o: ../test/regress.c
CMakeFiles/regress.dir/test/regress.c.o: CMakeFiles/regress.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/builder/temp/libevent-2.1.12-stable/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/regress.dir/test/regress.c.o"
	/opt/cross_env/rk3588s/gcc-linaro-11.3.1-2022.06-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/regress.dir/test/regress.c.o -MF CMakeFiles/regress.dir/test/regress.c.o.d -o CMakeFiles/regress.dir/test/regress.c.o -c /home/builder/temp/libevent-2.1.12-stable/test/regress.c

CMakeFiles/regress.dir/test/regress.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/regress.dir/test/regress.c.i"
	/opt/cross_env/rk3588s/gcc-linaro-11.3.1-2022.06-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/builder/temp/libevent-2.1.12-stable/test/regress.c > CMakeFiles/regress.dir/test/regress.c.i

CMakeFiles/regress.dir/test/regress.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/regress.dir/test/regress.c.s"
	/opt/cross_env/rk3588s/gcc-linaro-11.3.1-2022.06-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/builder/temp/libevent-2.1.12-stable/test/regress.c -o CMakeFiles/regress.dir/test/regress.c.s

CMakeFiles/regress.dir/test/regress.gen.c.o: CMakeFiles/regress.dir/flags.make
CMakeFiles/regress.dir/test/regress.gen.c.o: ../test/regress.gen.c
CMakeFiles/regress.dir/test/regress.gen.c.o: CMakeFiles/regress.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/builder/temp/libevent-2.1.12-stable/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/regress.dir/test/regress.gen.c.o"
	/opt/cross_env/rk3588s/gcc-linaro-11.3.1-2022.06-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/regress.dir/test/regress.gen.c.o -MF CMakeFiles/regress.dir/test/regress.gen.c.o.d -o CMakeFiles/regress.dir/test/regress.gen.c.o -c /home/builder/temp/libevent-2.1.12-stable/test/regress.gen.c

CMakeFiles/regress.dir/test/regress.gen.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/regress.dir/test/regress.gen.c.i"
	/opt/cross_env/rk3588s/gcc-linaro-11.3.1-2022.06-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/builder/temp/libevent-2.1.12-stable/test/regress.gen.c > CMakeFiles/regress.dir/test/regress.gen.c.i

CMakeFiles/regress.dir/test/regress.gen.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/regress.dir/test/regress.gen.c.s"
	/opt/cross_env/rk3588s/gcc-linaro-11.3.1-2022.06-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/builder/temp/libevent-2.1.12-stable/test/regress.gen.c -o CMakeFiles/regress.dir/test/regress.gen.c.s

CMakeFiles/regress.dir/test/regress_buffer.c.o: CMakeFiles/regress.dir/flags.make
CMakeFiles/regress.dir/test/regress_buffer.c.o: ../test/regress_buffer.c
CMakeFiles/regress.dir/test/regress_buffer.c.o: CMakeFiles/regress.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/builder/temp/libevent-2.1.12-stable/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object CMakeFiles/regress.dir/test/regress_buffer.c.o"
	/opt/cross_env/rk3588s/gcc-linaro-11.3.1-2022.06-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/regress.dir/test/regress_buffer.c.o -MF CMakeFiles/regress.dir/test/regress_buffer.c.o.d -o CMakeFiles/regress.dir/test/regress_buffer.c.o -c /home/builder/temp/libevent-2.1.12-stable/test/regress_buffer.c

CMakeFiles/regress.dir/test/regress_buffer.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/regress.dir/test/regress_buffer.c.i"
	/opt/cross_env/rk3588s/gcc-linaro-11.3.1-2022.06-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/builder/temp/libevent-2.1.12-stable/test/regress_buffer.c > CMakeFiles/regress.dir/test/regress_buffer.c.i

CMakeFiles/regress.dir/test/regress_buffer.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/regress.dir/test/regress_buffer.c.s"
	/opt/cross_env/rk3588s/gcc-linaro-11.3.1-2022.06-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/builder/temp/libevent-2.1.12-stable/test/regress_buffer.c -o CMakeFiles/regress.dir/test/regress_buffer.c.s

CMakeFiles/regress.dir/test/regress_bufferevent.c.o: CMakeFiles/regress.dir/flags.make
CMakeFiles/regress.dir/test/regress_bufferevent.c.o: ../test/regress_bufferevent.c
CMakeFiles/regress.dir/test/regress_bufferevent.c.o: CMakeFiles/regress.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/builder/temp/libevent-2.1.12-stable/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object CMakeFiles/regress.dir/test/regress_bufferevent.c.o"
	/opt/cross_env/rk3588s/gcc-linaro-11.3.1-2022.06-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/regress.dir/test/regress_bufferevent.c.o -MF CMakeFiles/regress.dir/test/regress_bufferevent.c.o.d -o CMakeFiles/regress.dir/test/regress_bufferevent.c.o -c /home/builder/temp/libevent-2.1.12-stable/test/regress_bufferevent.c

CMakeFiles/regress.dir/test/regress_bufferevent.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/regress.dir/test/regress_bufferevent.c.i"
	/opt/cross_env/rk3588s/gcc-linaro-11.3.1-2022.06-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/builder/temp/libevent-2.1.12-stable/test/regress_bufferevent.c > CMakeFiles/regress.dir/test/regress_bufferevent.c.i

CMakeFiles/regress.dir/test/regress_bufferevent.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/regress.dir/test/regress_bufferevent.c.s"
	/opt/cross_env/rk3588s/gcc-linaro-11.3.1-2022.06-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/builder/temp/libevent-2.1.12-stable/test/regress_bufferevent.c -o CMakeFiles/regress.dir/test/regress_bufferevent.c.s

CMakeFiles/regress.dir/test/regress_dns.c.o: CMakeFiles/regress.dir/flags.make
CMakeFiles/regress.dir/test/regress_dns.c.o: ../test/regress_dns.c
CMakeFiles/regress.dir/test/regress_dns.c.o: CMakeFiles/regress.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/builder/temp/libevent-2.1.12-stable/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object CMakeFiles/regress.dir/test/regress_dns.c.o"
	/opt/cross_env/rk3588s/gcc-linaro-11.3.1-2022.06-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/regress.dir/test/regress_dns.c.o -MF CMakeFiles/regress.dir/test/regress_dns.c.o.d -o CMakeFiles/regress.dir/test/regress_dns.c.o -c /home/builder/temp/libevent-2.1.12-stable/test/regress_dns.c

CMakeFiles/regress.dir/test/regress_dns.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/regress.dir/test/regress_dns.c.i"
	/opt/cross_env/rk3588s/gcc-linaro-11.3.1-2022.06-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/builder/temp/libevent-2.1.12-stable/test/regress_dns.c > CMakeFiles/regress.dir/test/regress_dns.c.i

CMakeFiles/regress.dir/test/regress_dns.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/regress.dir/test/regress_dns.c.s"
	/opt/cross_env/rk3588s/gcc-linaro-11.3.1-2022.06-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/builder/temp/libevent-2.1.12-stable/test/regress_dns.c -o CMakeFiles/regress.dir/test/regress_dns.c.s

CMakeFiles/regress.dir/test/regress_et.c.o: CMakeFiles/regress.dir/flags.make
CMakeFiles/regress.dir/test/regress_et.c.o: ../test/regress_et.c
CMakeFiles/regress.dir/test/regress_et.c.o: CMakeFiles/regress.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/builder/temp/libevent-2.1.12-stable/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building C object CMakeFiles/regress.dir/test/regress_et.c.o"
	/opt/cross_env/rk3588s/gcc-linaro-11.3.1-2022.06-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/regress.dir/test/regress_et.c.o -MF CMakeFiles/regress.dir/test/regress_et.c.o.d -o CMakeFiles/regress.dir/test/regress_et.c.o -c /home/builder/temp/libevent-2.1.12-stable/test/regress_et.c

CMakeFiles/regress.dir/test/regress_et.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/regress.dir/test/regress_et.c.i"
	/opt/cross_env/rk3588s/gcc-linaro-11.3.1-2022.06-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/builder/temp/libevent-2.1.12-stable/test/regress_et.c > CMakeFiles/regress.dir/test/regress_et.c.i

CMakeFiles/regress.dir/test/regress_et.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/regress.dir/test/regress_et.c.s"
	/opt/cross_env/rk3588s/gcc-linaro-11.3.1-2022.06-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/builder/temp/libevent-2.1.12-stable/test/regress_et.c -o CMakeFiles/regress.dir/test/regress_et.c.s

CMakeFiles/regress.dir/test/regress_finalize.c.o: CMakeFiles/regress.dir/flags.make
CMakeFiles/regress.dir/test/regress_finalize.c.o: ../test/regress_finalize.c
CMakeFiles/regress.dir/test/regress_finalize.c.o: CMakeFiles/regress.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/builder/temp/libevent-2.1.12-stable/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building C object CMakeFiles/regress.dir/test/regress_finalize.c.o"
	/opt/cross_env/rk3588s/gcc-linaro-11.3.1-2022.06-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/regress.dir/test/regress_finalize.c.o -MF CMakeFiles/regress.dir/test/regress_finalize.c.o.d -o CMakeFiles/regress.dir/test/regress_finalize.c.o -c /home/builder/temp/libevent-2.1.12-stable/test/regress_finalize.c

CMakeFiles/regress.dir/test/regress_finalize.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/regress.dir/test/regress_finalize.c.i"
	/opt/cross_env/rk3588s/gcc-linaro-11.3.1-2022.06-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/builder/temp/libevent-2.1.12-stable/test/regress_finalize.c > CMakeFiles/regress.dir/test/regress_finalize.c.i

CMakeFiles/regress.dir/test/regress_finalize.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/regress.dir/test/regress_finalize.c.s"
	/opt/cross_env/rk3588s/gcc-linaro-11.3.1-2022.06-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/builder/temp/libevent-2.1.12-stable/test/regress_finalize.c -o CMakeFiles/regress.dir/test/regress_finalize.c.s

CMakeFiles/regress.dir/test/regress_http.c.o: CMakeFiles/regress.dir/flags.make
CMakeFiles/regress.dir/test/regress_http.c.o: ../test/regress_http.c
CMakeFiles/regress.dir/test/regress_http.c.o: CMakeFiles/regress.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/builder/temp/libevent-2.1.12-stable/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building C object CMakeFiles/regress.dir/test/regress_http.c.o"
	/opt/cross_env/rk3588s/gcc-linaro-11.3.1-2022.06-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/regress.dir/test/regress_http.c.o -MF CMakeFiles/regress.dir/test/regress_http.c.o.d -o CMakeFiles/regress.dir/test/regress_http.c.o -c /home/builder/temp/libevent-2.1.12-stable/test/regress_http.c

CMakeFiles/regress.dir/test/regress_http.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/regress.dir/test/regress_http.c.i"
	/opt/cross_env/rk3588s/gcc-linaro-11.3.1-2022.06-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/builder/temp/libevent-2.1.12-stable/test/regress_http.c > CMakeFiles/regress.dir/test/regress_http.c.i

CMakeFiles/regress.dir/test/regress_http.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/regress.dir/test/regress_http.c.s"
	/opt/cross_env/rk3588s/gcc-linaro-11.3.1-2022.06-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/builder/temp/libevent-2.1.12-stable/test/regress_http.c -o CMakeFiles/regress.dir/test/regress_http.c.s

CMakeFiles/regress.dir/test/regress_listener.c.o: CMakeFiles/regress.dir/flags.make
CMakeFiles/regress.dir/test/regress_listener.c.o: ../test/regress_listener.c
CMakeFiles/regress.dir/test/regress_listener.c.o: CMakeFiles/regress.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/builder/temp/libevent-2.1.12-stable/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building C object CMakeFiles/regress.dir/test/regress_listener.c.o"
	/opt/cross_env/rk3588s/gcc-linaro-11.3.1-2022.06-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/regress.dir/test/regress_listener.c.o -MF CMakeFiles/regress.dir/test/regress_listener.c.o.d -o CMakeFiles/regress.dir/test/regress_listener.c.o -c /home/builder/temp/libevent-2.1.12-stable/test/regress_listener.c

CMakeFiles/regress.dir/test/regress_listener.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/regress.dir/test/regress_listener.c.i"
	/opt/cross_env/rk3588s/gcc-linaro-11.3.1-2022.06-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/builder/temp/libevent-2.1.12-stable/test/regress_listener.c > CMakeFiles/regress.dir/test/regress_listener.c.i

CMakeFiles/regress.dir/test/regress_listener.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/regress.dir/test/regress_listener.c.s"
	/opt/cross_env/rk3588s/gcc-linaro-11.3.1-2022.06-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/builder/temp/libevent-2.1.12-stable/test/regress_listener.c -o CMakeFiles/regress.dir/test/regress_listener.c.s

CMakeFiles/regress.dir/test/regress_main.c.o: CMakeFiles/regress.dir/flags.make
CMakeFiles/regress.dir/test/regress_main.c.o: ../test/regress_main.c
CMakeFiles/regress.dir/test/regress_main.c.o: CMakeFiles/regress.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/builder/temp/libevent-2.1.12-stable/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building C object CMakeFiles/regress.dir/test/regress_main.c.o"
	/opt/cross_env/rk3588s/gcc-linaro-11.3.1-2022.06-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/regress.dir/test/regress_main.c.o -MF CMakeFiles/regress.dir/test/regress_main.c.o.d -o CMakeFiles/regress.dir/test/regress_main.c.o -c /home/builder/temp/libevent-2.1.12-stable/test/regress_main.c

CMakeFiles/regress.dir/test/regress_main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/regress.dir/test/regress_main.c.i"
	/opt/cross_env/rk3588s/gcc-linaro-11.3.1-2022.06-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/builder/temp/libevent-2.1.12-stable/test/regress_main.c > CMakeFiles/regress.dir/test/regress_main.c.i

CMakeFiles/regress.dir/test/regress_main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/regress.dir/test/regress_main.c.s"
	/opt/cross_env/rk3588s/gcc-linaro-11.3.1-2022.06-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/builder/temp/libevent-2.1.12-stable/test/regress_main.c -o CMakeFiles/regress.dir/test/regress_main.c.s

CMakeFiles/regress.dir/test/regress_minheap.c.o: CMakeFiles/regress.dir/flags.make
CMakeFiles/regress.dir/test/regress_minheap.c.o: ../test/regress_minheap.c
CMakeFiles/regress.dir/test/regress_minheap.c.o: CMakeFiles/regress.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/builder/temp/libevent-2.1.12-stable/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building C object CMakeFiles/regress.dir/test/regress_minheap.c.o"
	/opt/cross_env/rk3588s/gcc-linaro-11.3.1-2022.06-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/regress.dir/test/regress_minheap.c.o -MF CMakeFiles/regress.dir/test/regress_minheap.c.o.d -o CMakeFiles/regress.dir/test/regress_minheap.c.o -c /home/builder/temp/libevent-2.1.12-stable/test/regress_minheap.c

CMakeFiles/regress.dir/test/regress_minheap.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/regress.dir/test/regress_minheap.c.i"
	/opt/cross_env/rk3588s/gcc-linaro-11.3.1-2022.06-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/builder/temp/libevent-2.1.12-stable/test/regress_minheap.c > CMakeFiles/regress.dir/test/regress_minheap.c.i

CMakeFiles/regress.dir/test/regress_minheap.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/regress.dir/test/regress_minheap.c.s"
	/opt/cross_env/rk3588s/gcc-linaro-11.3.1-2022.06-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/builder/temp/libevent-2.1.12-stable/test/regress_minheap.c -o CMakeFiles/regress.dir/test/regress_minheap.c.s

CMakeFiles/regress.dir/test/regress_rpc.c.o: CMakeFiles/regress.dir/flags.make
CMakeFiles/regress.dir/test/regress_rpc.c.o: ../test/regress_rpc.c
CMakeFiles/regress.dir/test/regress_rpc.c.o: CMakeFiles/regress.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/builder/temp/libevent-2.1.12-stable/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_13) "Building C object CMakeFiles/regress.dir/test/regress_rpc.c.o"
	/opt/cross_env/rk3588s/gcc-linaro-11.3.1-2022.06-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/regress.dir/test/regress_rpc.c.o -MF CMakeFiles/regress.dir/test/regress_rpc.c.o.d -o CMakeFiles/regress.dir/test/regress_rpc.c.o -c /home/builder/temp/libevent-2.1.12-stable/test/regress_rpc.c

CMakeFiles/regress.dir/test/regress_rpc.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/regress.dir/test/regress_rpc.c.i"
	/opt/cross_env/rk3588s/gcc-linaro-11.3.1-2022.06-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/builder/temp/libevent-2.1.12-stable/test/regress_rpc.c > CMakeFiles/regress.dir/test/regress_rpc.c.i

CMakeFiles/regress.dir/test/regress_rpc.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/regress.dir/test/regress_rpc.c.s"
	/opt/cross_env/rk3588s/gcc-linaro-11.3.1-2022.06-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/builder/temp/libevent-2.1.12-stable/test/regress_rpc.c -o CMakeFiles/regress.dir/test/regress_rpc.c.s

CMakeFiles/regress.dir/test/regress_testutils.c.o: CMakeFiles/regress.dir/flags.make
CMakeFiles/regress.dir/test/regress_testutils.c.o: ../test/regress_testutils.c
CMakeFiles/regress.dir/test/regress_testutils.c.o: CMakeFiles/regress.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/builder/temp/libevent-2.1.12-stable/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_14) "Building C object CMakeFiles/regress.dir/test/regress_testutils.c.o"
	/opt/cross_env/rk3588s/gcc-linaro-11.3.1-2022.06-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/regress.dir/test/regress_testutils.c.o -MF CMakeFiles/regress.dir/test/regress_testutils.c.o.d -o CMakeFiles/regress.dir/test/regress_testutils.c.o -c /home/builder/temp/libevent-2.1.12-stable/test/regress_testutils.c

CMakeFiles/regress.dir/test/regress_testutils.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/regress.dir/test/regress_testutils.c.i"
	/opt/cross_env/rk3588s/gcc-linaro-11.3.1-2022.06-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/builder/temp/libevent-2.1.12-stable/test/regress_testutils.c > CMakeFiles/regress.dir/test/regress_testutils.c.i

CMakeFiles/regress.dir/test/regress_testutils.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/regress.dir/test/regress_testutils.c.s"
	/opt/cross_env/rk3588s/gcc-linaro-11.3.1-2022.06-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/builder/temp/libevent-2.1.12-stable/test/regress_testutils.c -o CMakeFiles/regress.dir/test/regress_testutils.c.s

CMakeFiles/regress.dir/test/regress_util.c.o: CMakeFiles/regress.dir/flags.make
CMakeFiles/regress.dir/test/regress_util.c.o: ../test/regress_util.c
CMakeFiles/regress.dir/test/regress_util.c.o: CMakeFiles/regress.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/builder/temp/libevent-2.1.12-stable/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_15) "Building C object CMakeFiles/regress.dir/test/regress_util.c.o"
	/opt/cross_env/rk3588s/gcc-linaro-11.3.1-2022.06-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/regress.dir/test/regress_util.c.o -MF CMakeFiles/regress.dir/test/regress_util.c.o.d -o CMakeFiles/regress.dir/test/regress_util.c.o -c /home/builder/temp/libevent-2.1.12-stable/test/regress_util.c

CMakeFiles/regress.dir/test/regress_util.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/regress.dir/test/regress_util.c.i"
	/opt/cross_env/rk3588s/gcc-linaro-11.3.1-2022.06-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/builder/temp/libevent-2.1.12-stable/test/regress_util.c > CMakeFiles/regress.dir/test/regress_util.c.i

CMakeFiles/regress.dir/test/regress_util.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/regress.dir/test/regress_util.c.s"
	/opt/cross_env/rk3588s/gcc-linaro-11.3.1-2022.06-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/builder/temp/libevent-2.1.12-stable/test/regress_util.c -o CMakeFiles/regress.dir/test/regress_util.c.s

CMakeFiles/regress.dir/test/tinytest.c.o: CMakeFiles/regress.dir/flags.make
CMakeFiles/regress.dir/test/tinytest.c.o: ../test/tinytest.c
CMakeFiles/regress.dir/test/tinytest.c.o: CMakeFiles/regress.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/builder/temp/libevent-2.1.12-stable/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_16) "Building C object CMakeFiles/regress.dir/test/tinytest.c.o"
	/opt/cross_env/rk3588s/gcc-linaro-11.3.1-2022.06-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/regress.dir/test/tinytest.c.o -MF CMakeFiles/regress.dir/test/tinytest.c.o.d -o CMakeFiles/regress.dir/test/tinytest.c.o -c /home/builder/temp/libevent-2.1.12-stable/test/tinytest.c

CMakeFiles/regress.dir/test/tinytest.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/regress.dir/test/tinytest.c.i"
	/opt/cross_env/rk3588s/gcc-linaro-11.3.1-2022.06-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/builder/temp/libevent-2.1.12-stable/test/tinytest.c > CMakeFiles/regress.dir/test/tinytest.c.i

CMakeFiles/regress.dir/test/tinytest.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/regress.dir/test/tinytest.c.s"
	/opt/cross_env/rk3588s/gcc-linaro-11.3.1-2022.06-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/builder/temp/libevent-2.1.12-stable/test/tinytest.c -o CMakeFiles/regress.dir/test/tinytest.c.s

CMakeFiles/regress.dir/test/regress_thread.c.o: CMakeFiles/regress.dir/flags.make
CMakeFiles/regress.dir/test/regress_thread.c.o: ../test/regress_thread.c
CMakeFiles/regress.dir/test/regress_thread.c.o: CMakeFiles/regress.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/builder/temp/libevent-2.1.12-stable/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_17) "Building C object CMakeFiles/regress.dir/test/regress_thread.c.o"
	/opt/cross_env/rk3588s/gcc-linaro-11.3.1-2022.06-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/regress.dir/test/regress_thread.c.o -MF CMakeFiles/regress.dir/test/regress_thread.c.o.d -o CMakeFiles/regress.dir/test/regress_thread.c.o -c /home/builder/temp/libevent-2.1.12-stable/test/regress_thread.c

CMakeFiles/regress.dir/test/regress_thread.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/regress.dir/test/regress_thread.c.i"
	/opt/cross_env/rk3588s/gcc-linaro-11.3.1-2022.06-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/builder/temp/libevent-2.1.12-stable/test/regress_thread.c > CMakeFiles/regress.dir/test/regress_thread.c.i

CMakeFiles/regress.dir/test/regress_thread.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/regress.dir/test/regress_thread.c.s"
	/opt/cross_env/rk3588s/gcc-linaro-11.3.1-2022.06-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/builder/temp/libevent-2.1.12-stable/test/regress_thread.c -o CMakeFiles/regress.dir/test/regress_thread.c.s

# Object files for target regress
regress_OBJECTS = \
"CMakeFiles/regress.dir/test/regress.c.o" \
"CMakeFiles/regress.dir/test/regress.gen.c.o" \
"CMakeFiles/regress.dir/test/regress_buffer.c.o" \
"CMakeFiles/regress.dir/test/regress_bufferevent.c.o" \
"CMakeFiles/regress.dir/test/regress_dns.c.o" \
"CMakeFiles/regress.dir/test/regress_et.c.o" \
"CMakeFiles/regress.dir/test/regress_finalize.c.o" \
"CMakeFiles/regress.dir/test/regress_http.c.o" \
"CMakeFiles/regress.dir/test/regress_listener.c.o" \
"CMakeFiles/regress.dir/test/regress_main.c.o" \
"CMakeFiles/regress.dir/test/regress_minheap.c.o" \
"CMakeFiles/regress.dir/test/regress_rpc.c.o" \
"CMakeFiles/regress.dir/test/regress_testutils.c.o" \
"CMakeFiles/regress.dir/test/regress_util.c.o" \
"CMakeFiles/regress.dir/test/tinytest.c.o" \
"CMakeFiles/regress.dir/test/regress_thread.c.o"

# External object files for target regress
regress_EXTERNAL_OBJECTS =

bin/regress: CMakeFiles/regress.dir/test/regress.c.o
bin/regress: CMakeFiles/regress.dir/test/regress.gen.c.o
bin/regress: CMakeFiles/regress.dir/test/regress_buffer.c.o
bin/regress: CMakeFiles/regress.dir/test/regress_bufferevent.c.o
bin/regress: CMakeFiles/regress.dir/test/regress_dns.c.o
bin/regress: CMakeFiles/regress.dir/test/regress_et.c.o
bin/regress: CMakeFiles/regress.dir/test/regress_finalize.c.o
bin/regress: CMakeFiles/regress.dir/test/regress_http.c.o
bin/regress: CMakeFiles/regress.dir/test/regress_listener.c.o
bin/regress: CMakeFiles/regress.dir/test/regress_main.c.o
bin/regress: CMakeFiles/regress.dir/test/regress_minheap.c.o
bin/regress: CMakeFiles/regress.dir/test/regress_rpc.c.o
bin/regress: CMakeFiles/regress.dir/test/regress_testutils.c.o
bin/regress: CMakeFiles/regress.dir/test/regress_util.c.o
bin/regress: CMakeFiles/regress.dir/test/tinytest.c.o
bin/regress: CMakeFiles/regress.dir/test/regress_thread.c.o
bin/regress: CMakeFiles/regress.dir/build.make
bin/regress: lib/libevent_extra-2.1.so.7.0.1
bin/regress: lib/libevent_pthreads-2.1.so.7.0.1
bin/regress: lib/libevent_core-2.1.so.7.0.1
bin/regress: CMakeFiles/regress.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/builder/temp/libevent-2.1.12-stable/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_18) "Linking C executable bin/regress"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/regress.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/regress.dir/build: bin/regress
.PHONY : CMakeFiles/regress.dir/build

CMakeFiles/regress.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/regress.dir/cmake_clean.cmake
.PHONY : CMakeFiles/regress.dir/clean

CMakeFiles/regress.dir/depend: ../test/regress.gen.c
CMakeFiles/regress.dir/depend: ../test/regress.gen.h
	cd /home/builder/temp/libevent-2.1.12-stable/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/builder/temp/libevent-2.1.12-stable /home/builder/temp/libevent-2.1.12-stable /home/builder/temp/libevent-2.1.12-stable/build /home/builder/temp/libevent-2.1.12-stable/build /home/builder/temp/libevent-2.1.12-stable/build/CMakeFiles/regress.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/regress.dir/depend

