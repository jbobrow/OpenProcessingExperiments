
/**
 * SquareHarmony by Ben Chun
 * 12 March 2009
 *
 * After the lovely "Harmony!" brush "SQUARES" by Ricardo Cabello:
 * http://mrdoob.com/projects/harmony/#squares
 *
 */

float dx, dy, theta, nx, ny;

void setup()
{
  size(800,600);
  background(255);
  smooth();
}

void draw()
{
  dx = mouseX - pmouseX;
  dy = mouseY - pmouseY;  
  theta = atan(dy/dx);

  if(mousePressed)
  {
    pushMatrix();
    translate(mouseX, mouseY);
    rotate(theta);
    nx = dist(mouseX, mouseY, pmouseX, pmouseY);
    ny = nx*2;
    rect(-nx/2, -nx, nx, ny);
    popMatrix();
  }
}

