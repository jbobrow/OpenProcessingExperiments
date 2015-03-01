

void setup ()
{
  size (400, 200);
  background (255);
 

}

 
void draw () {
  stroke (#FC0303,#031DFC,255);
  strokeWeight (5);
  fill (#FC0F03,#FFFFFF,#FC0F03);
  ellipse (mouseX, mouseY, 50, 50);

  stroke (#FF0505,#FF0505,#FF2705);
  strokeWeight (5);
  fill (#FF0509,#FF2705,255);
    rect (mouseX, mouseY, 50, 50);
}

