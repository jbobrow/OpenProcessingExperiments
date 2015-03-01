
float y;
float x;

 
void setup()
{
  size(800, 800);
  background(#1757D3);
  x=width/2;
  y=height/2;
}
 
void draw()
{
  //fill(#C620C6);
  //rect(0, 0, width, height);
  x = x + (mouseX-x)/20;
  y = y + (mouseY-y)/20;
  //noStroke();
  stroke(55);
  fill(75);
  ellipse(x+2, y+2, 55, 55);
  noStroke();
  fill(#C620C6);
ellipse(x, y, 50, 50);
 
fill(#C620C6);
ellipse(x-5, y-5, 35, 35);
}

