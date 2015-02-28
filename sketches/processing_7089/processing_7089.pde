
/**
 * Texture 3. 
 *
 * Example for the pogg library by Octavi Estape.
 * Adapted from the example in File->Examples->3D->Textures->Texture3.
 * Load an image and draw it onto a cylinder and a quad. 
 */

import pogg.*;

int tubeRes = 32;
float[] tubeX = new float[tubeRes];
float[] tubeY = new float[tubeRes];

TheoraMovie myMovie;

void setup() {
  frameRate(10);
  size(640, 360, P3D);

  myMovie = new TheoraMovie(this, "BugsShort.ogg");
  myMovie.loop();

  float angle = 270.0 / tubeRes;
  for (int i = 0; i < tubeRes; i++) {
    tubeX[i] = cos(radians(i * angle));
    tubeY[i] = sin(radians(i * angle));
  }
  noStroke();
}

void draw() {
  myMovie.read();
  
  background(0);
  translate(width / 2, height / 2);
  rotateX(map(mouseY, 0, height, PI, -PI));
  rotateY(map(mouseX, 0, width, -PI, PI));
  beginShape(QUAD_STRIP);
  texture(myMovie);
  for (int i = 0; i < tubeRes; i++) {
    float x = tubeX[i] * 100;
    float z = tubeY[i] * 100;
    float u = myMovie.width / tubeRes * i;
    vertex(x, -100, z, u, 0);
    vertex(x, 100, z, u, myMovie.height);
  }
  endShape();
  beginShape(QUADS);
  texture(myMovie);
  vertex(0, -100, 0, 0, 0);
  vertex(100, -100, 0, 100, 0);
  vertex(100, 100, 0, 100, 100);
  vertex(0, 100, 0, 0, 100);
  endShape();
}

