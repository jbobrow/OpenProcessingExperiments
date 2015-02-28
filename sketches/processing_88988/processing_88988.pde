
int x, y; //global variables
int circleX, circleY; //global variables
int rectX, rectY; //global variables
void setup()
{
  size(300,300);
}
void draw()
{
  if(mouseX > 140 && mouseX < 160 || mouseY > 140 && mouseX < 160)
  {
    background(200,200,200);
  }
}
 void mousePressed()
  {
    fill(255,0,0);
    triangle(mouseX, mouseY, mouseX+75, mouseY -50, mouseX+150, mouseY);
    fill(0,255,0);
    ellipse(mouseX+50, mouseY -25,20,20);
    ellipse(mouseX + 105, mouseY -25,20,20);
    fill(0,0,255);
    rect(mouseX+20, mouseY-12, 75,10);
  }
  void keyPressed()
   {
    fill(255,0,0);
    triangle(mouseX, mouseY, mouseX+75, mouseY -50, mouseX+150, mouseY);
    fill(0,255,0);
    ellipse(mouseX+50, mouseY -25,20,20);
    ellipse(mouseX + 105, mouseY -25,20,20);
    fill(0,0,255);
    rect(mouseX+20, mouseY-12, 75,10);
  }
