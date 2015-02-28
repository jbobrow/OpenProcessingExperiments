
//Madeline Chan Copyright 2013
//HW 7 Collision
//directions: press RIGHT or LEFT arrows to move the plate to catch the head!


float x1, y1, sz1, dx1, dy1;
float x2, y2, sz2, dx2, dy2;
color col1, col2, col3;


void setup()
{
  background(255,192,243);
  size(400,400);
  x1=100;
  y1=100;
  sz1=80;
  dx1=2;
  dy1=4;
  col1= color(139,69,19); //brown

  x2=200;
  y2=300;
  sz2=90;
  dx2=8;
  col2= color(143,188,143); //green
  col3= color(255,192,243); //pink
  
  rectMode(CENTER);
}

void draw()
{
  background(255,192,243);
  fill(0,102,153);
  
  
  
  prepScreen();
  movFig1();
  Fig1();
  
  //movFig2();
  Fig2();
  
  checkCollision(); 
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

//Bear
void Fig1() 
{
  //ears
  noStroke();
  fill(col1);
  ellipse(x1+sz1*.3,y1-sz1*.3,sz1*.4,sz1*.6);
  fill(col3,99);
  ellipse(x1+sz1*.3,y1-sz1*.3,sz1*.2,sz1*.3);
 
  fill(col1);
  ellipse(x1-sz1*.3,y1-sz1*.3,sz1*.4,sz1*.6);
  fill(col3,99);
  ellipse(x1-sz1*.3,y1-sz1*.3,sz1*.2,sz1*.3);
  
  //head
  fill(col1);
  ellipse(x1,y1,sz1*.8,sz1);
  
  //nose
  fill(col3,90);
  ellipse(x1,y1+sz1*.3,sz1*.4,sz1*.2);
  
  //eyes
  fill(col2);
  ellipse(x1-sz1*.2,y1-sz1*.3,sz1*.1,sz1*.1);
  fill(128);
  ellipse(x1-sz1*.2,y1-sz1*.3,sz1*.05,sz1*.05);
  
  fill(col2);
  ellipse(x1+sz1*.2,y1-sz1*.3,sz1*.1,sz1*.1);
  fill(128);
  ellipse(x1+sz1*.2,y1-sz1*.3,sz1*.05,sz1*.05);
}

void prepScreen()
{
  fill(139,0,0); 
  rect(width/2, height/2, width, height);
}


void movFig2()
{
  x2+=dx2;
  if (x2> width || x2<0)
  {
    dx2=-dx2;
  }
}

void Fig2()
{
  noStroke();
  fill(128,128,128);
  pushMatrix();
  translate(x2,y2);
  //rotate(radians(frameCount));
  rect(0,0,sz2,sz2*.1);
  popMatrix();
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
    text("yay", 200,200);
    
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


