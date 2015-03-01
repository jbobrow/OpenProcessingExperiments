
float delta = 3;
float r = 200;

void setup()
{
  size (1000,700,P3D);
}
void draw ()
{
  background(#4081FF);

  translate (width/2, height/2,0);
  rotateX (radians(mouseY));
  

  for (float z = 0; z<200; z+=0.2)
  for (float deg = 0; deg<360; deg += delta) {
    float theta = radians(deg);
    float x = r * cos (theta);
    float y = r * sin (theta);
  point (x,y,z);
  
  stroke(#FFCD40);
  strokeWeight(40);
  }
}
