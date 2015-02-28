
// Written by Jose Pertierra
// jpertier@andrew.cmu.edu
// Copyright Jose Periterra (October 8, 2013) All Rights Reserved

float x, y, dx, dy, wd, ht;
float x2, y2, dx2, dy2, wd2, ht2;
color col, col2;
int score;

void setup()
{
  size(400, 400);
  x = width*0.5;
  y = height*0.5;
  dx = 2;
  dy = 4;
  wd = width*0.1;
  ht = height*0.1;
  x2 = width*0.75;
  y2 = height*0.75;
  dx2 = -4;
  dy2 = 2;
  wd2 = width*0.1;
  ht2 = height*0.1;
  score = 10;
  col = color(random(255), random(255), random(255));
  col2 = color(random(255), random(255), random(255));
  frameRate(70);
}

void draw()
{
  background(0, 0, 0);
  showTime();
  showScore();
  drawFigure1();
  moveFigure1();
  drawFigure2();
  moveFigure2();
  detectCollisions();
  drawScope();
}

void detectCollisions()
{
  float d =dist(x, y, x2, y2);
  float colDist = wd*0.5 + wd2*0.5;
  if (d < (colDist))
  {
    dy *= -1;
    dy2 *= -1;
  }
}

void moveFigure2()
{
  x2 += dx2;
  y2 += dy2;
  if (x2 - wd2*0.5 >= width)
  {
    x2 = 0 - wd2*0.5;
  }
  else if (x2 + wd2*0.5 <= 0)
  {
    x2 = width + wd2*0.5;
  }
  else if (y2 + ht2*0.5 <= 0)
  {
    y2 = height + ht2*0.5;
  }
  else if (y2 - ht2*0.5 >= height)
  {
    y2 = 0 - ht2*0.5;
  }
}

void drawFigure2()
{
  noStroke();
  fill(col2);
  rectMode(CENTER);
  rect(x2, y2, wd2, ht2);
}

void moveFigure1()
{
  x += dx;
  y += dy;
  if (x + wd*0.5 >= width)
  {
    dx *= -1;
  }
  else if (x - wd*0.5 <= 0)
  {
    dx*= -1;
  }
  else if (y + ht*0.5 >= height)
  {
    dy *= -1;
  }
  else if (y - ht*0.5 <= 0)
  {
    dy *= -1;
  }
}

void showTime()
{
  fill(255, 0, 0);
  textAlign(LEFT, LEFT);
  textSize(30);
  text("Time: " + millis( )/1000, width*0.125, height*0.25 );
}

void showScore()
{
  fill(255, 0, 0);
  textSize(40);
  text("Score: " + score, width*0.125, height*0.125);
}

void drawFigure1()
{
  noStroke();
  fill(col);
  ellipse(x, y, wd, ht);
}

void drawScope()
{
  fill(255, 255, 255, 70);
  strokeWeight(2);
  stroke(0, 0, 0);
  ellipse(mouseX, mouseY, wd*10, ht*10);
  line(mouseX - wd*5, mouseY, mouseX - wd*0.5, mouseY);
  line(mouseX + wd*5, mouseY, mouseX + wd*0.5, mouseY);
  line(mouseX, mouseY - ht*5, mouseX, mouseY - ht*0.5);
  line(mouseX, mouseY + ht*5, mouseX, mouseY + ht*0.5);
  stroke(255, 0, 0);
  strokeWeight(2);
  line(mouseX - wd*0.3, mouseY, mouseX + wd*0.3, mouseY);
  line(mouseX, mouseY - ht*0.3, mouseX, mouseY + ht*0.3);
}

void mousePressed()
{
   double xdis = abs(mouseX - x);
   double ydis = abs(mouseY - y);
   double xdis2 = abs(mouseX - x2);
   double ydis2 = abs(mouseY - y2);
   if ((xdis < wd && ydis < ht && score > 1) || (xdis2 < wd2 && ydis2 < ht2 && score > 1))
      {
        fill(255, 174, 0);
        noStroke();
        rect(0, 0, width, height);
        textSize(50);
        fill(255, 255, 255);
        textAlign(CENTER, CENTER);
        text("TANGO DOWN", width*0.5, height*0.5);
        col = color(random(255), random(255), random(255));
        score = score - 1;
      }
    else if (xdis < wd && ydis < ht && score == 1)
      {
        textSize(50);
        fill(255, 0, 0);
        text("GAME OVER", width*0.15, height*0.5);
        score = score - 1;
        noLoop();
        }
}

void mouseReleased()
{
  x = random(width);
  y = random(height);
}



