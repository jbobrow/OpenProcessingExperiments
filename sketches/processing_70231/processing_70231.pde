
//Sydney C, CP1 mods: 4/5, Functions and Animation
float c = 0;
float y = 250;
int x = 0;
int y2 = 50;
float yChange = -1;
float s = 80;

void setup()
{
  size(500,400);    
  noStroke();
}

void draw()
{
  fill(20-c,250-c,230-c);
  rect(0,0,500,400);
  c = c + .4;
  if(c>220)
  {
    c=0;
  }
  fill(255,255,255,180);
  ellipse(60,60,100,100);
  fill(20-c,250-c,230-c);
  ellipse(75+s,60,80,80);
  s = s - .05;
  if(s<2.3502)
  {
    s=80;
  }
  sun();
  fill(16-c,222-c,65-c);
  arc(250,500,600,500,PI,PI+PI);
}

void sun()
{
  fill(245,168,12);
  triangle(x-25,y,x,y-25,x-60,y-60);
  triangle(x+25,y,x,y+25,x+60,y+60);
  triangle(x,y-25,x+25,y,x+60,y-60);
  triangle(x,y+25,x-25,y,x-60,y+60);
  triangle(x-20,y-20,x+20,y-25,x,y-80);
  triangle(x-20,y+20,x+20,y+25,x,y+80);
  triangle(x-80,y,x-20,y-25,x+20,y+25);
  triangle(x+80,y,x+20,y+25,x-20,y-25);
  fill(245,141,12);
  triangle(x-25,y-25,x,y-35,x-35,y-75);
  triangle(x+25,y+25,x,y+35,x+35,y+75);
  triangle(x-25,y+25,x,y+35,x-35,y+75);
  triangle(x+25,y-25,x,y-35,x+35,y-75);
  triangle(x-25,y-25,x-35,y,x-75,y-35);
  triangle(x-25,y+25,x-35,y,x-75,y+35);
  triangle(x+25,y+25,x+35,y,x+75,y+35);
  triangle(x+25,y-25,x+35,y,x+75,y-35);
  fill(249,250,30);
  ellipse(x,y,100,100);
  y = y + yChange;
  yChange = yChange + .004;
  if(x>550)
  {
    x = 0;
    y = 250;
    yChange = -1;
  }
  if(x>310)
  {
    text("Good Night!",200,50);
  }
  if(x<100)
  {
    fill(255);
    textSize(36);
    text("Good Morning!",200,50);
  }
  x = x + 1;
}
