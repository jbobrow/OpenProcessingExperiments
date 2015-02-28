
float angle = 0.0;

void setup()
{
  size(800, 800);
  smooth();
  background (255);
}


void draw()
{
  pushMatrix();
  translate(mouseX, mouseY);
  rotate(angle);
 

  //logo
  
  stroke (114, 16, 23);
  strokeWeight (15);
  strokeCap (ROUND);
  scale (0.5);
  line ( 326, 307, 441, 307);
  line ( 441, 307, 441, 473);
  line ( 326, 377, 441, 377);
  line (326, 377, 326, 545);
  strokeCap (ROUND);
  line (326, 456, 441, 456);
  popMatrix();
  
  angle+=0.1;
}

  void mouseClicked() {
    background(255);
  }


