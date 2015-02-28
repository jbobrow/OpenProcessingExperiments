
// Creative Computing March 20th 2014
// Example on using minim, files and GUI.
// Learn the basics of OO programming


import ddf.minim.*;

class sketCh{
sketCh(){
}
// A ClickEvent object (that will trigger the sound)
ClickEvent clckEvent;
ChooseSoundFile chsSndFl;
Minim minim;

void setup() {
  size(400, 400, P2D);
  // start up Minim
  minim = new Minim(this);

  // Create a new ClickEvent, this is windows path-naming and referencing
  // For Mac machines use the pathfile name from the root
  // Please change the file location and name before testing
  clckEvent = new ClickEvent(150, 100, 32, "C://Users/Toshiba_Qosmio/Downloads/processing-2.1.1-windows64/processing-2.1.1/modes/java/libraries/minim/examples/PlayAFile/data/marcus_kellis_theme.mp3");
  smooth();
}

void draw() {
  background(100, 100, 126);
  // Show the ClickEvent
  clckEvent.display(mouseX, mouseY);
  clckEvent.jiggle();
}

void mousePressed() {
  // If the user clicks on the ClickEvent, play the sound!
  clckEvent.noRing();
  if (clckEvent.contains(mouseX, mouseY)) {
    chsSndFl= new ChooseSoundFile(this);
    if (chsSndFl.getSndFleName()!=null) {

      clckEvent.setSndFile(chsSndFl.getSndFleName());
      clckEvent.ring();
    }
    else {
      clckEvent.ring();
    }
  }
}

// Close the sound files
public void stop() {
  // The ClickEvent object must close its sound.
  clckEvent.close(); 
  super.stop();
}
}
// Creative Computing March 20th 2014
// Example on using minim, files and GUI.
// Learn the basics of OO programming


// A ClickEvent object (that will trigger the sound)
ClickEvent clckEvent;
ChooseSoundFile chsSndFl;
Minim minim;

void setup() {
  size(400, 400, P2D);
  // start up Minim
  minim = new Minim(this);

  // Create a new ClickEvent, this is windows path-naming and referencing
  // For Mac machines use the pathfile name from the root
  // Please change the file location and name before testing
  clckEvent = new ClickEvent(150, 100, 32, "C://Users/Toshiba_Qosmio/Downloads/processing-2.1.1-windows64/processing-2.1.1/modes/java/libraries/minim/examples/PlayAFile/data/marcus_kellis_theme.mp3");
  smooth();
}

void draw() {
  background(100, 100, 126);
  // Show the ClickEvent
  clckEvent.display(mouseX, mouseY);
  clckEvent.jiggle();
}

void mousePressed() {
  // If the user clicks on the ClickEvent, play the sound!
  clckEvent.noRing();
  if (clckEvent.contains(mouseX, mouseY)) {
    chsSndFl= new ChooseSoundFile(this);
    if (chsSndFl.getSndFleName()!=null) {

      clckEvent.setSndFile(chsSndFl.getSndFleName());
      clckEvent.ring();
    }
    else {
      clckEvent.ring();
    }
  }
}

// Close the sound files
public void stop() {
  // The ClickEvent object must close its sound.
  clckEvent.close(); 
  super.stop();
}

// Creative Computing March 20th 2014
// Example on using minim, files and GUI.
// Learn the basics of OO programming


import ddf.minim.*;
// A ClickEvent object (that will trigger the sound)
ClickEvent clckEvent;
ChooseSoundFile chsSndFl;
Minim minim;

void setup() {
  size(400, 400, P2D);
  // start up Minim
  minim = new Minim(this);

  // Create a new ClickEvent, this is windows path-naming and referencing
  // For Mac machines use the pathfile name from the root
  // Please change the file location and name before testing
  clckEvent = new ClickEvent(150, 100, 32, "C://Users/Toshiba_Qosmio/Downloads/processing-2.1.1-windows64/processing-2.1.1/modes/java/libraries/minim/examples/PlayAFile/data/marcus_kellis_theme.mp3");
  smooth();
}

void draw() {
  background(100, 100, 126);
  // Show the ClickEvent
  clckEvent.display(mouseX, mouseY);
  clckEvent.jiggle();
}

void mousePressed() {
  // If the user clicks on the ClickEvent, play the sound!
  clckEvent.noRing();
  if (clckEvent.contains(mouseX, mouseY)) {
    chsSndFl= new ChooseSoundFile(this);
    if (chsSndFl.getSndFleName()!=null) {

      clckEvent.setSndFile(chsSndFl.getSndFleName());
      clckEvent.ring();
    }
    else {
      clckEvent.ring();
    }
  }
}

// Close the sound files
public void stop() {
  // The ClickEvent object must close its sound.
  clckEvent.close(); 
  super.stop();
}

