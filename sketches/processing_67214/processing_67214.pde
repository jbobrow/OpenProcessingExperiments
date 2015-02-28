
import ddf.minim.*;

int numberOfUsers = 1;
int targetSwitch = 0;
int musicDuration = 1;
int maxMusicDuration = 10;

float startedPlayingTime = 0;

void setup() {
  size(500, 400);
  background(50);
  ellipseMode(CENTER);

  // setup MP3 library
  mp3Setup();

  // initialize phidgets interface kit
  ifkSetup();

  // initialize user interface
  guiSetup();

  readyToGo = true;
}


void draw() {
  background(50);
  
  displayText();
  
  if (mp3MusicPlaying) {
    if (millis() - startedPlayingTime > (musicDuration * 1000)) mp3StopPlaying();
  }
}

void keyPressed() {
  if (key == 'q') {
    shutDown();
  } 
  else if (key == 'p') {
    mp3StartPlaying();
  } 
  else if (key == 's') {
    mp3StopPlaying();
  } 
}

void shutDown() {
  mp3StopPlaying();
  ifkClose();
  exit(); // Stops the program
}

void stop()
{
  // always close Minim audio classes when you are done with them
  musicPlayer.close();
  minim.stop();
  
  super.stop();
}

