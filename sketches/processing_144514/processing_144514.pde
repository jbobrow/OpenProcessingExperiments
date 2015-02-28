
void setup() 
{
  size(500, 500);
  noFill();
  background(255);
}
void draw() 
{
 // background(255,random(40));
  for (int i=0; i<=150; i++) 
  {
   pushMatrix();
    stroke(0, 0, 0, 1);
    /*line(mouseX, mouseY, mouseX+random(200), mouseY/2);
    line(0, 0, mouseX+random(200), mouseY/2);
    line(500, 0, mouseX+random(200), mouseY/2);*/
   line(mouseX, mouseY, mouseX+random(200), mouseY/2);
    stroke(0, 0, 0, 1);
   line(0, 0, mouseX+random(200), mouseY);
    stroke(0, 0, 0, 1);
   line(500, 0, mouseX+random(200), mouseY);
   popMatrix();
   resetMatrix();
  }
}

