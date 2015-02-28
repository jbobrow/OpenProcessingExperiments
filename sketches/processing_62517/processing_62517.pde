
void setup()
{
  size (400,600);
  background (255,255,255);
  smooth();
  frameRate (5);
}
void draw ()
{
  fill (101,220, 150, 70);
  rect (0,0, width, height);
 fill ( random (55), random(78), random(144));
  ellipse ( random (width),random(height),mouseX, mouseY);
  fill (random (255), random(255), random (255));
  rect ( mouseX, mouseY, 55, 78);

 fill (255,0,0);
  textSize ( 150);
  textAlign (CENTER);
  text("", width/2, height/2);
}
