#********************************************************************
#        _       _         _
#  _ __ | |_  _ | |  __ _ | |__   ___
# | '__|| __|(_)| | / _` || '_ \ / __|
# | |   | |_  _ | || (_| || |_) |\__ \
# |_|    \__|(_)|_| \__,_||_.__/ |___/
#
# www.rt-labs.com
# Copyright 2017 rt-labs AB, Sweden.
#
# This software is dual-licensed under GPLv3 and a commercial
# license. See the file LICENSE.md distributed with this software for
# full license information.
#*******************************************************************/

find_package(Canlib)

target_include_directories(canopen
  PRIVATE
  src/ports/windows
  )

target_sources(canopen
  PRIVATE
  src/ports/windows/coal_can.c
  )

target_compile_options(canopen
  PRIVATE
  /WX
  /wd4200
  /D _CRT_SECURE_NO_WARNINGS
  )

target_link_libraries(canopen
  PUBLIC
  Canlib
  INTERFACE
  $<$<CONFIG:Coverage>:--coverage>
  )

target_include_directories(slave
  PRIVATE
  src/ports/windows
  )

target_include_directories(slaveinfo
  PRIVATE
  src/ports/windows
  )

if (BUILD_TESTING)
  set(GOOGLE_TEST_INDIVIDUAL TRUE)
  target_include_directories(co_test
    PRIVATE
    src/ports/windows
    )
endif()
