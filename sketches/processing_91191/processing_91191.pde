
int [] pX = {200, 100, 300, 300, 100};

void blackLine()
{
  stroke(0);
  strokeWeight(20);
  line(10, 0, 10, height);
  line(0, height - 10, width, height - 10);
  line(width - 10, 0, width - 10, height);
}

void setup()
{
  background(0, 0, 200);
  size(400, 400);
}


void draw()
{
  background(100, 100, 255);
  blackLine();
  
  if(mouseY > height - 20)
  {
    strokeWeight(0);
    fill(255, 255, 0);
    ellipse(pX[0], height/2, 80, 80);
  }
  
  if(mouseX < 20 && mouseY < height/2)
  {
    strokeWeight(0);
    fill(255, 255, 0);
    ellipse(pX[1], height/4, 40, 40);
  }
  
  if(mouseX < 20 && mouseY > height/2)
  {
    strokeWeight(0);
    fill(255, 255, 0);
    ellipse(pX[2], height/4, 40, 40);
  }
  
  if(mouseX > width - 20 && mouseY < height/2)
  {
    strokeWeight(0);
    fill(255, 255, 0);
    ellipse(pX[3], height/4*3, 40, 40);
  }
  
  if(mouseX > width - 20 && mouseY > height/2)
  {
    strokeWeight(0);
    fill(255, 255, 0);
    ellipse(pX[4], height/4*3, 40, 40);
  }
}
