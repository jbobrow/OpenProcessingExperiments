
void setup()
{
  size(200,200); //setting size of window
  rectMode(CENTER); //center mode so object can easily follow mouseX
}

void draw()
{
  if(mouseX > width/2 + 10 || mouseX < width/2 - 10 || mouseY > height/2 + 10 || mouseY < height/2 - 10)//so function will only run if mouse position is a distance of 10 from the center
  {
  background(255);
  int bodyX, bodyY, bodyW, bodyH, lwX, lwY, rwX, rwY;//setting up and drawing the shapes
  bodyX = mouseX; bodyY = mouseY; bodyW = 20; bodyH = 20;
  lwX = bodyX - 10; lwY = bodyY;//so ellipses appear locked to rect
  rwX = bodyX + 10; rwY = bodyY;
  fill(0);
  rect(bodyX, bodyY, bodyW, bodyH);
  fill(255, 0, 0);
  ellipse(lwX, lwY, bodyW - 5, bodyH + 5);
  ellipse(rwX, rwY, bodyW - 5, bodyH + 5);
  }
  else
  {
    background(255);
  }
}
