
//Paulina Kang, 4-5, User Input

int x = 58;
int y = 27;
void setup()
{
  size(400,400);
  background(255);
  fill(252,255,93);
  ellipse(200,200,250,250);
}
void draw()
{
 if(mousePressed == true && key == 'h')
  {
   strokeWeight(15);
   stroke(x,y,0);
   line(mouseX, mouseY,pmouseX, pmouseY);
   x = x + 1%2;
   y = y + 1%2;
  }
 if(mousePressed == true && key == 'b')
 {
  strokeWeight(6);
  stroke(0);
  line(mouseX,mouseY,pmouseX,pmouseY);
 }
 if(mousePressed == true && key == 'r')
  {
   strokeWeight(7);
   stroke(255,0,0);
   line(mouseX,mouseY,pmouseX,pmouseY);
  }
 if(mousePressed == true && key == 'l')
  {
   stroke(105,172,242);
   strokeWeight(7);
   line(mouseX,mouseY,pmouseX,pmouseY);
  }
 if(mousePressed == true && key == 's')
 {
   stroke(227,183,94);
   strokeWeight(5);
   line(mouseX, mouseY, pmouseX, pmouseY);
 }
}
void mousePressed()
{
  if(mouseButton==RIGHT)
  {
    strokeWeight(2);
    fill(255);
    ellipse(pmouseX,pmouseY,35,35);
  }
}
