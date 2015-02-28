
//Madeline Chan Copyright 2013
//HW 8 Snowball Polar Bear GameGame
//directions: press RIGHT or LEFT arrows to move the polar bear away from the snowballs!

float x1, y1, sz1, dx1, dy1;
float x2, y2, sz2, dx2, dy2;
color col1, col2, col3;
int hits;

void setup()
{
  size(400,400);
  x1=100;
  y1=100;
  sz1=80;
  dx1=2;
  dy1=4;

  x2=200;
  y2=300;
  sz2=90;
  dx2=8;

  rectMode(CENTER);
  hits = 0;
}

void draw()
{
  fill(0,102,153);
  prepScreen();
  //movFig2();
  Fig2();
  movFig1();
  Fig1();
  //movFig2();
  Fig2();
  
  checkCollision(); 
  showTime();
  showScore();
  Instructions();
}

void prepScreen()
{
  rect(width/2, height/2, width, height);
}


void movFig2()
{
  x2+=dx2;
  if (x2> width || x2<0)
  {
    dx2=-dx2;
  }
  y2+=dy2;
  if (y2> height || y2<0)
  {
    dy2=-dy2;
  }
}

void Fig2()
{
  noStroke();
  fill(128,128,128);
  pushMatrix();
  translate(x2,y2);
  fill(255);
  ellipse(sz2,sz2, sz2*3, sz2*2.4);
  fill(128);
  ellipse(sz2, sz2, sz2, sz2*.8);
  //ears
  fill(255);
  ellipse(sz2*.1,sz2*.1, sz2*.5, sz2*.5);
  ellipse(sz2*1.8,sz2*.1, sz2*.5, sz2*.5);
  //eyes
  fill(0);
  ellipse(sz2*1.8,sz2-sz2*.5, sz2*.1, sz2*.1);
  ellipse(sz2*.1,sz2-sz2*.5, sz2*.1, sz2*.1);
  
  popMatrix();
}

void movFig1()
{
  x1 += dx1;
  if (x1>width)
  {
    x1=0;
  }
  y1 += dy1;
  if(y1>height)
  {
    y1=0;
  }
  
}

void Fig1() 
{ 
  fill(255);
  ellipse(x1-sz1*.3,y1-sz1*.3,sz1*.4,sz1*.4);
}

void checkCollision()
{
  float d=dist(x1,y1,x2,y2);
  if(d<(sz1/2+sz2/2))
  {
    //noLoop();
    fill(255);
    rect(width/2, height/2,width,height);
    fill(0);
    textSize(40);
    text("OH NO", 200,200);
    hits++;
    if (hits>= 200)
    {
      noLoop();
      fill(0);
      textSize(40);
      text("YOU LOSE",200,300);
    } 
  }
}

void keyPressed()
{
  if (keyCode == RIGHT)
  { 
    x2+=dx2;
    if (x2> width || x2<0)
    {
      dx2=-dx2;
    }
  }
  else if (keyCode == LEFT)
  {
    x2-=dx2;
    if (x2> width || x2<0)
    {
      dx2=-dx2;
    }
  }
}

void showTime()
{
  fill(255);
  textSize(10);
  text("Time" + millis()/1000, width*.5, height*.1);
}

void showScore()
{
  fill(255);
  textSize(10);
  text("Score" + hits, width*.5, height*.13);
}

void Instructions()
{
  fill(255);
  textSize(10);
  text("Avoid the snowballs!", width*.1, height*.11);
}


