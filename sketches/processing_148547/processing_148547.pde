
// First and only once:
void setup()
{
  size(400, 600);
  background(255, 255, 255);
  frameRate(30);
}
 
// Then, repeat:
void draw()
{ 
  strokeWeight(1);
  stroke(0, 0, 0, 255);
  line(0, random(height), width, random(height));
  line(random(width), 0, random(width), height);
 
}

