
void setup()
{
  size(500,500);
  background(255);
  noFill();
  stroke(0,0,0);
  smooth();
}

void draw()
{
  //background(255);
  translate(width/2,height/2);
  rotate(mouseX/0.2);
  triangle(0,0,0,150,150,150);
  rotate(mouseX/0.2);
  triangle(0,0,0,50,50,50);
  rotate(mouseX/0.2);
  rect(0,0,100,100);
}
