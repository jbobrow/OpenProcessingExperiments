
// 48-257, bumyeolk_HW8
// Bumyeol Kim, Copyright 2012

void setup()
{
  size(400, 400);
  smooth();
  background(255);
}

void draw()
{
  whileCode();
}

void whileCode()
{
  int i = 0;
  while(i < width)
  {
    stroke(mouseX%width, random(255), mouseY&height);
    strokeWeight(5);
//    fill(random(255), random(255), random(255));
    line(i, 0, i, height);
    i = i + 20;
  }
}

void mousePressed()
{
  if(mouseButton == LEFT)//draw circle forms
  {
    stroke(random(255), random(255), random(255));
    noFill();
    strokeWeight(1);
    ellipse(mouseX, mouseY, 30, 30);
    ellipse(mouseX, mouseY, 40, 40);
    ellipse(mouseX, mouseY, 50, 50);
  }
  else if(mouseButton == RIGHT)//draw rect forms
  {
    noFill();
    strokeWeight(1);
    stroke(random(255), random(255), random(255));
    rectMode(CENTER);
    rect(mouseX, mouseY, 30, 30);
    rect(mouseX, mouseY, 40, 40);
    rect(mouseX, mouseY, 50, 50);
  }
}

void keyPressed()
{
  if(keyPressed == true)//press any keys to stop
  {
    noLoop();
  }
  if(key == ' ')//press space bar to restart / reset
  {
    loop();
    background(255);
  }
}

