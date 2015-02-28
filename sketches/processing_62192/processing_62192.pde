
void setup()
{
  size(400,800);
  background(255,255,255);
  smooth();
  frameRate(10);
}
void draw()
{
  line(pmouseX,pmouseY,mouseX,mouseY); 
  fill(random(255),random(255),random(255),100);
  ellipse(mouseX,mouseY,random(30),random(30));
  if(mousePressed)
  {
    background(255,255,255);
  }
}
