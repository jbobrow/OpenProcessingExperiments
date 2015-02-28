
//Homework8
//Vishal Agrawal
//vishala@andrew.cmu.edu
//copyright (C) 2012

float x ,y;
boolean flag;

void setup()
{
  size(500, 500);
  x = 0;
  y = 0;
  flag = true;
    fill(0);
  rect(0,0,width, height);
}

void draw()
{
  if(flag == true)
  {
    patternX();
    setX();
  }
  else
  {
    patternY();
    setY();
  }
}

void patternX()
{
  while(x<width)
  {
    stroke(random(255),random(255),random(255));
    line(width/2, height/2, x, 0);
    line(width/2, height/2, x, height);
    x++;
  }
}

void setX()
{
  x = 0;
}

void patternY()
{
  while(y<height)
  {
    stroke(random(255),random(255),random(255));
    line(width/2, height/2, 0, y);
    line(width/2, height/2, width, y);
    y++;
  }
}

void setY()
{
  y = 0;
}

void mousePressed()
{
  if(flag == true)
  {
    flag = false;
  }
  else
  {
    flag = true;
  }
  fill(0);
  rect(0,0,width, height);
}

void keyPressed()
{
  if (keyCode == DOWN)
  {
    frameRate(5);
    println(frameRate);
  }
  else if (keyCode == UP)
  {
     frameRate(200);
      println(frameRate);
  }
}                               
