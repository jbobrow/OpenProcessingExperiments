
// This file separates out all things related to chords (buttons, fret lookup, etc)

// This hashmap takes chord strings as keys and returns the fret numbers for the 6 strings
HashMap<String, int[]> chordMap = new HashMap<String, int[]>();
ControlGroup chordGroup;
MultiList chords, chordTypes;  // the buttons
String currChord = "c";
String currChordType = "major";
final int BACKGROUND_COLOR = -16763310;
final int ACTIVE_COLOR = -16211249;

/**
 * Here is where we enter all the fret numbers for all the chords.
 * a fret of -1 means a muted string. 0 is open.
 */
void loadChords() {
  //major chords
  chordMap.put("cmajor", new int[] {
    3, 3, 2, 0, 1, 0
  }
  );
  chordMap.put("c#major", new int[] {
    -1, 4, 6, 6, 6, 4
  }
  );
  chordMap.put("dmajor", new int[] {
    -1, -1, 0, 2, 3, 2
  }
  );
  chordMap.put("d#major", new int[] {
    -1, 6, 8, 8, 8, 6
  }
  );
  chordMap.put("emajor", new int[] {
    0, 2, 2, 1, 0, 0
  }
  );
  chordMap.put("fmajor", new int[] {
    1, 3, 3, 2, 1, 1
  }
  );
  chordMap.put("f#major", new int[] {
    2, 4, 4, 3, 2, 2
  }
  );
  chordMap.put("gmajor", new int[] {
    3, 2, 0, 0, 0, 3
  }
  );
  chordMap.put("gmajor", new int[] {
    3, 2, 0, 0, 0, 3
  }
  );
  chordMap.put("g#major", new int[] {
    4, 6, 6, 5, 4, 4
  }
  );
  chordMap.put("amajor", new int[] {
    -1, 0, 2, 2, 2, 0
  }
  );
  chordMap.put("a#major", new int[] {
    -1, 1, 3, 3, 3, 1
  }
  );
  chordMap.put("bmajor", new int[] {
    -1, 2, 4, 4, 4, 2
  }
  );
  //minors
  chordMap.put("cminor", new int[] {
    -1, 3, 5, 5, 4, 3
  }
  );
  chordMap.put("c#minor", new int[] {
    -1, 4, 6, 6, 5, 4
  }
  );
  chordMap.put("dminor", new int[] {
    -1, -1, 0, 2, 3, 1
  }
  );
  chordMap.put("d#minor", new int[] {
    -1, 6, 8, 8, 7, 6
  }
  );
  chordMap.put("eminor", new int[] {
    0, 2, 2, 0, 0, 0
  }
  );
  chordMap.put("fminor", new int[] {
    1, 3, 3, 1, 1, 1
  }
  );
  chordMap.put("f#minor", new int[] {
    2, 4, 4, 2, 2, 2
  }
  );
  chordMap.put("gminor", new int[] {
    3, 5, 5, 3, 3, 3
  }
  );
  chordMap.put("g#minor", new int[] {
    4, 6, 6, 4, 4, 4
  }
  );
  chordMap.put("aminor", new int[] {
    -1, 0, 2, 2, 1, 0
  }
  );
  chordMap.put("a#minor", new int[] {
    -1, 1, 3, 3, 2, 1
  }
  );
  chordMap.put("bminor", new int[] {
    -1, 2, 4, 4, 3, 2
  }
  );
  //6s
  chordMap.put("c6", new int[] {
    -1, 3, 2, 2, 1, 0
  }
  );
  chordMap.put("c#6", new int[] {
    -1, 4, 6, 6, 6, 6
  }
  );
  chordMap.put("d6", new int[] {
    -1, -1, 0, 2, 0, 2
  }
  );
  chordMap.put("d#6", new int[] {
    -1, -1, 1, 3, 1, 3
  }
  );
  chordMap.put("e6", new int[] {
    0, 2, 2, 1, 2, 0
  }
  );
  chordMap.put("f6", new int[] {
    -1, -1, 3, 2, 3, 1
  }
  );
  chordMap.put("f#6", new int[] {
    -1, -1, 4, 3, 4, 2
  }
  );
  chordMap.put("g6", new int[] {
    3, 2, 0, 0, 0, 0
  }
  );
  chordMap.put("g#6", new int[] {
    -1, -1, 6, 5, 6, 4
  }
  );
  chordMap.put("a6", new int[] {
    -1, 0, 2, 2, 2, 2
  }
  );
  chordMap.put("a#6", new int[] {
    -1, -1, 8, 7, 8, 6
  }
  );
  chordMap.put("b6", new int[] {
    -1, 2, 1, 1, 0, 2
  }
  );
  //7s
  chordMap.put("c7", new int[] {
    -1, 3, 2, 3, 1, 0
  }
  );
  chordMap.put("c#7", new int[] {
    -1, 4, 6, 4, 6, 4
  }
  );
  chordMap.put("d7", new int[] {
    -1, -1, 0, 2, 1, 2
  }
  );
  chordMap.put("d#7", new int[] {
    -1, -1, 1, 3, 2, 3
  }
  );
  chordMap.put("e7", new int[] {
    0, 2, 0, 1, 0, 0
  }
  );
  chordMap.put("f7", new int[] {
    1, 3, 1, 2, 1, 1
  }
  );
  chordMap.put("f#7", new int[] {
    2, 4, 2, 3, 2, 2
  }
  );
  chordMap.put("g7", new int[] {
    3, 2, 0, 0, 0, 1
  }
  );
  chordMap.put("g#7", new int[] {
    4, 6, 4, 5, 4, 4
  }
  );
  chordMap.put("a7", new int[] {
    -1, 0, 2, 0, 2, 0
  }
  );
  chordMap.put("a#7", new int[] {
    -1, 1, 3, 1, 3, 0
  }
  );
  chordMap.put("b7", new int[] {
    -1, 2, 1, 2, 0, 2
  }
  );
  //maj7s
  chordMap.put("cmaj7", new int[] {
    -1, 3, 2, 0, 0, 0
  }
  );
  chordMap.put("c#maj7", new int[] {
    -1, 4, 6, 5, 6, 4
  }
  );
  chordMap.put("dmaj7", new int[] {
    -1, -1, 0, 2, 2, 2
  }
  );
  chordMap.put("d#maj7", new int[] {
    -1, -1, 1, 3, 3, 3
  }
  );
  chordMap.put("emaj7", new int[] {
    0, 2, 2, 4, 4, 4
  }
  );
  chordMap.put("fmaj7", new int[] {
    -1, -1, 3, 2, 1, 0
  }
  );
  chordMap.put("f#maj7", new int[] {
    -1, -1, 4, 3, 2, 1
  }
  );
  chordMap.put("gmaj7", new int[] {
    3, 2, 0, 0, 0, 2
  }
  );
  chordMap.put("g#maj7", new int[] {
    -1, -1, 6, 5, 4, 3
  }
  );
  chordMap.put("amaj7", new int[] {
    -1, 0, 2, 1, 2, 0
  }
  );
  chordMap.put("a#maj7", new int[] {
    -1, 1, 3, 2, 3, 0
  }
  );
  chordMap.put("bmaj7", new int[] {
    -1, 2, 4, 3, 4, 2
  }
  );
  //m6s
  chordMap.put("cm6", new int[] {
    8, 10, 10, 8, 10, 8
  }
  );
  chordMap.put("c#m6", new int[] {
    9, 11, 11, 9, 11, 9
  }
  );
  chordMap.put("dm6", new int[] {
    -1, -1, 0, 2, 0, 1
  }
  );
  chordMap.put("d#m6", new int[] {
    -1, -1, 1, 3, 1, 2
  }
  );
  chordMap.put("em6", new int[] {
    0, 2, 2, 0, 2, 0
  }
  );
  chordMap.put("fm6", new int[] {
    1, 3, 3, 1, 3, 1
  }
  );
  chordMap.put("f#m6", new int[] {
    2, 4, 4, 2, 4, 2
  }
  );
  chordMap.put("gm6", new int[] {
    3, 5, 5, 3, 5, 3
  }
  );
  chordMap.put("g#m6", new int[] {
    4, 6, 6, 4, 6, 4
  }
  );
  chordMap.put("am6", new int[] {
    -1, 0, 2, 2, 1, 2
  }
  );
  chordMap.put("a#m6", new int[] {
    6, 8, 8, 6, 8, 6
  }
  );
  chordMap.put("bm6", new int[] {
    7, 9, 9, 8, 9, 7
  }
  );
  //m7s
  chordMap.put("cm7", new int[] {
    -1, 3, 5, 3, 4, 3
  }
  );
  chordMap.put("c#m7", new int[] {
    -1, 4, 6, 4, 5, 4
  }
  );
  chordMap.put("dm7", new int[] {
    -1, -1, 0, 2, 1, 1
  }
  );
  chordMap.put("d#m7", new int[] {
    -1, -1, 1, 3, 2, 2
  }
  );
  chordMap.put("em7", new int[] {
    0, 2, 2, 0, 3, 0
  }
  );
  chordMap.put("fm7", new int[] {
    1, 3, 3, 1, 4, 1
  }
  );
  chordMap.put("f#m7", new int[] {
    2, 4, 4, 2, 5, 2
  }
  );
  chordMap.put("gm7", new int[] {
    3, 5, 5, 3, 6, 3
  }
  );
  chordMap.put("g#m7", new int[] {
    4, 6, 6, 4, 7, 4
  }
  );
  chordMap.put("am7", new int[] {
    -1, 0, 2, 0, 1, 0
  }
  );
  chordMap.put("a#m7", new int[] {
    -1, 1, 3, 1, 2, 1
  }
  );
  chordMap.put("bm7", new int[] {
    -1, 2, 4, 2, 3, 2
  }
  );
  //dims
  chordMap.put("cdim", new int[] {
    -1, 3, 4, 5, 4, -1
  }
  );
  chordMap.put("c#dim", new int[] {
    -1, 4, 5, 6, 5, -1
  }
  );
  chordMap.put("ddim", new int[] {
    -1, -1, 0, 1, 3, 1
  }
  );
  chordMap.put("d#dim", new int[] {
    -1, 6, 7, 8, 7, -1
  }
  );
  chordMap.put("edim", new int[] {
    -1, 7, 8, 9, 8, -1
  }
  );
  chordMap.put("fdim", new int[] {
    -1, 8, 9, 10, 9, -1
  }
  );
  chordMap.put("f#dim", new int[] {
    -1, 9, 10, 11, 10, -1
  }
  );
  chordMap.put("gdim", new int[] {
    -1, 10, 11, 12, 11, -1
  }
  );
  chordMap.put("g#dim", new int[] {
    4, 5, 6, 4, -1, -1
  }
  );
  chordMap.put("adim", new int[] {
    5, 6, 7, 5, -1, -1
  }
  );
  chordMap.put("a#dim", new int[] {
    6, 7, 8, 6, -1, -1
  }
  );
  chordMap.put("bdim", new int[] {
    7, 8, 9, 7, -1, -1
  }
  );
  //augs
  chordMap.put("caug", new int[] {
    -1, 3, 2, 1, 1, 0
  }
  );
  chordMap.put("c#aug", new int[] {
    -1, 4, 3, 2, 2, -1
  }
  );
  chordMap.put("daug", new int[] {
    -1, -1, 0, 3, 3, 2
  }
  );
  chordMap.put("d#aug", new int[] {
    -1, 6, 5, 4, 4, -1
  }
  );
  chordMap.put("eaug", new int[] {
    0, 3, 2, 1, 1, 0
  }
  );
  chordMap.put("faug", new int[] {
    -1, 8, 7, 6, 6, -1
  }
  );
  chordMap.put("f#aug", new int[] {
    -1, 9, 8, 7, 7, -1
  }
  );
  chordMap.put("gaug", new int[] {
    3, 2, 1, 0, 0, 3
  }
  );
  chordMap.put("g#aug", new int[] {
    -1, 11, 10, 9, 9, -1
  }
  );
  chordMap.put("aaug", new int[] {
    -1, 0, 3, 2, 2, 1
  }
  );
  chordMap.put("a#aug", new int[] {
    6, 5, 4, 7, -1, -1
  }
  );
  chordMap.put("baug", new int[] {
    7, 6, 5, 0, 0, -1
  }
  );
  //sus's
  chordMap.put("csus", new int[] {
    -1, 3, 3, 0, 1, 1
  }
  );
  chordMap.put("c#sus", new int[] {
    -1, 4, 6, 6, 7, 4
  }
  );
  chordMap.put("dsus", new int[] {
    -1, -1, 0, 2, 3, 3
  }
  );
  chordMap.put("d#sus", new int[] {
    -1, 6, 8, 8, 6, 6
  }
  );
  chordMap.put("esus", new int[] {
    0, 2, 2, 2, 0, 0
  }
  );
  chordMap.put("fsus", new int[] {
    1, 3, 3, 3, 1, 1
  }
  );
  chordMap.put("f#sus", new int[] {
    2, 4, 4, 4, 2, 2
  }
  );
  chordMap.put("gsus", new int[] {
    3, 3, 0, 0, 1, 3
  }
  );
  chordMap.put("g#sus", new int[] {
    4, 6, 6, 6, 4, 4
  }
  );
  chordMap.put("asus", new int[] {
    -1, 0, 2, 2, 3, 0
  }
  );
  chordMap.put("a#sus", new int[] {
    -1, 1, 3, 3, 4, 1
  }
  );
  chordMap.put("bsus", new int[] {
    -1, 2, 4, 4, 5, 2
  }
  );
}

void loadChordButtons() {
  chordGroup = controlP5.addGroup("chordGroup", guitarX, 20);
  chordGroup.setBackgroundHeight(guitarY*4/5);
  chordGroup.setBarHeight(13);
  chordGroup.setWidth(100);
  chordGroup.setBackgroundColor(color(60, 128));
  chordGroup.captionLabel().setFont(ControlP5.grixel);
  chordGroup.setLabel("chords"); // controlP5 bug: need to reset label after font change
  chords = controlP5.addMultiList("chords", 5, 5, 30, chordGroup.getBackgroundHeight()/14);
  chords.setGroup(chordGroup);
  chords.add("c", 0);
  chords.add("c#", 1);
  chords.add("d", 2);
  chords.add("d#", 3);
  chords.add("e", 4);
  chords.add("f", 5);
  chords.add("f#", 6);
  chords.add("g", 7);
  chords.add("g#", 8);
  chords.add("a", 9);
  chords.add("a#", 10);
  chords.add("b", 11);
  chordTypes = controlP5.addMultiList("chordTypes", 37, 5, 40, chordGroup.getBackgroundHeight()/14);
  chordTypes.setGroup(chordGroup);
  chordTypes.add("major", 0);
  chordTypes.add("minor", 1);
  chordTypes.add("6", 2);
  chordTypes.add("7", 3);
  chordTypes.add("maj7", 4);
  chordTypes.add("m6", 5);
  chordTypes.add("m7", 6);
  chordTypes.add("dim", 7);
  chordTypes.add("aug", 8);
  chordTypes.add("sus", 9);
  controlP5.addSlider("volume", 0, 1, .8, (int)chordGroup.position().x, (int)chordGroup.position().y + chordGroup.getBackgroundHeight(), chordGroup.getWidth(), 10);
  controlP5.controller("volume").setColorLabel(0);
}

/* Place the finger markers for all strings */
void setChord(String chord) {
  if (chordMap.containsKey(chord)) {
    int[] frets = chordMap.get(chord);
    markers.clear();
    for (int i = 0; i < 6; ++i) {
      if (frets[i] > 0)
        markers.add(new FingerMarker(strings[i], (frets[i])));
      else
        strings[i].setFret(frets[i]);
    }
  }
}

void volume(float value) {
  for (int i = 0; i < samples.length; ++i)
    samples[i].setVolume(value*VOLUME_MAX);
}

/**
 * Called when we click a chord button.  Update the current chord.
 */
void chords(int value) {
  handleClicks(value, chords);
}

/**
 * Called when we click a chord-type button.  Update the current chord.
 */
void chordTypes(int value) {
  handleClicks(value, chordTypes);
}

void handleClicks(int value, MultiList ml) {
  controlP5.Controller chosen = ml.subelements().get(value);
  if (ml.equals(chords)) {
    currChord = chosen.getLabel();
  } 
  else {
    currChordType = chosen.getLabel();
  }
  // manually make it so that the current selected chord
  // is highlighted in the active color (controlP5 does not do this)
  for (controlP5.Controller c : ml.subelements())
    c.setColorBackground(BACKGROUND_COLOR);
  chosen.setColorBackground(ACTIVE_COLOR);
  setChord(currChord + currChordType);
}

void keyPressed() {
  switch(key) {
  case 'c' : 
  case 'B' : 
    handleClicks(0, chords); 
    break;
  case 'C' : 
    handleClicks(1, chords); 
    break;
  case 'd' : 
    handleClicks(2, chords); 
    break;
  case 'D' : 
    handleClicks(3, chords); 
    break;
  case 'e' : 
    handleClicks(4, chords); 
    break;
  case 'E' : 
  case 'f' : 
    handleClicks(5, chords); 
    break;
  case 'F' : 
    handleClicks(6, chords); 
    break;
  case 'g' : 
    handleClicks(7, chords); 
    break;
  case 'G' : 
    handleClicks(8, chords); 
    break;
  case 'a' : 
    handleClicks(9, chords); 
    break;
  case 'A' : 
    handleClicks(10, chords); 
    break;
  case 'b' : 
    handleClicks(11, chords); 
    break;
  }
}


