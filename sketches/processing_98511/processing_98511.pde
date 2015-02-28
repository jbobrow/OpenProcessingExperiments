
void setup()
{ 
  size(400, 600);
  background(255, 255, 255);
  smooth();
  frameRate(60);

} 

void draw() 
{  
    fill( random(255), random(255), random(255), 70 );
    ellipse( random(width), random(height), 50, 50);

}
