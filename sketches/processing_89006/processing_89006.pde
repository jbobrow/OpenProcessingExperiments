
void setup()
{
  background(255);
  size(400, 400);
}
void customShape(float coX,float coY)
{
fill(0, 255, 0);
rect(coX, coY, 20, 20);
fill(255, 255, 0);
ellipse(coX+20, coY+10, 10, 10);
ellipse(coX, coY+10, 10, 10);
fill(255, 0, 0);
triangle(coX+10, coY+10, coX+2, coY+18, coX+18, coY+18);
}
void draw()
{
if((width/2 - mouseX) >10 || (height/2 - mouseY)>10)
{background(255);
customShape(mouseX, mouseY);}
else if((mouseX - width/2) > 10 || (mouseY - height/2)>10)
{background(255);
  customShape(mouseX, mouseY);}
  else
  background(255);
}
