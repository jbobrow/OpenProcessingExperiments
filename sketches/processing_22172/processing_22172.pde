
import processing.video.*;

int numPixels;
int blockSize = 10;
Movie myMovie;
color myMovieColors[];

void setup() {
  size(1000, 1000, P2D);
  noStroke();
  background(0);
  myMovie = new Movie(this, "shayna elevator.mov");
  myMovie.loop();
  numPixels = width + blockSize;
  myMovieColors = new color[numPixels * numPixels];
}

// Read new values from movie
void movieEvent(Movie m) {
  m.read();
  m.loadPixels();
  
  for (int j = 0; j < numPixels; j++) {
    for (int i = 0; i < numPixels; i++) {
      myMovieColors[j*numPixels + i] = m.get(i, j);
    }
  }
}

// Display values from movie
void draw()  {
  for (int j = 0; j < numPixels; j++) {
    for (int i = 0; i < numPixels; i++) {
      fill(myMovieColors[j*numPixels + i]);
      rect(i*blockSize, j*blockSize, blockSize-1, blockSize-1);
    }
  }
}

