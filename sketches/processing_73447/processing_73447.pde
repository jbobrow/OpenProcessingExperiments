
import processing.video.*;
int numPixels;
int blockSize = 6;
Movie myMovie;
color myMovieColors[];

//Video on Loop
void setup() {
  size(800, 800);
  noStroke();
  background(20);
  myMovie = new Movie(this, "3_2.mov");
  myMovie.loop();
  numPixels = width / blockSize;
  myMovieColors = new color[numPixels * numPixels];
  frameRate(60);
  }

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
   if (mousePressed){
   fill(random(50));
   ellipse(400,400,35,35);
   for (int j = 0; j < numPixels; j++) 
   for (int i = 0; i < numPixels; i++) {
   fill(myMovieColors[j*numPixels + i]);
   rect(i*blockSize, j*blockSize-2, blockSize-3, blockSize-3); 
    }
  }
}


