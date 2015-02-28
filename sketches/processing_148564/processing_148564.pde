
// First and only once:
void setup()
{
  size(600, 600);
  background(255, 255, 255);
  frameRate(30);
}
 
// Then, repeat:
void draw()
{ 
  strokeWeight(1);
  stroke(random(255));
  line(frameCount, 0, frameCount, height);
  line(0, frameCount, width, frameCount);


  if (frameCount > width)
    noLoop();

}
