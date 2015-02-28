
/**
 * massive scale
 * by mei deng
 *
 **/
 
 
 
int Hello;


void setup()
{
  background(#ACF7F0);
  size (600, 600);
  smooth();
  noStroke();

  Hello = 10;
}


void draw() 
{
  background(mouseX, mouseY);
  for (int y=25; y<height; y+=50) 
  {
    for (int x=25; x<width; x+=50) 
    {
      fill(#8B8B8B);
      stroke(#2C1C98);
      ellipse(mouseX+random(-30, 30), y, 50, 50);
      ellipse(x, mouseY+random(-30, 30), 50, 50);
      strokeWeight(11);
    }
  }
}


