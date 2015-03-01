
float x;
float y;


void setup()
{
  size(500, 500);
  background(0, 0, 0);
  x=width/2;
  y=height/2;
}

void draw()
{
  //fill(0, 5);
  //rect(0, 0, width, height);
  x = x + (mouseX-x)/20;
  y = y + (mouseY-y)/20;
  //noStroke();
  stroke(55);
  fill(75);
  ellipse(x+2, y+2, 55, 55);
  noStroke();
  fill(150);
ellipse(x, y, 50, 50);

fill(255);
ellipse(x-5, y-5, 35, 35);
}
