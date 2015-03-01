
void setup()
{
size(500,500);
background(0,255);
}

void draw()
{
  //background(0,255);
  //println(mouseX)
  translate(mouseX,mouseY);
  noFill();
  stroke(255);
  beginShape(TRIANGLES);
vertex(30, 75);
vertex(40, 20);
vertex(50, 75);
vertex(60, 20);
vertex(70, 75);
vertex(80, 20);
endShape();
}
