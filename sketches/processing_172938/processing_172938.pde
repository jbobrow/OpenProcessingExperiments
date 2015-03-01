
// combines the "linear" image manipulation example sketch with
// the "loop" video example sketch. Uses an old movie of mine.

import processing.video.*;

Movie movie;
int direction = 1;

float signal;


void setup() {
  size(352, 288);
  background(0);
  // Load and play the video in a loop
  movie = new Movie(this, "videosound.mp4");
  movie.loadPixels();
  loadPixels();
  movie.loop();
}

void movieEvent(Movie m) {
  m.read();
}

void draw() {
  //if (movie.available() == true) {
  //  movie.read(); 
  //}
//  image(movie, 0, 0, width, height);
   if (signal > movie.height-1 || signal < 0) { 
    direction = direction * -1; 
  }
  if (mousePressed) {
    signal = abs(mouseY % movie.height);
  } else {
    signal += (0.3*direction);  
  }

  if (keyPressed) {
    set(0, 0, movie);
    line(0, signal, movie.width, signal);
  } else {
    int signalOffset = int(signal)*movie.width;
    for (int y = 0; y < movie.height; y++) {
      arrayCopy(movie.pixels, signalOffset, pixels, y*width, movie.width);
    }
    updatePixels();
  }
}


