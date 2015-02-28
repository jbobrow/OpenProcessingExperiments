
void setup(){
  size(500,500);
  frameRate(20);
}
void draw()
{
ellipse(mouseX,mouseY,20,20);
ellipse(500-mouseX,mouseY,20,20);
}


