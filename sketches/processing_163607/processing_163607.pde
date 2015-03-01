
void setup()
{
  size(1000,1000,P3D);
  frameRate(10);
  smooth();

}

void draw()
{
  background(0);
  stroke(random(0,255),mouseY%255,mouseX%255);
  translate(500,500);
  lights();
  fill(mouseX%255,mouseY%255,random(0,255));
  rotateY(mouseX*2);
  rotateX(mouseY*2);
  sphere(200);
  
  
  
}
