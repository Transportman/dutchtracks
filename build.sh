#!/bin/bash
echo Preprocessing NML
cpp -C -E < src/dutchtracks.pnml > dutchtracks.nml
echo Writing version info
sed -i s/REPO_REVISION/$(hg parents --template="{rev}")/ dutchtracks.nml
echo Writing custom_tags
echo VERSION :r$(hg parents --template="{rev}")>custom_tags.txt
echo TITLE :Dutch Tracks r$(hg parents --template="{rev}")M>>custom_tags.txt
echo FILENAME :dutchtracks.grf>>custom_tags.txt
echo Running NML
nmlc -p DOS dutchtracks.nml
echo Done!
