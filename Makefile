# Generated automatically from Makefile.in by configure.
#							-*- Makefile -*-
# Makefile.in
#   $Id: Makefile.in,v 1.24 2002/01/27 20:56:56 elf Exp $
#
#  written by Oscar Levi
#  11 December 1998
#
#  This file is part of the project BSIGN.  See the file README for
#  more information.
#
#  Copyright (C) 1998 The Buici Company.
#
#  This program is free software; you can redistribute it and/or
#  modify it under the terms of the GNU General Public License as
#  published by the Free Software Foundation; either version 2 of the
#  License, or (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful, but
#  WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
#  General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  in a file called COPYING along with this program; if not, write to
#  the Free Software Foundation, Inc., 675 Mass Ave, Cambridge, MA
#  02139, USA.
#
#

.PHONY: install clean all version revision patch


#
# --- Project specification
#

TARGET=bsign
PACKAGE=bsign
O=o/
SRC=\
 main.cxx options.cxx sha1.c bsign.cxx conversion.cxx ds.cxx \
 exec.cxx files.cxx tty.cxx exitstatus.cxx filewalk.cc signal.cc

___OBJ=$(SRC:.cc=.o)
__OBJ=$(___OBJ:.c=.o)
_OBJ=$(__OBJ:.cxx=.o)
OBJ=$(_OBJ:.s=.o)

VERSION_HEADER=version.h
RELEASE_PATH=${HOME}/release

CC=gcc
CXX=c++
CFLAGS=-g -DHAVE_CONFIG_H
#CFLAGS_O=-O2
#CFLAGS_O=-O2 -fomit-frame-pointer
#CFLAGS_P=$(CFLAGS) -pg
CFLAGS_=-g $(CFLAGS_I) -Wall -Wno-parentheses -Wno-unused $(CFLAGS_O) $(CFLAGS_P)
CXXFLAGS=$(CFLAGS)
CXXFLAGS_=$(CFLAGS_)
LFLAGS=-g -static  
#LFLAGS=-g  
#LFLAGS=-pg ${LFLAGS}
DEPEND=depend.m
ECHO=@/bin/echo
INSTALL=/usr/bin/install -c
INSTALL_PROGRAM=${INSTALL}
INSTALL_DATA=${INSTALL} -m 644

#
# --- Autoconf generated symbols
#

srcdir = .
prefix = /usr/local
exec_prefix = ${prefix}
bindir = ${exec_prefix}/bin
docdir = $(prefix)/share/doc/$(PACKAGE)
infodir = ${prefix}/info
mandir = $(prefix)/share/man/

# This is removed because it generates a line in the Makefile.in that
# breaks the use of 'make -f Makefile.in distclean' from
# debian/rules.  Besides, we don't call make on subdirectories.
# 

#
# --- Implicit rules
#

vpath %.o $O

%.o: %.c
	$(make_o)
	$(ECHO) $(CC) -c $(CFLAGS) -o $O$@ $<
	@$(CC) -c $(CFLAGS) $(CFLAGS_) -o $O$@ $<

$O%.o: %.c
	$(make_o)
	$(ECHO) $(CC) -c $(CFLAGS) -o $@ $<
	@$(CC) -c $(CFLAGS) $(CFLAGS_) -o $@ $<

%.o: %.cxx
	$(make_o)
	$(ECHO) $(CXX) -c $(CXXFLAGS) -o $O$@ $<
	@$(CXX) -c $(CXXFLAGS) $(CXXFLAGS_) -o $O$@ $<

$O%.o: %.cc
	$(make_o)
	$(ECHO) $(CXX) -c $(CFLAGS) -o $@ $<
	@$(CXX) -c $(CXXFLAGS) $(CXXFLAGS_) -o $@ $<

%.o: %.cc
	$(make_o)
	$(ECHO) $(CXX) -c $(CXXFLAGS) -o $O$@ $<
	@$(CXX) -c $(CXXFLAGS) $(CXXFLAGS_) -o $O$@ $<

$O%.o: %.cxx
	$(make_o)
	$(ECHO) $(CXX) -c $(CFLAGS) -o $@ $<
	@$(CXX) -c $(CXXFLAGS) $(CXXFLAGS_) -o $@ $<

%.o: %.s
	$(make_o)
	$(ECHO) $(AS) $(AFLAGS) -o $O$@ $<
	@$(AS) $(AFLAGS) $(AFLAGS_) -o $O$@ $<

$O%.o: %.s
	$(make_o)
	$(ECHO) $(AS) $(AFLAGS) -o $@ $<
	@$(AS) $(AFLAGS) $(AFLAGS_) -o $@ $<

%.i: %.cxx
	$(CXX) -c $(CXXFLAGS) $(CXXFLAGS_) -E -o $(notdir $@) $<

%.s: %.cxx
	$(CXX) -c $(CXXFLAGS) $(CXXFLAGS_) -S -o $@ $<

%.i: %.cc
	$(CXX) -c $(CXXFLAGS) $(CXXFLAGS_) -E -o $(notdir $@) $<

%.s: %.cc
	$(CXX) -c $(CXXFLAGS) $(CXXFLAGS_) -S -o $@ $<

%.s: %.c
	$(CC) -c $(CFLAGS) $(CFLAGS_) -S -o $@ $<

#
# --- Primary targets
#

all: check_depend make_o _version.h $O$(TARGET) $(TARGET)

.PHONY: make_o
make_o:
	@if test ! -d $O ;\
	 then echo === Creating \'$O\' output directory ; mkdir $O ; fi

$O$(TARGET): $(OBJ)
	$(CXX) -o $@ $(addprefix $O,$(OBJ)) $(LFLAGS) 
	cp $@ $@-unstripped
	strip $@
# This is here in case we find a way to prevent linkage against libstdc++
#	$(CC) -o $@ $(addprefix $O,$(OBJ)) $(LFLAGS) 

$(TARGET): $O$(TARGET)
	@echo -- Linking $(TARGET) to $O$(TARGET)
	@-ln -s $O$(TARGET) .

clean:
ifneq "$O" ""
	-rm -rf $O
else
	-rm $(OBJ)
endif
	-rm *.i
	-rm build

.PHONY: dist_clean distclean
dist_clean distclean: clean
	-rm -f \#* *~ *.sed *.i *.cod
	-rm -f config.cache config.status config.log
	-chmod +w Makefile config.h
	-rm Makefile config.h $(DEPEND)

.PHONY: debclean
debclean: distclean

#
# --- Version and Build Engineering
#

.version: .version_major .version_minor .version_patch
	@/bin/echo -n `cat .version_major`.`cat .version_minor`.`cat \
		.version_patch`  > .version

_version.h: .version
	@/bin/echo -e \#define SZ_VERSION \"`cat .version`\"  > _version.h

.PHONY: transmit
transmit: # distribution-archive
	@distftp.sh ${PACKAGE} \
	  ${RELEASE_PATH}/${PACKAGE}-`cat .version`.ANNOUNCEMENT \
	  ${RELEASE_PATH}/${PACKAGE}-`cat .version`.README \
	  ${RELEASE_PATH}/${PACKAGE}-`cat .version`.lsm \
	  ${RELEASE_PATH}/${PACKAGE}_`cat .version`_i386.deb \
	  ${RELEASE_PATH}/${PACKAGE}-`cat .version`.tar.gz

version.sed: _version.h
	@echo Creating version-specific sed script...
	@/bin/echo s/\<\<version\>\>/`cat .version`/ > version.sed
	@/bin/echo s/\<\<date\>\>/`date +"%d%b%y" \
	 | sed -e y/abceglnoprtuvy/ABCEGLNOPRTUVY/`/ >> version.sed
	@/bin/echo s/\<\<tar-file\>\>/${PACKAGE}-`cat .version`.tar.gz/ \
	 >> version.sed
	@/bin/echo s/\<\<lsm-file\>\>/${PACKAGE}-`cat .version`.lsm/ >> version.sed

.PHONY: ${PACKAGE}.lsm
${PACKAGE}.lsm: version.sed LSM
	@echo Creating LSM file...
	@if test -f *.lsm ; then rm *.lsm ; fi
	@sed -f version.sed LSM > ${PACKAGE}-`cat .version`.lsm

.PHONY: ${PACKAGE}.ANNOUNCEMENT
${PACKAGE}.ANNOUNCEMENT: version.sed ANNOUNCEMENT
	@echo Creating ANNOUNCEMENT file...
	@if test -f *.ANNOUNCEMENT ; then rm *.ANNOUNCEMENT ; fi
	@sed -f version.sed ANNOUNCEMENT \
	   > ${PACKAGE}-`cat .version`.ANNOUNCEMENT
	@cat ${PACKAGE}-`cat .version`.lsm \
	  >> ${PACKAGE}-`cat .version`.ANNOUNCEMENT

.PHONY: ${PACKAGE}.README
${PACKAGE}.README: version.sed README
	@echo Creating README file...
	@if test -f *.README ; then rm *.README ; fi
	@sed -f version.sed README  > ${PACKAGE}-`cat .version`.README

.PHONY: distribution-archive da
distribution-archive da: ${PACKAGE}.lsm ${PACKAGE}.ANNOUNCEMENT ${PACKAGE}.README dist_clean
	@echo Creating distribution archive...
	@/bin/sh -c "if test -x ../${PACKAGE}-`cat .version`;\
		then rm ../${PACKAGE}-`cat .version` ; fi"
	@ln -s ${PACKAGE} ../${PACKAGE}-`cat .version`
	@find . -path CVS -prune\
		-o -path o -prune\
		-o -regex .\*/${PACKAGE} -prune\
		-o -regex .\*/configure -prune\
		-o -regex .\*/mkinstalldirs -prune\
		-o -regex .\*/rules -prune\
		-o -regex .\*/config.status -prune\
		-o -regex .\*\.o -prune\
		-o -type f -exec chmod 644 \{\} \;
	@/bin/sh -c 'cd .. ; V=`cat ${PACKAGE}/.version` ;\
		tar zcf ${PACKAGE}-$$V.tar.gz\
		`find ${PACKAGE}-$$V/\
		 -regex .\*/CVS -prune\
		 -regex .\*/debian/package -prune\
		 -o -regex .\*~ -prune\
		 -o -regex .\*/o -prune\
		 -o -regex .\*\\\\.o -prune\
		 -o -regex .\*\\\\.a -prune\
		 -o -regex .\*\\\\.m -prune\
		 -o -regex .\*\\\\.bmp -prune\
		 -o -regex .\*\\\\.terminfo -prune\
		 -o -regex .\*\\\\.gpg -prune\
		 -o -regex .\*\\\\.asc -prune\
		 -o -regex .\*/${PACKAGE} -prune\
		 -o -regex .\*/Makefile -prune\
		 -o -regex .\*/config.cache -prune\
		 -o -regex .\*/config.h -prune\
		 -o -regex .\*/config.log -prune\
		 -o -regex .\*/config.status -prune\
		 -o -regex .\*/configure.scan -prune\
		 -o -regex .\*/log -prune\
		 -o -regex .\*/gmon.out -prune\
		 -o -regex .\*/\.cvsignore -prune\
		 -o -regex .\*/\.gdbinit -prune\
		 -o -regex .\*/NOTES -prune\
		 -o -regex .\*/patches -prune\
		 -o -type f -print | sort`'
	@-rm ../${PACKAGE}-`cat .version`
	@echo Moving distribution file to ${RELEASE_PATH}...
	@mv ../${PACKAGE}-`cat .version`.tar.gz ${RELEASE_PATH}
	@mv ${PACKAGE}-`cat .version`.* ${RELEASE_PATH}

#.PHONY: announce
#announce:
#	@echo -n "CurVeS " > _announce
#	@cat .version >> _announce
#	@echo " -- console UI for CVS" >> _announce
#	@echo "Posting to comp.os.linux.announce..."
#	@cat ${RELEASE_PATH}/${PACKAGE}-`cat .version`.lsm \
#	 | mail -s "`cat _announce`" linux-announce@news.ornl.gov
#	@echo "Updating LSM..."
#	@cat ${RELEASE_PATH}/${PACKAGE}-`cat .version`.lsm \
#	 | mail -s "add" lsm@execpc.com
#	@rm _announce

#
# --- Installation
#

.PHONY: install installdirs

install: installdirs $(TARGET)
# hello.info
	$(INSTALL_PROGRAM) $(TARGET) $(bindir)/$(binprefix)
	strip $(bindir)/$(binprefix)/$(TARGET)
	$(INSTALL_DATA) bsign_sign $(docdir)/scripts
	$(INSTALL_DATA) bsign_verify $(docdir)/scripts
	$(INSTALL_DATA) bsign_hash $(docdir)/scripts
	$(INSTALL_DATA) bsign_check $(docdir)/scripts
	$(INSTALL_DATA) ${PACKAGE}.1 $(mandir)/man1
installdirs:
	$(srcdir)/mkinstalldirs $(bindir) $(docdir) $(docdir)/scripts $(mandir)/man1

#
# --- Dependencies: depend.m
#

.PHONY: depend check_depend

depend: _version.h $(DEPEND)
$(DEPEND) depend: _version.h # $(SRC)
	$(CXX) $(CFLAGS_I) -DHAVE_CONFIG_H -M $(SRC) > $(DEPEND)

check_depend:
	@if test ! -s ${DEPEND} ; then \
	 echo "-- Use 'make depend' to create dependencies file." \
              "  Continuing without it." ; fi	

#
# --- Include dependencies always.  Configure creates an empty file
#
ifneq "$(wildcard $(DEPEND))" ""
include ${DEPEND}
endif
