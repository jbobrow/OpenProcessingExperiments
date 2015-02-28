
import processing.opengl.*;
float ang=0.0;

void setup()
{
  size(800, 600, OPENGL);
}

void draw()
{
  background(50);
  translate(width/2, height/2);
  rotateY(ang);
  ang+=.01;
  scale(3);
  fill(150, 0, 150, 127);
  drawPyramid(0, 0, 0);
  drawPyramid(-50, 0, -50);
  drawPyramid(30, 0, 30);
  drawPyramid(60, 0, 60);
}

void drawPyramid(float x, float y, float z) {
  beginShape(TRIANGLE_FAN);
  fill(150, 0, 150, 127);
  vertex(x, y, x);
  vertex(x+10, y+20, z+10);
  vertex(x+10, y+20, z-10);
  vertex(x-10, y+20, z+10);
  vertex(x-10, y+20, z-10);
  endShape();
}


