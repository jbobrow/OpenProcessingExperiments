
void setup()
{
  size(800,800);
  background(0);
}
void draw()
{
  noStroke();
  if (mousePressed) fill(255,1.0*mouseY/height*255.0,1.0*mouseX/width*255.0,140);
  else fill(random(255),0,255,140);
  ellipse(mouseX,mouseY,50,50);
  ellipse(mouseY,mouseX,50,50);
  ellipse(width-mouseX,height-mouseY,50,50);
  ellipse(width-mouseY,height-mouseX,50,50);
}
