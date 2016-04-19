#!/usr/bin/env bash

if [[ -n "$BASH_VERSION" && -f "$HOME/.bashrc" ]]; then
  source "$HOME/.bashrc"
fi

dirs=(
  '/bin'
  '/sbin'
  '/usr/bin'
  '/usr/sbin'
  '/usr/local/bin'
  '/usr/local/sbin'
  '/usr/games'
  '/usr/local/games'
  "$HOME/.rakudobrew/bin"
  "$HOME/.rvm/bin"
  "$(ruby -e 'print Gem.user_dir')/bin"
  "$HOME/.npm/bin"
  "$HOME/.cabal/bin"
  "$HOME/.local/bin"
)

export PATH=''
for d in "${dirs[@]}"; do
  if [[ -d "$d" ]]; then
    PATH="$d:$PATH"
  fi
done

export PATH

export INFINALITY_FT_FILTER_PARAMS='10 35 40 35 10'
export INFINALITY_FT_AUTOHINT_HORIZONTAL_STEM_DARKEN_STRENGTH=0
export INFINALITY_FT_AUTOHINT_VERTICAL_STEM_DARKEN_STRENGTH=0
export INFINALITY_FT_AUTOHINT_INCREASE_GLYPH_HEIGHTS=false
export INFINALITY_FT_AUTOHINT_SNAP_STEM_HEIGHT=0
export INFINALITY_FT_GAMMA_CORRECTION='0 100'
export INFINALITY_FT_BRIGHTNESS=0
export INFINALITY_FT_CONTRAST=0
export INFINALITY_FT_CHROMEOS_STYLE_SHARPENING_STRENGTH=5
export INFINALITY_FT_WINDOWS_STYLE_SHARPENING_STRENGTH=0
export INFINALITY_FT_FRINGE_FILTER_STRENGTH=5
export INFINALITY_FT_GRAYSCALE_FILTER_STRENGTH=10
export INFINALITY_FT_STEM_ALIGNMENT_STRENGTH=0
export INFINALITY_FT_STEM_FITTING_STRENGTH=0
export INFINALITY_FT_STEM_SNAPPING_SLIDING_SCALE=0
export INFINALITY_FT_USE_KNOWN_SETTINGS_ON_SELECTED_FONTS=true
export INFINALITY_FT_USE_VARIOUS_TWEAKS=true
