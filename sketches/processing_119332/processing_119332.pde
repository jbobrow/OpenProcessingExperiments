
import guru.ttslib.*;

import processing.video.*;
Movie myMovie;

TTS tts;

void setup() {
  size(420, 480);
  //adjusted the size of the window to crop half the video out
  myMovie = new Movie(this, "Aug_Stand.mov");
  myMovie.loop();
  tts = new TTS();
  tts.setPitch( 550 );
  tts.setPitchRange( 50 );
  tts.setPitchShift( 0.500 );
}

void draw() {
  image(myMovie, 0, 0);
} 
  void mousePressed() {
  tts.speak("shwing");
 

}

void movieEvent(Movie m) {
  m.read();
}



