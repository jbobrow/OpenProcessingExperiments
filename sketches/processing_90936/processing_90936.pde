
void setup()
{
  size(200, 200);
  
}

void draw()
{
  background(0);
  fill(255);
  rect(20, 0, width - 40, height - 20);
  if(mouseX < 20 || mouseX > width - 20 || mouseY > height - 20)
  {
  float [] posX = {random(20, 100), random(50, 120), random(100, 120), random(20, 140), random(75, 95)};
  rect(posX[0], height/2, 20, 20);
  rect(posX[1], height/2, 30, 30);
  rect(posX[2], height/3, 20, 20);
  rect(posX[3], height/3, 30, 30);
  rect(posX[4], height/2, 20, 20);
  }

}
