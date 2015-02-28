
float r = 255;
float g = 150;
float b = 200;
float a = 200;

float radius;
float x ;
float y ;

void setup()
{
  size(300, 300);
  background(255);

  frameRate(20);
  smooth();
}
void draw ()
{
  r =random(255);
  g = random(255);
  b = random(10);
  a = random(255);


  fill (r,g,b,a);
  float radius = random(10,60);

  ellipse(mouseX,mouseY,radius,radius);

}



