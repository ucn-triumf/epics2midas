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
	-I. -I$(INC_DIR) -I$(DRV_DIR) -I$(EPICS_DIR)/include/os/Linux/ -I$(EPICS_DIR)/include/ -std=c++11   -ldl
LDFLAGS =

all: fe_epics fe_epics_beamline fe_epics_ucn2 fe_epics_ucn2_temperatures fe_epics_ucn2_pressures fe_epics_ucn2_other fe_epics_ucn2_phase2b fe_epics_ucn2_phase3 fe_epics_ucn2_phase5_pre fe_epics_ucn2_phase5_oth fe_epics_ucn2_phase5_tmp fe_epics_ucn2_fast fe_epics_ucn2_phase5_oth2 fe_epics_ucn2_pur


fe_epics:  $(LIB) $(LIB_DIR)/mfe.o frontend.o $(DRIVERS)
	$(CCXX) $(CFLAGS) -o fe_epics frontend.o $(LIB_DIR)/mfe.o $(DRIVERS) $(LIB) $(LDFLAGS) $(LIBS)

fe_epics_beamline:  $(LIB) $(LIB_DIR)/mfe.o frontend_beamline.o $(DRIVERS)
	$(CCXX) $(CFLAGS) -o fe_epics_beamline frontend_beamline.o $(LIB_DIR)/mfe.o $(DRIVERS) $(LIB) $(LDFLAGS) $(LIBS)

fe_epics_ucn2:  $(LIB) $(LIB_DIR)/mfe.o frontend_ucn2.o $(DRIVERS)
	$(CCXX) $(CFLAGS) -o fe_epics_ucn2 frontend_ucn2.o $(LIB_DIR)/mfe.o $(DRIVERS) $(LIB) $(LDFLAGS) $(LIBS)

fe_epics_ucn2_temperatures:  $(LIB) $(LIB_DIR)/mfe.o frontend_ucn2_temp.o $(DRIVERS)
	$(CCXX) $(CFLAGS) -o fe_epics_ucn2_temperatures frontend_ucn2_temp.o $(LIB_DIR)/mfe.o $(DRIVERS) $(LIB) $(LDFLAGS) $(LIBS)

fe_epics_ucn2_pressures:  $(LIB) $(LIB_DIR)/mfe.o frontend_ucn2_press.o $(DRIVERS)
	$(CCXX) $(CFLAGS) -o fe_epics_ucn2_pressures frontend_ucn2_press.o $(LIB_DIR)/mfe.o $(DRIVERS) $(LIB) $(LDFLAGS) $(LIBS)

fe_epics_ucn2_other:  $(LIB) $(LIB_DIR)/mfe.o frontend_ucn2_other.o $(DRIVERS)
	$(CCXX) $(CFLAGS) -o fe_epics_ucn2_other frontend_ucn2_other.o $(LIB_DIR)/mfe.o $(DRIVERS) $(LIB) $(LDFLAGS) $(LIBS)

fe_epics_ucn2_phase2b:  $(LIB) $(LIB_DIR)/mfe.o frontend_ucn2_phase2b.o $(DRIVERS)
	$(CCXX) $(CFLAGS) -o fe_epics_ucn2_phase2b frontend_ucn2_phase2b.o $(LIB_DIR)/mfe.o $(DRIVERS) $(LIB) $(LDFLAGS) $(LIBS)

fe_epics_ucn2_phase3:  $(LIB) $(LIB_DIR)/mfe.o frontend_ucn2_phase3.o $(DRIVERS)
	$(CCXX) $(CFLAGS) -o fe_epics_ucn2_phase3 frontend_ucn2_phase3.o $(LIB_DIR)/mfe.o $(DRIVERS) $(LIB) $(LDFLAGS) $(LIBS)


fe_epics_ucn2_phase5_pre:  $(LIB) $(LIB_DIR)/mfe.o frontend_ucn2_phase5_pre.o $(DRIVERS)
	$(CCXX) $(CFLAGS) -o fe_epics_ucn2_phase5_pre frontend_ucn2_phase5_pre.o $(LIB_DIR)/mfe.o $(DRIVERS) $(LIB) $(LDFLAGS) $(LIBS)

fe_epics_ucn2_phase5_oth:  $(LIB) $(LIB_DIR)/mfe.o frontend_ucn2_phase5_oth.o $(DRIVERS)
	$(CCXX) $(CFLAGS) -o fe_epics_ucn2_phase5_oth frontend_ucn2_phase5_oth.o $(LIB_DIR)/mfe.o $(DRIVERS) $(LIB) $(LDFLAGS) $(LIBS)


fe_epics_ucn2_phase5_oth2:  $(LIB) $(LIB_DIR)/mfe.o frontend_ucn2_phase5_oth2.o $(DRIVERS)
	$(CCXX) $(CFLAGS) -o fe_epics_ucn2_phase5_oth2 frontend_ucn2_phase5_oth2.o $(LIB_DIR)/mfe.o $(DRIVERS) $(LIB) $(LDFLAGS) $(LIBS)

fe_epics_ucn2_phase5_tmp:  $(LIB) $(LIB_DIR)/mfe.o frontend_ucn2_phase5_tmp.o $(DRIVERS)
	$(CCXX) $(CFLAGS) -o fe_epics_ucn2_phase5_tmp frontend_ucn2_phase5_tmp.o $(LIB_DIR)/mfe.o $(DRIVERS) $(LIB) $(LDFLAGS) $(LIBS)


fe_epics_ucn2_pur:  $(LIB) $(LIB_DIR)/mfe.o frontend_ucn2_pur.o $(DRIVERS)
	$(CCXX) $(CFLAGS) -o fe_epics_ucn2_pur frontend_ucn2_pur.o $(LIB_DIR)/mfe.o $(DRIVERS) $(LIB) $(LDFLAGS) $(LIBS)


fe_epics_ucn2_fast:  $(LIB) $(LIB_DIR)/mfe.o frontend_ucn2_fastepics.o $(DRIVERS)
	$(CCXX) $(CFLAGS) -o fe_epics_ucn2_fast frontend_ucn2_fastepics.o $(LIB_DIR)/mfe.o $(DRIVERS) $(LIB) $(LDFLAGS) $(LIBS)


frontend.o: frontend.c
	$(CC) $(CFLAGS) $(OSFLAGS) -c $< -o $@

frontend_beamline.o: frontend_beamline.c
	$(CC) $(CFLAGS) $(OSFLAGS) -c $< -o $@

frontend_ucn2.o: frontend_ucn2.c
	$(CC) $(CFLAGS) $(OSFLAGS) -c $< -o $@

frontend_ucn2_temp.o: frontend_ucn2_temp.c
	$(CC) $(CFLAGS) $(OSFLAGS) -c $< -o $@

frontend_ucn2_press.o: frontend_ucn2_press.c
	$(CC) $(CFLAGS) $(OSFLAGS) -c $< -o $@

frontend_ucn2_other.o: frontend_ucn2_other.c
	$(CC) $(CFLAGS) $(OSFLAGS) -c $< -o $@

frontend_ucn2_phase2b.o: frontend_ucn2_phase2b.c
	$(CC) $(CFLAGS) $(OSFLAGS) -c $< -o $@

frontend_ucn2_phase3.o: frontend_ucn2_phase3.c
	$(CC) $(CFLAGS) $(OSFLAGS) -c $< -o $@


frontend_ucn2_phase5_pre.o: frontend_ucn2_phase5_pre.c
	$(CC) $(CFLAGS) $(OSFLAGS) -c $< -o $@

frontend_ucn2_phase5_oth.o: frontend_ucn2_phase5_oth.c
	$(CC) $(CFLAGS) $(OSFLAGS) -c $< -o $@

frontend_ucn2_phase5_oth2.o: frontend_ucn2_phase5_oth2.c
	$(CC) $(CFLAGS) $(OSFLAGS) -c $< -o $@

frontend_ucn2_phase5_tmp.o: frontend_ucn2_phase5_tmp.c
	$(CC) $(CFLAGS) $(OSFLAGS) -c $< -o $@


frontend_ucn2_fastepics.o: frontend_ucn2_fastepics.c
	$(CC) $(CFLAGS) $(OSFLAGS) -c $< -o $@

generic.o: $(DRV_DIR)/generic.c
	$(CC) $(CFLAGS) $(OSFLAGS) -c $< -o $@

epics_ca.o: $(DRV_DIR)/epics_ca.c
	$(CC) $(CFLAGS) $(OSFLAGS) -c $< -o $@

.c.o:
	$(CC) $(CFLAGS) $(OSFLAGS) -c $<

clean:
	rm -f *.o *~ \#*
