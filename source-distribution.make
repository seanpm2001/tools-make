#
#   source-distribution.make
#
#   Makefile rules to build snapshots, source tgz etc
#
#   Copyright (C) 2000 Free Software Foundation, Inc.
#
#   Author: Adam Fedor <fedor@gnu.org>
#   Author: Nicola Pero <n.pero@mi.flashnet.it>
#  
#   This file is part of the GNUstep Makefile Package.
#
#   This library is free software; you can redistribute it and/or
#   modify it under the terms of the GNU General Public License
#   as published by the Free Software Foundation; either version 2
#   of the License, or (at your option) any later version.
#   
#   You should have received a copy of the GNU General Public
#   License along with this library; see the file COPYING.LIB.
#   If not, write to the Free Software Foundation,
#   59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.

#
# Interesting variables to define:
#
# PACKAGE_NAME = gnustep-base
# VERSION = 1.0.0
#

# prevent multiple inclusions
ifeq ($(TGZ_MAKE_LOADED),)
TGZ_MAKE_LOADED=yes

#
# Build a .tgz with the whole directory tree
#
tgz: distclean
	@echo "Generating the .tgz in the parent directory...";            \
	SNAPSHOT_DIR=`basename $$(pwd)`;                                   \
	cd ..;                                                             \
	if [ "$$SNAPSHOT_DIR" != "$(PACKAGE_NAME)-$(VERSION)" ]; then      \
	  mv $$SNAPSHOT_DIR $(PACKAGE_NAME)-$(VERSION);                    \
        fi;                                                                \
	tar cfz $(PACKAGE_NAME)-$(VERSION).tgz $(PACKAGE_NAME)-$(VERSION); \
	if [ "$$SNAPSHOT_DIR" != "$(PACKAGE_NAME)-$(VERSION)" ]; then      \
	  mv $(PACKAGE_NAME)-$(VERSION) $$SNAPSHOT_DIR;                    \
        fi;

targz:
	FIXME

endif
# source-distribution.make loaded

## Local variables:
## mode: makefile
## End:
