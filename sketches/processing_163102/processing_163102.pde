
float delta = 5;
float r = 50;

void setup()
{
  size(1600, 600, P3D);

  
}


void draw()
{
 
  background(0);
  stroke(255,255,0);
  translate(width/2, height/2, 0);
 
  
  for (float z = 0; z< 500; z+=10) {
    for (float deg = 0; deg <360; deg += delta) {
      float theta = radians(deg);
      float x = r*cos(theta);
      float y = r*sin(theta);
      point(x,y,z);
    }
  }
  ellipse (0,0,100,100);
  fill (255,255,0);
}
  
