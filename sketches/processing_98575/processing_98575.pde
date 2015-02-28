
void setup()
{ 
  size(400, 600);
  background(255, 255, 255);
  smooth();
  frameRate(10);
} 

void draw() 
{  
  stroke(random(255), random(255), random(255) );
  line(0, random(height), width, random(height));
  line(random(width), 0, random(width), height);

}
