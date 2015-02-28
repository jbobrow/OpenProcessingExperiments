
//variables
float c=255;

//background
void setup()
{
  size(250, 250);
  background(0);
  noStroke();
  smooth();
}

void draw()
{
}

//interactive random sized circles
void mousePressed()
{
  for(int s=0; s<=random(c); s+=10) {
  fill(random(c), random(c), random(c), 10);
  stroke(random(c), random(c), random(c));
  ellipse (mouseX, mouseY, s, s);
}
}

