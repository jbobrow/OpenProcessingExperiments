
//Josh Holloway
//jolloway.co.uk
//March 2013

void setup()
{
  size(500, 500);
  background(0, 150, 250);
  smooth();
  noStroke();
}

void draw()
{
}

void mousePressed()
{  
  background(0, 150, 250);
  if (mouseY < 166)
  {
    drawSittyCat(250, 250);
  }
  else if (mouseY > 332)
  {
    drawStandyCat(250, 250);
  }
  else
  {
    drawLieyCat(250, 250);
  }
}

void drawLieyCat(int catX, int catY)
{
  //rug
  fill(255, 128, 128);
  ellipse(catX + 70, catY + 60, 300, 100);
  //cat
  stroke(50);
  line(catX + 170, catY + 30, catX + 130, catY - 40);
  stroke(255);
  fill(50);
  ellipse(catX + 70, catY + 40, 200, 100);
  drawCatFace(catX, catY);
}
void drawSittyCat(int catX, int catY)
{
  stroke(50);
  line(catX, catY + 190, catX + 150, catY + 150);
  stroke(255);
  fill(50);
  ellipse(catX, catY + 100, 100, 200);
  drawCatFace(catX, catY);
}
void drawStandyCat(int catX, int catY)
{
  stroke(50);
  line(catX, catY + 190, catX + 100, catY + 130);
  stroke(255);
  fill(50);
  rect(catX + 11, catY + 160, 10, 45);
  rect(catX - 20, catY + 160, 10, 45);
  rect(catX - 35, catY + 160, 15, 50);
  rect(catX + 20, catY + 160, 15, 50);
  ellipse(catX, catY + 100, 100, 200);
  drawCatFace(catX, catY);
}
void drawCatFace(int headX, int headY)
{
  fill(50);
  ellipse(headX, headY, 100, 100);
  triangle(headX - 40, headY - 10, headX - 10, headY - 40, headX - 60, headY - 60);
  triangle(headX + 40, headY - 10, headX + 10, headY - 40, headX + 60, headY - 60);
  fill(255, 150, 150);
  triangle(headX - 30, headY - 20, headX - 20, headY - 30, headX - 50, headY - 50);
  triangle(headX + 30, headY - 20, headX + 20, headY - 30, headX + 50, headY - 50);
  fill(0, 100, 20);
  ellipse(headX - 15, headY - 10, 10, 20);
  ellipse(headX + 15, headY - 10, 10, 20);
  stroke(255);
  line(headX, headY + 20, headX - 50, headY + 40);
  line(headX, headY + 20, headX - 50, headY);
  line(headX, headY + 20, headX - 50, headY + 20);
  line(headX, headY + 20, headX + 50, headY + 40);
  line(headX, headY + 20, headX + 50, headY + 20);
  line(headX, headY + 20, headX + 50, headY);
}


