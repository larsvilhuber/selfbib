#!/bin/bash
# add any packages here that are missing in the "custom" image.
tlmgr update --self || exit 1
tlmgr install biblatex-chicago