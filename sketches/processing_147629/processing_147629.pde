
/* @pjs preload="lizard.png", "stone.jpg"; */

PImage lizard = loadImage("lizard.png");

void setup()
{
  
  size (950,720);
  
  PImage stone = loadImage("stone.jpg");
tint (255, 150);

image (stone, 0,0);
  
}
  
void draw()
{
  translate (mouseX,mouseY);
 rotate(frameCount/10.0);
  tint(random(255),random(255),random(255));
if (mousePressed)
{
   
  int i = (frameCount-1) % lizard.length;
  image( lizard, 18,18 );
  
}
}
