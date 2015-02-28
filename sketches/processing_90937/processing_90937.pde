
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
  float [] posX = {random(100), random(120), random(120), random(140), random(95)};
  fill(10,50,150);
  rect(posX[0], width/2, 10, 10);
  rect(posX[1], width/4, 10, 10);
  rect(posX[2], width/4, 10, 10);
  rect(posX[3], width/4, 10, 10);
  rect(posX[4], width/2, 10, 10);
  }
 
}
