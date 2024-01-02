# Alternative GNU Make project makefile autogenerated by Premake

ifndef config
  config=debug
endif

ifndef verbose
  SILENT = @
endif

.PHONY: clean prebuild

SHELLTYPE := posix
ifeq (.exe,$(findstring .exe,$(ComSpec)))
	SHELLTYPE := msdos
endif

# Configurations
# #############################################

RESCOMP = windres
INCLUDES += -Iapp/include -Ilibs/CppProject/include
FORCE_INCLUDE +=
ALL_CPPFLAGS += $(CPPFLAGS) -MD -MP $(DEFINES) $(INCLUDES)
ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -m64
ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CPPFLAGS) -m64
ALL_RESFLAGS += $(RESFLAGS) $(DEFINES) $(INCLUDES)
ALL_LDFLAGS += $(LDFLAGS) -L/usr/lib64 -m64 -s
LINKCMD = $(CXX) -o "$@" $(OBJECTS) $(RESOURCES) $(ALL_LDFLAGS) $(LIBS)
define PREBUILDCMDS
endef
define PRELINKCMDS
endef
define POSTBUILDCMDS
endef

ifeq ($(config),debug)
TARGETDIR = bin/linux-x86_64/Debug
TARGET = $(TARGETDIR)/ProjectCreator
OBJDIR = bin/Intermediates/linux-x86_64/Debug
DEFINES +=
LIBS += bin/linux-x86_64/Debug/CppProject/libCppProject.a
LDDEPS += bin/linux-x86_64/Debug/CppProject/libCppProject.a

else ifeq ($(config),release)
TARGETDIR = bin/linux-x86_64/Release
TARGET = $(TARGETDIR)/ProjectCreator
OBJDIR = bin/Intermediates/linux-x86_64/Release
DEFINES +=
LIBS += bin/linux-x86_64/Release/CppProject/libCppProject.a
LDDEPS += bin/linux-x86_64/Release/CppProject/libCppProject.a

else ifeq ($(config),dist)
TARGETDIR = bin/linux-x86_64/Dist
TARGET = $(TARGETDIR)/ProjectCreator
OBJDIR = bin/Intermediates/linux-x86_64/Dist
DEFINES +=
LIBS += bin/linux-x86_64/Dist/CppProject/libCppProject.a
LDDEPS += bin/linux-x86_64/Dist/CppProject/libCppProject.a

else ifeq ($(config),publish)
TARGETDIR = ../Scripts
TARGET = $(TARGETDIR)/ProjectCreator
OBJDIR = bin/Intermediates/linux-x86_64/Publish
DEFINES += -DPUBLISH
LIBS += bin/linux-x86_64/Publish/CppProject/libCppProject.a
LDDEPS += bin/linux-x86_64/Publish/CppProject/libCppProject.a

endif

# Per File Configurations
# #############################################


# File sets
# #############################################

GENERATED :=
OBJECTS :=

GENERATED += $(OBJDIR)/ProjectCreator.o
GENERATED += $(OBJDIR)/app.o
OBJECTS += $(OBJDIR)/ProjectCreator.o
OBJECTS += $(OBJDIR)/app.o

# Rules
# #############################################

all: $(TARGET)
	@:

$(TARGET): $(GENERATED) $(OBJECTS) $(LDDEPS) | $(TARGETDIR)
	$(PRELINKCMDS)
	@echo Linking ProjectCreator
	$(SILENT) $(LINKCMD)
	$(POSTBUILDCMDS)

$(TARGETDIR):
	@echo Creating $(TARGETDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(TARGETDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(TARGETDIR))
endif

$(OBJDIR):
	@echo Creating $(OBJDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(OBJDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(OBJDIR))
endif

clean:
	@echo Cleaning ProjectCreator
ifeq (posix,$(SHELLTYPE))
	$(SILENT) rm -f  $(TARGET)
	$(SILENT) rm -rf $(GENERATED)
	$(SILENT) rm -rf $(OBJDIR)
else
	$(SILENT) if exist $(subst /,\\,$(TARGET)) del $(subst /,\\,$(TARGET))
	$(SILENT) if exist $(subst /,\\,$(GENERATED)) del /s /q $(subst /,\\,$(GENERATED))
	$(SILENT) if exist $(subst /,\\,$(OBJDIR)) rmdir /s /q $(subst /,\\,$(OBJDIR))
endif

prebuild: | $(OBJDIR)
	$(PREBUILDCMDS)

ifneq (,$(PCH))
$(OBJECTS): $(GCH) | $(PCH_PLACEHOLDER)
$(GCH): $(PCH) | prebuild
	@echo $(notdir $<)
	$(SILENT) $(CXX) -x c++-header $(ALL_CXXFLAGS) -o "$@" -MF "$(@:%.gch=%.d)" -c "$<"
$(PCH_PLACEHOLDER): $(GCH) | $(OBJDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) touch "$@"
else
	$(SILENT) echo $null >> "$@"
endif
else
$(OBJECTS): | prebuild
endif


# File Rules
# #############################################

$(OBJDIR)/ProjectCreator.o: app/src/ProjectCreator.cpp
	@echo "$(notdir $<)"
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/app.o: app/src/app.cpp
	@echo "$(notdir $<)"
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"

-include $(OBJECTS:%.o=%.d)
ifneq (,$(PCH))
  -include $(PCH_PLACEHOLDER).d
endif