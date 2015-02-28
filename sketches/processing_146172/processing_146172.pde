
/**
 * talleres CCE mariana carranza
 * Example 09: video-09
 * by mariana carranza.   
 */

import processing.video.*;

Movie myMovie;

void setup() {
  size(320, 240, P2D);
  myMovie = new Movie(this, "eye.mov");
  //myMovie.loop();
  myMovie.play();
}

// Called every time a new frame is available to read
void movieEvent(Movie m) {
  m.read();
}

void draw() {

  image(myMovie, 0, 0);
}


