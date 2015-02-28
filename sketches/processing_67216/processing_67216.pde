
InterfaceKitPhidget ifk = null;

// playTrack[switch][track] = true if switch activates a track
// playTrack[switch][track] = false if switch does not activate a track
boolean[][] playTrack;

void setup() {
  size(750, 350);
  background(50);
  ellipseMode(CENTER);

  // initialize user interface library
  cp5 = new ControlP5(this);

  // initialize phidgets interface kit
  ifkSetup();

  // set up user interface
  addButtons();
  readyToGo = true;
}

void draw() {
  background(50);
}

void keyPressed() {
  if (key == 'q') {
    midiStopPlaying();
    ifkClose();
    exit(); // Stops the program
  } 
  else if (key == 'p') {
    midiStartPlaying();
    midiSetMuteAll(true);
  } 
  else if (key == 's') {
    midiStopPlaying();
  } 
  else if (key >= '0' && key <= '9') {
    midiToggleMute(key - '0');
    println("muting " + key);
  }
}

void shutDown() {
  midiStopPlaying();
  ifkClose();
  exit(); // Stops the program
}


