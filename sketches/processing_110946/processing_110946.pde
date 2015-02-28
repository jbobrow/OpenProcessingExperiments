
boolean mouseIsDown = false;

void setup()
{
  size(320,480);
  background(random(0,255),random(0,255),random(0,255));
}

void draw()
{
  strokeWeight(abs(pmouseX-mouseX));
  stroke(random(255),random(255),random(255));
  filter(POSTERIZE,6);
  //filter(DILATE);
  if(mouseIsDown == true)
  {
    fill(random(0,255),random(0,255),random(0,255),random(0,255));
 rect(pmouseX, pmouseY, random(0,20), random(0,20));
 rect(width-pmouseX,pmouseY, random(0,20) ,random(0,20));
  }
}
void mousePressed()
{
mouseIsDown = true;
println("Mouse was pressed");
}
void mouseReleased()
{
  mouseIsDown = false;
  println("Mouse was released");
}
