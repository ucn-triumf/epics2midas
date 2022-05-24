#####################################################################
#
#  Name:         Makefile
#  Created by:   Stefan Ritt
#
#  Contents:     UNIX Makefile for MIDAS EPICS slow control frontend
#
#  $Id$
#
#####################################################################

#--------------------------------------------------------------------
# The following lines contain specific switches for different UNIX
# systems. Find the one which matches your OS and outcomment the 
# lines below.

# This is for Linux ----------------
LIBS = -lbsd -lm -lutil -lpthread -lrt
OSFLAGS = -DOS_LINUX

# This is for OSF1 -----------------
#LIBS = -lbsd
#OSFLAGS = -DOS_OSF1

# This is for Ultrix ---------------
#LIBS =
#OSFLAGS = -DOS_ULTRIX -Dextname

# This is for FreeBSD --------------
#LIBS = -lbsd -lcompat
#OSFLAGS = -DOS_FREEBSD

#-------------------------------------------------------------------
# The following lines define direcories. Adjust if necessary
#                 
INC_DIR 	= $(MIDASSYS)/include
LIB_DIR 	= $(MIDASSYS)/lib
DRV_DIR		= .
EPICS_DIR       = $(HOME)/packages/epics/base-3.14.9
EPICS_LIBDIR    = $(HOME)/packages/epics/base-3.14.9/lib/linux-x86_64
#-------------------------------------------------------------------
# Drivers needed by the frontend program
#                 
DRIVERS         = generic.o epics_ca.o

####################################################################
# Lines below here should not be edited
####################################################################

LIB = $(LIB_DIR)/libmidas.a $(EPICS_LIBDIR)/libca.a $(EPICS_LIBDIR)/libCom.a

# compiler
CC = g++
CCXX = g++
CFLAGS = -g -Wall \
	-I. -I$(INC_DIR) -I$(DRV_DIR) -I$(EPICS_DIR)/include/os/Linux/ -I$(EPICS_DIR)/include/ -std=c++11   
LDFLAGS =

all: fe_epics fe_epics_beamline fe_epics_ucn2

fe_epics:  $(LIB) $(LIB_DIR)/mfe.o frontend.o $(DRIVERS)
	$(CCXX) $(CFLAGS) -o fe_epics frontend.o $(LIB_DIR)/mfe.o $(DRIVERS) $(LIB) $(LDFLAGS) $(LIBS)

fe_epics_beamline:  $(LIB) $(LIB_DIR)/mfe.o frontend_beamline.o $(DRIVERS)
	$(CCXX) $(CFLAGS) -o fe_epics_beamline frontend_beamline.o $(LIB_DIR)/mfe.o $(DRIVERS) $(LIB) $(LDFLAGS) $(LIBS)

fe_epics_ucn2:  $(LIB) $(LIB_DIR)/mfe.o frontend_ucn2.o $(DRIVERS)
	$(CCXX) $(CFLAGS) -o fe_epics_ucn2 frontend_ucn2.o $(LIB_DIR)/mfe.o $(DRIVERS) $(LIB) $(LDFLAGS) $(LIBS)


frontend.o: frontend.c
	$(CC) $(CFLAGS) $(OSFLAGS) -c $< -o $@

frontend_beamline.o: frontend_beamline.c
	$(CC) $(CFLAGS) $(OSFLAGS) -c $< -o $@

frontend_ucn2.o: frontend_ucn2.c
	$(CC) $(CFLAGS) $(OSFLAGS) -c $< -o $@

generic.o: $(DRV_DIR)/generic.c
	$(CC) $(CFLAGS) $(OSFLAGS) -c $< -o $@

epics_ca.o: $(DRV_DIR)/epics_ca.c
	$(CC) $(CFLAGS) $(OSFLAGS) -c $< -o $@

.c.o:
	$(CC) $(CFLAGS) $(OSFLAGS) -c $<

clean:
	rm -f *.o *~ \#*
