#!/bin/sh

NVIM_BEGINNER=~/.config/nvim-neo
export NVIM_BEGINNER

alias xvim='XDG_DATA_HOME=$NVIM_BEGINNER/share XDG_CONFIG_HOME=$NVIM_BEGINNER nvim' 
export xvim

xvim
