
/**
 * TelevisionSet 
 * 
 * Example for the pogg library by Octavi Estape.
 * It plays a Theora movie in a 3D television set.
 */

import pogg.*;
//import processing.opengl.*;

TheoraMovie myMovie;

int frame = 0;

void setup() {
  frameRate(10);
  size(640, 380, P3D);
  //size(640, 380, OPENGL);
  
  background(0);
  myMovie = new TheoraMovie(this, "BugsShort.ogg");
  myMovie.loop();

  noStroke();
  //smooth();
}

void draw() {

  lights();

  myMovie.read();

  background(0);
  translate(width / 2, height / 2);
  rotateY(map(mouseX, 0, width, -PI, PI));
  rotateX(map(mouseY, 0, height, PI, -PI));
  //rotateZ(PI/6);
  
  //original Texture 1 example:
  /*
  beginShape();
  texture(myMovie);
  vertex(-100, -75, 100, 0, 0);
  vertex(100, -75, 100,  myMovie.width, 0);
  vertex(100, 75, 100,  myMovie.width, myMovie.height);
  vertex(-100, 75, 100, 0, myMovie.height);
  endShape();
  */
 
  //sligthly better perspective quality when smooth() is not called
  beginShape(TRIANGLE_FAN);
  texture(myMovie);
  vertex(0, 0, 100,  myMovie.width/2, myMovie.height/2);
  vertex(-100, -75, 100, 0, 0);
  vertex(100, -75, 100, myMovie.width, 0);
  vertex(100, 75, 100, myMovie.width, myMovie.height);
  vertex(-100, 75, 100, 0, myMovie.height);
  vertex(-100, -75, 100, 0, 0);
  endShape();

  fill(90, 38, 16);

  //frontal panel
  //top
  beginShape();
  vertex(-125,-100,100);
  vertex(125,-100,100);
  vertex(125,-75,100);
  vertex(-125,-75,100);
  endShape();

  //bottom
  beginShape();
  vertex(-125,100,100);
  vertex(125,100,100);
  vertex(125,75,100);
  vertex(-125,75,100);
  endShape();
  //left
  beginShape();
  vertex(-125,-75,100);
  vertex(-100,-75,100);
  vertex(-100,75,100);
  vertex(-125,75,100);
  endShape();
  //right
  beginShape();
  vertex(125,-75,100);
  vertex(100,-75,100);
  vertex(100,75,100);
  vertex(125,75,100);
  endShape();

  //top panel
  beginShape();
  vertex(-125,-100,100);
  vertex(125,-100,100);
  vertex(125,-100,-100);
  vertex(-125,-100,-100);
  endShape();

  //bottom panel
  beginShape();
  vertex(-125,100,100);
  vertex(125,100,100);
  vertex(125,100,-100);
  vertex(-125,100,-100);
  endShape();

  //left
  beginShape();
  vertex(-125,-100,100);
  vertex(-125,-100,-100);
  vertex(-125,100,-100);
  vertex(-125,100,100);
  endShape();

  //right
  beginShape();
  vertex(125,-100,100);
  vertex(125,-100,-100);
  vertex(125,100,-100);
  vertex(125,100,100);
  endShape();

  //back
  beginShape();
  vertex(-125,-100,-100);
  vertex(125,-100,-100);
  vertex(125,100,-100);
  vertex(-125,100,-100);
  endShape();

  //legs
  //fill(162, 103, 23);
  fill(129, 82, 18);
  pyramid(0,0,0, -125, 150, 100, -125, 150, 75, -100, 150, 100);
  pyramid(0,0,0, 125, 150, 100, 125, 150, 75, 100, 150, 100);
  pyramid(0,0,0, -125, 150, -100, -125, 150, -75, -100, 150, -100);
  pyramid(0,0,0, 125, 150, -100, 125, 150, -75, 100, 150, -100);

  //antenna
  fill(192,192,192);
  pyramid(-100, -225, 0, -5, -100, 0, 0, -100, -3, 0, -100, 3);
  pyramid(100, -225, 0, 5, -100, 0, 0, -100, -3, 0, -100, 3);

}

void pyramid(int x1, int y1, int z1, int x2, int y2, int z2, int x3, int y3, int z3, int x4, int y4, int z4) {
  beginShape(TRIANGLE_FAN);
  vertex(x1, y1, z1);
  vertex(x2, y2, z2);
  vertex(x3, y3, z3);
  vertex(x4, y4, z4);
  vertex(x2, y2, z2);
  endShape();
  beginShape(TRIANGLES);
  vertex(x2, y2, z2);
  vertex(x3, y3, z3);
  vertex(x4, y4, z4);
  endShape();
}





