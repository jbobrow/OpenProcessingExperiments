
// First and only once:
void setup()
{
  size(600, 600);
  background(255, 255, 255);
  frameRate(60);
}
 
// Then, repeat:
void draw()
{ 
  noFill();
  stroke(0, 0, 0, 255);
  ellipse(width/2, height/2, frameCount*10, frameCount*10);
  
  if (frameCount*10 >= width)
    noLoop();
}
