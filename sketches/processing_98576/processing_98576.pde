
void setup()
{ 
  size(400, 600);
  background(255, 255, 255);
  smooth();
  frameRate(60);
} 

void draw() 
{  
  strokeWeight(10);
  noFill();
  stroke(random(255), random(255), random(255) );
  ellipse( random(width), random(height), 20, 20);  

}
