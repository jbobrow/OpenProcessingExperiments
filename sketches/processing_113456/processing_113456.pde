
void setup()
{
 
  size(500,500);
  strokeWeight(5);

  smooth();
  background(0);
}
 
float w = 200;
float x = 300;
float y = 400;
float z = 500;
 
void draw()
{
  background(0);
 
  if (mousePressed == true) {
    loop();
     
 
    stroke(255);
    line(0, random (0,300), width, x);
    line(0, x, width, random (20,200));
     
    stroke(255, 0, 0);
    line(0, random (0,300), width, y);
    line(0, y, width, random (20,200));
     
    stroke(0, 255,255);
    line(0, random (0,300), width, z);
    line(0, z, width, random (20,200));
    
    stroke(255, 0, 255);
    line(0, random (0.300), width, y);
    line(0, w, width, random (20,200));
  }
}


