
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
    float [] posX = {random(200), random(200), random(200), random(200), random(200)};
    fill(200,20,10);
    ellipseMode(CENTER);
    ellipse(posX[0], width/4, 20, 20);
    fill(20,200,10);
    ellipse(posX[1], width/2, 20, 30);
    fill(20,20,100);
    rect(posX[2], width/3, 30, 20);
    fill(100,30,100);
    rect(posX[3], width/2, 50, 40);
    rect(posX[4], width/4, 40, 20);
  } 
  else
  {
  float [] posA = {random(200), random(200), random(200), random(200), random(200)};
  fill(200,20,10);
  ellipseMode(CENTER);
  ellipse(posA[0], width/2, 40, 40);
  fill(20,200,10);
  ellipse(posA[1], width/4, 20, 40);
  fill(20,20,100);
  rect(posA[2], width/4, 20, 20);
  fill(100,30,100);
  rect(posA[3], width/4, 20, 40);
  rect(posA[4], width/2, 40, 10);
  }
}
