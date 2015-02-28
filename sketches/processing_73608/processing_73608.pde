
float x = 0.5;
float y = -0.5;

void setup()
{
size(500,500,P3D);
background(0,0,0);
smooth();
stroke(255,255,255);
}
void draw ()
{
  translate(mouseX,mouseY,0);
  rotateX(.5+x);
  rotateY(.5+y);
  pointLight(random(255), random(255), random(255),-300,-300,405);
  sphere(100);
  translate(200,300,0);
  rotateX(.2+x);
  rotateY(.8+y);
  pointLight(random(255),random(255),random(255),-600,-50,245);
  box(130,130,130);
  x = x+0.5;
  y = y+0.5;
  frameRate(20);
  
}
