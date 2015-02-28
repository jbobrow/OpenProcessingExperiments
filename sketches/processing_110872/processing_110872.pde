
// Written by Jose Pertierra
// jpertier@andrew.cmu.edu
// Copyright Jose Periterra (September 3, 2013) All Rights Reserved

float x, y, x1, y1, x2, y2, wd, ht;
float xspeed = 1;
float yspeed = 2;
float diameter;
color col;

void setup()
{
  size(400, 400);
  smooth();
  x = width*0.5;
  x1 = x;
  x2 = x;
  y = height*0.5;
  y1 = y;
  y2 = y;
  wd = width*0.1;
  ht = height*0.1;
  diameter = wd*1.5;
  col = color(random(255), random(255), random(255));
}

void draw()
{
  background(0, 0, 0);
  fill(255, 255, 255);
  noStroke();
  rect(x - wd*4.5, 0, wd*0.01, height);
  rect(x + wd*4.6, 0, wd*0.01, height);
  rect(0, y - ht*4.5, width, ht*0.01);
  rect(0, y + ht*4.6, width, ht*0.01);
  drawTarget(x2, y2);
  drawBall(x1, y1);
  x1 += xspeed;
  y1 += yspeed;
  fill(179, 7, 7);
  rect(x - wd*4.5, mouseY - ht, wd*0.15, ht*2.0);
  rect(x + wd*4.5, mouseY - ht, wd*0.15, ht*2.0);
  rect(mouseX - wd, y - ht*4.5, wd*2.0, ht*0.15);
  rect(mouseX - wd, y + ht*4.5, wd*2.0, ht*0.15);
  
  if (y1 > mouseY - ht && y1 < mouseY + ht && x1 - wd*0.5 == x - wd*4.4)
  {
    xspeed *= -1;
    col = color(random(255), random(255), random(255));
  }
  else if (y1 > mouseY - ht && y1 < mouseY + ht && x1 + wd*0.5 == x + wd*4.5)
  {
    xspeed *= -1;
    col = color(random(255), random(255), random(255));
  }
  else if (x1 > mouseX - wd && x1 < mouseX + wd && y1 + ht*0.5 == y + ht*4.5)
  {
    yspeed *= -1;
    col = color(random(255), random(255), random(255));
  }
  else if (x1 > mouseX - wd && x1 < mouseX + wd && y1 - ht*0.5 == y - ht*4.5)
  {
    yspeed *= -1;
    col = color(random(255), random(255), random(255));
  }
  else if (x1 < 0 || x1 > width)
  {
    fill(255, 255, 255);
    noStroke();
    rect(0, 0, width, height);
    textSize(50);
    fill(179, 7, 7);
    text("GAME OVER", width*0.13, height*0.5);
    noLoop();
  }
  else if (y1 < 0 || y1 > height)
  {
    fill(255, 255, 255);
    noStroke();
    rect(0, 0, width, height);
    textSize(50);
    fill(179, 7, 7);
    text("GAME OVER", width*0.15, height*0.5);
    noLoop();
  }
  
  else if (x2 < x - wd*4.5 || x2 > x + wd*4.6)
  {
    x2 = x;
    y2 = y;
  }
  else if (y2 < y - ht*4.5 || y2 > y + ht*4.6)
  {
    x2 = x;
    y2 = y;
  }
  
  else if (x1 > x2 - diameter && x1 < x2 + diameter && y1 > y2 - diameter && y1 < y2 + diameter)
  {
    fill(255, 255, 255);
    noStroke();
    rect(0, 0, width, height);
    textSize(50);
    fill(179, 7, 7);
    text("BULLSEYE", width*0.2, height*0.5);
    x2 = x;
    y2 = y;
  }
}

void drawBall(float x, float y)
{
  noStroke();
  fill(col);
  ellipse(x1, y1, wd, ht);
}

void drawTarget(float x, float y)
{
  fill(179, 7, 7);
  ellipse( x, y, diameter*3, diameter*3); 
  fill(255, 255, 255);
  ellipse( x, y, diameter*2, diameter*2); 
  fill(179, 7, 7);
  ellipse( x, y, diameter, diameter);
}

void keyPressed()
{
  if (keyCode == UP)
  {
    y2 -= ht*0.25;
  }
  else if (keyCode == DOWN)
  {
    y2 += ht*0.25;
  }
  else if (keyCode == RIGHT)
  {
    x2 += wd*0.25;
  }
  else if (keyCode == LEFT)
  {
    x2 -= wd*0.25;
  }
  else if (keyCode == 'P')
  {
    textSize(50);
    fill(179, 7, 7);
    text("PAUSED", width*0.27, height*0.2);
    noLoop();
  }
  else if (keyCode == 'C')
  {
    loop();
  }
    
}


