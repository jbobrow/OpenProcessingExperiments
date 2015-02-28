
Grass[][] grass;
int numX = 19, numY = 15;

import ddf.minim.*;

Minim minim;
AudioPlayer wind;

void setup() {
  size(600, 400, P3D);
  smooth();

  grass = new Grass[numX][numY];
  for (int i = 0; i < numX; i ++ ) {
    for (int j = 0; j < numY; j ++ ) {
      grass[i][j] = new Grass(i*40, j*40+5, random(-0.1, 0.1), 30, 30);
    }
  }

  minim = new Minim(this);  
  wind = minim.loadFile("Wind.mp3");
}

void draw() {
  background(50);

  // All Grass are displayed and blown
  for (int i = 0; i < numX; i ++ ) {
    for (int j = 0; j < numY; j ++ ) {
      grass[i][j].display();
      grass[i][j].change();
     
    }
  }
}

