
import processing.video.*;
MovieMaker movie;

int[] rgb = { 
  200, 150, 100
}; // color variable | 0 = one color, 255 = complete random
int cv = 60; 

void setup() {
  background(40);
  size(800,600);
  movie = new MovieMaker(this, 800, 600, "algo.mov", 30, MovieMaker.H263, MovieMaker.HIGH);
  smooth();
  frameRate(12);
}

void draw() {
  background(45);
  noStroke();
  fill(40,105);
  rect(0,0,width,height);
  for (int i = 0; i < 10; i++) {
    customShape( random(rgb[0], rgb[0]+cv), random(rgb[1], rgb[1]+cv),random(rgb[2], rgb[2]+cv) );
  }
  for (int i = 0; i < 3; i++) {
    rgb[i] += 1;
    if ( rgb[i] + cv > 255 )
      rgb[i] = 0;
  }
  movie.addFrame();
}

void customShape( float r, float g, float b ) {
  fill( r, g, b );
  beginShape();
  vertex(random(width), random(height));
  vertex(random(width), random(height));
  vertex(random(width), random(height));
  endShape();
}

void keyPressed() {
  if (key == ' ') {
    movie.finish();  // Finish the movie if space bar is pressed!
  }
}


