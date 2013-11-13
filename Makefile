#!gmake -f

define [DOCUMENTATION](http://daringfireball.net/projects/markdown/)

#DESCRIPTION

  This file creates a vimball of the .vim personalization files specified in
  the files.txt file.  Assumes GNU make 3.8.1 and a GNU tar 2.8.3 or later.

#INSTRUCTIONS

  Use make with one of the following phony targets

  - *vimball* creates the vimball for installation

  - *update* fetches updates from GitHub. Assumes you have a git repository
    and git installed.

  - *fetch* copies your personal changes from your installation to this
    directory. You may then add, commit and submit a merge request to me for
    consideration/inclusion. Please describe what your changes accomplish and
    why they are important to you. Or just keep them in your own special branch.

endef

.PHONY: default help vimball update fetch

# Useful scripts
# $(call Find_executable,PROGRAM_NAME) expands to full path of the executable if found; otherwise, empty
Find_executable:=$(firstword $(wildcard $(foreach pgm,$1,$(addsuffix /${pgm},$(subst :, ,${PATH})))))

# Variables
UVMFILES := uvm_files.txt
HERE     := $(shell pwd)
DATE     := $(shell date +%Y%m%d)
UVMBALL  := $(HERE)/dcblack_uvm-$(DATE).vmb
# Following works on both MacOS X and Linux
VIM_BIN  := $(firstword $(wildcard /Applications/MacVim.app/Contents/MacOS/Vim $(call Find_executable,PROGRAM_NAME)))
MAKEFILE_RULES := $(realpath $(lastword $(MAKEFILE_LIST)))

# Shortcuts

default: help

vimball: $(UVMBALL)

# The rules

help:
	perl -ne 'if(m/^define..DOCUMENTATION./..m/endef/){print;}' ${MAKEFILE_RULES}

ORIG:=$(wildcard \
	 $(addprefix ${HOME}/.vim/,$(strip\
	   $(shell cat uvm_files.txt)\
      )))

fetch:
	for f in ${ORIG}; do d=$$(echo $$f | perl -pe 's{.*vim/}{};s{/.*}{};');rsync -auvP $$f $$d/; done

update:
	git pull

doc/README_uvm.html: README.md
	markdown --html4tags $? >$@

$(UVMFILES): $(shell grep -v '#' $(UVMFILES)) Makefile
	touch $@

$(UVMBALL): $(UVMFILES)
	$(VIM_BIN) -c "let g:vimball_home='.'" -c '%MkVimball! $@' -c quit $<
	@echo "Created $@"

# The end
