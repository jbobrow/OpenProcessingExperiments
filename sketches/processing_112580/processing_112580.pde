
//Christian Murphy
//September 2013

boolean mouseIsDown = false;
PImage p;
void setup()
{
  size(320, 480);
  background(67, 53, 53);
  frameRate(3);
  p = loadImage ("water.jpg");
  background ( p );
}

void draw()
{
 
  float x, y, z;
  x = random(1, 320);
  y = random(1, 480);
  z = random(1, 20);
  fill( x, z);
  ellipse( x, y, 17, 17);
  noFill();
  fill(z, x, z, y);
  ellipse( y, x, 20, 20);
  if(mouseIsDown == true)
  {
    strokeWeight(random(1, 6));
    stroke(random(256), random(256), random(256));
    line(mouseX, mouseY, pmouseX, pmouseY);
    line(mouseY, mouseX, pmouseY, pmouseX);
  }
}

void mousePressed()
{
  mouseIsDown = true;
  if(mouseIsDown = true)
  {
    
  }
}

void keyPressed()
{
  if(keyPressed == true)
  {
    background(random(256));
  }
  else
  {
    triangle(random(500),random(500),random(500),random(500),random(500),random(500));
  }
}

void mouseReleased()
{
  mouseIsDown = false;
}
