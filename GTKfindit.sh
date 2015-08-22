#!/bin/sh




export DIALOG='
<window title="GTK find it." image-name="/root/GTKfindit/icon.png">
  <vbox>
    <hbox>
      <pixmap>
        <input file>/root/GTKfindit/icon48.png</input>
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
      <input file>"/root/GTKfindit/TERM.sav.txt"</input>
    </entry>
    <text>
      <label>"enter text editor (Saved)"</label>
    </text>
    <entry>
      <variable>TEXED</variable>
      <input file>"/root/GTKfindit/TEXED.sav.txt"</input>
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
  echo "$FINDIT" > /root/GTKfindit/find.it.txt
  echo "$DIRECT" > /root/GTKfindit/find.direct.txt
  echo "$TEXED" > /root/GTKfindit/TEXED.sav.txt
  echo "$TERM" > /root/GTKfindit/TERM.sav.txt
  $TERM --title "GTKfindit -find what you need   search: $FINDIT directory: $DIRECT" -e /root/GTKfindit/search2.sh
  $TEXED /root/GTKfindit/results.txt
else
  echo -n
fi