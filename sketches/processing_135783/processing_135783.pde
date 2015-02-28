
void setup()
{
  size(400,400);
  smooth();
  background(54,54,54);
}
void draw(){
  float r=random(400);
  fill(pmouseY/1.5,pmouseX/2,240,150);
  rect(pmouseX,pmouseY,mouseX,mouseY);
  }

