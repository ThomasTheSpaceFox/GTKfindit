#!/bin/bash

WHEREAMI="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd && echo)"
cd $WHEREAMI

export DIALOG='
<window title="GTK find it." image-name="icon.png">
  <vbox>
    <hbox>
      <pixmap>
        <input file>icon48.png</input>
      </pixmap>
      <text>
        <label>"GTKfindit"</label>
      </text>
    </hbox>
    <text>
      <label>"find what you need."</label>
    </text>
    <text>
      <label>"enter your search:"</label>
    </text>
    <text>
      <label>"tip: use wildcards like * and ?"</label>
    </text>
    <entry>
      <variable>FINDIT</variable>
    </entry>
    <text>
      <label>"enter directory to search under."</label>
    </text>
    <text>
      <label>"note: sub-directories are included."</label>
    </text>
    <entry>
      <variable>DIRECT</variable>
    </entry>
    <text>
      <label>"enter Terminal emulator (saved)"</label>
    </text>
    <entry>
      <variable>TERM</variable>
      <input file>"TERM.sav.txt"</input>
    </entry>
    <text>
      <label>"enter text editor (Saved)"</label>
    </text>
    <entry>
      <variable>TEXED</variable>
      <input file>"TEXED.sav.txt"</input>
    </entry>
    <hbox>
      <button ok></button>
      <button cancel></button>
    </hbox>
  </vbox>
</window>'
I=$IFS; IFS=""
for STATEMENTS in  $(gtkdialog --program DIALOG); do
  eval $STATEMENTS
done
IFS=$I

if [ "$EXIT" = "OK" ]; then
  echo "$FINDIT" > find.it.txt
  echo "$DIRECT" > find.direct.txt
  echo "$TEXED" > TEXED.sav.txt
  echo "$TERM" > TERM.sav.txt
  $TERM --title "GTKfindit -find what you need   search: $FINDIT directory: $DIRECT" -e $WHEREAMI/search2.sh
  $TEXED results.txt
else
  echo -n
fi
