
int x = 255;
int y = 255;
void setup()
{
  background(200,200,250);
  size(800,600);
  smooth();

}
void draw()
{
  noStroke();
  textSize(30);
  text("Space key to clear",30,40);
  text("Hold left mouse button and drag to change color",30,80);
}

void mouseDragged()
{
  
  fill(x,120,120,20);
  rect(0,0,800,600);
  x = x - 10;
  if(x < 0)
  {
    x = 255;
  }
}
void mouseMoved()
{
  fill(120,x,y);
  ellipse(mouseX,mouseY,70,70);
   y = y + 1;
}
void keyPressed()
{
  if (key == ' ')
  {
    background(200,200,250);
  }
}
