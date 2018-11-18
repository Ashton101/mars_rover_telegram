################################################################################
#
# fluidsynth
#
################################################################################

FLUIDSYNTH_VERSION = v2.0.0
FLUIDSYNTH_SITE = $(call github,FluidSynth,fluidsynth,$(FLUIDSYNTH_VERSION))
FLUIDSYNTH_LICENSE = LGPL-2.1+
FLUIDSYNTH_LICENSE_FILES = LICENSE
FLUIDSYNTH_INSTALL_STAGING = YES
FLUIDSYNTH_DEPS = glib2

$(eval $(cmake-package))
