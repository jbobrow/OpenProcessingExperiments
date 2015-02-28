
// Written by Jose Pertierra
// jpertier@andrew.cmu.edu
// Copyright Jose Periterra (September 3, 2013) All Rights Reserved

float x, y, wd, ht;
color col;
int score;

void setup()
{
  size(400, 400);
  x = width*0.5;
  y = height*0.5;
  wd = width*0.1;
  ht = height*0.1;
  score = 10;
  col = color(random(255), random(255), random(255));
  frameRate(24);
}

void draw()
{
  background(0, 0, 0);
  fill(255, 0, 0);
  textSize(40);
  text(score, 50, 50);
  noStroke();
  fill(col);
  ellipse(x, y, wd, ht);
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
   if (xdis < wd && ydis < ht && score > 1)
      {
        fill(255, 174, 0);
        noStroke();
        rect(0, 0, width, height);
        col = color(random(255), random(255), random(255));
        textSize(50);
        fill(255, 255, 255);
        text("HEADSHOT", width*0.15, height*0.5);
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

void keyPressed()
{
  if (key == CODED)
    if (keyCode == UP)
    {
      y = y - 45;
    }
    else if (keyCode == DOWN)
    {
      y = y + 45;
    }
    else if (keyCode == LEFT)
    {
      x = x - 45;
    }
    else if (keyCode == RIGHT)
    {
      x = x + 45;
    }
}



