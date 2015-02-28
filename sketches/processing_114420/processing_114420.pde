
//Ara Lee
//aral
//copyright Ara Lee, October 2013, Pittsburgh, PA
//hw7
//257

//variables
float x1, y1;  //cloud location
float x2_1, y2_1, x2_2, y2_2, x2_3, y2_3;   //raindrop location

float dx1, dy1;  //temporary x, y values

float r;  //rate of raindrops falling

void setup()
{
  size(400, 400);
  
  x1 = random(width);
  y1 = random(height);
  
  x2_1 = random(width);
  y2_1 = 0;
  
  x2_2 = random(width);
  y2_2 = 0;
  
  x2_3 = random(width);
  y2_3 = 0;
  
  r = 2.3;
  
  dx1 = 1.7;
  dy1 = 1.2;
}

void draw()
{
  prepScrn();
  
  cloud();
  moveCloud();
  
  rainDrops();
  raining();
  
  checkCollision();
}

void prepScrn()
{
  fill(170, 150);
  rect(0, 0, width, height);
}

void cloud()
{
  noStroke();
  fill(255, 100);
  ellipse(x1-30, y1+5, 45, 45);
  ellipse(x1, y1, 55, 55);
  ellipse(x1+30, y1+5, 45, 45);
}

void moveCloud()
{
  x1 += dx1;
  if(x1 > width || x1 < 0)
  {
    dx1 = -dx1;
  }
  
  y1 += dy1;
  if(y1 > height || y1 < 0)
  {
    dy1 = -dy1;
  }
}

void rainDrops()
{
  fill(0, 0, 255, 80);
  drop1();
  drop2();
  drop3();
}

void drop1()
{
  ellipse(x2_1, y2_1, 20, 20);
}

void drop2()
{
  ellipse(x2_2, y2_2, 20, 20);
}

void drop3()
{
  ellipse(x2_3, y2_3, 20, 20);
}

void raining()
{
  //drop1
  if(x2_1 < 0 || y2_1 > height)
  {
    x2_1 = random(width);
    y2_1 = 0;
  }
  x2_1 = x2_1 - r;
  y2_1 = y2_1 + 2*r;
  
  //drop2
  if(x2_2 < 0 || y2_2 > height)
  {
    x2_2 = random(width);
    y2_2 = 0;
  }
  x2_2 = x2_2 - 1.1*r;
  y2_2 = y2_2 + 2.3*r;
  
  //drop3
  if(x2_3 < 0 || y2_3 > height)
  {
    x2_3 = random(width);
    y2_3 = 0;
  }
  x2_3 = x2_3 - 1.2*r;
  y2_3 = y2_3 + 2.1*r;
}

void checkCollision()  //lightning
{
  float d1 = dist(x1, y1, x2_1, y2_1);
  float d2 = dist(x1, y1, x2_2, y2_2);
  float d3 = dist(x1, y1, x2_3, y2_3);
  
  if(d1 < 40)
  {
    fill(255, 255, 0, 200);
    rect(0, 0, width, height);
  }
  if(d2 < 40)
  {
    fill(255, 255, 0, 200);
    rect(0, 0, width, height);
  }
  if(d3 < 40)
  {
    fill(255, 255, 0, 200);
    rect(0, 0, width, height);
  }
}

void keyPressed()
{
  if(key == 'R')
  {
    r = r+.1;
    if(r > 8)
    {
      r = 2;
    }
  }
  if(key == 'r')
  {
    r = r-.1;
    if(r < 0)
    {
      r = .1;
    }
  }
  if(key == ' ')
  {
    x1 = random(width);
    y1 = random(height);
    
    x2_1 = random(width);
    y2_1 = 0;
    
    x2_2 = random(width);
    y2_2 = 0;
    
    x2_3 = random(width);
    y2_3 = 0;
    
    r = 2.3;
    
    dx1 = 1.7;
    dy1 = 1.2;
  }
}


