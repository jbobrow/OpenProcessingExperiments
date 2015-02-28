
/**
 * Loop. 
 * 
 * Move the cursor across the screen to draw. 
 * Shows how to load and play a QuickTime movie file.  
 */

import processing.video.*;

Movie myMovie;

void setup() {
  size(640, 480, P2D);
  background(0);
  // Load and play the video in a loop
  myMovie = new Movie(this, "awsome cat.mov");
  myMovie.loop();
}

void movieEvent(Movie myMovie) {
  myMovie.read();
}

void draw() {
  tint(205, 50);
  image(myMovie, mouseX-myMovie.width/2, mouseY-myMovie.height/2);
}

