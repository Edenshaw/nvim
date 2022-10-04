#!/bin/sh

NVIM_BEGINNER=~/.config/nvim
export NVIM_BEGINNER

alias dvim='XDG_DATA_HOME=$NVIM_BEGINNER/share XDG_CONFIG_HOME=$NVIM_BEGINNER nvim' 
export dvim

dvim
