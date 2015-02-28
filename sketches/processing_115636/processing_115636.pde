
float x1, y1, sz1, dx1, dy1;
float x2, y2, sz2, dx2, dy2;
float d;
PImage pic,pic2;
color col2;

void setup()
{
  size (400,400);
  sz1=80;
  x1=random(sz1, width-sz1);
  y1=random(height);
 
  dx1=random(15);
  dy1=random(15);
  
  sz2=90;
  x2=random(sz2, width-sz2);
  y2=random(height);
  dx2=random(15);
  dy2=random(15);
  col2 =color (random(0,255),random(0,255),random(0,255));
  
  rectMode(CENTER);//whyyy not in prepScreen//
  
  imageMode(CENTER);
  pic = loadImage("2.png");
  pic2 = loadImage("bg.png");
}

void prepScreen()
{
  fill(0 ,10);
  rect(width/2,height/2,width,height);
  
  /*for tranelcent background*/
}

void draw()
{
  prepScreen();
  
  movFig1();
  drawFig1();
  
  movFig2();
  drawFig2();
  
  checkCollision(); 
  
}

void checkCollision()
{
  float d = dist (x1, y1, x2, y2);
  if ( d< (sz1/2 + sz2/2) )
  {
     
     fill(137,0,0);
     rect(width/2,height/2,width,height);
     
  }
}

void drawFig1()
{
  fill(random(0,255),random(0,255),random(0,255));
  triangle(x1, y1, x1+30, y1-30, x1+40, y1);
}

void movFig1()
{
  x1 -= dx1;
  
  if (x1 < 0)
  {
    x1= width;
  }
  y1 +=dy1;
  
  if (y1 > height)
  {
    y1 = 0;
  }
}

void drawFig2()
{
  noStroke();
  fill(col2);
  //ellipse(x2,y2,sz2,sz2);
  image(pic,x2,y2,sz2-5,sz2-5);

  //pushMatrix();
    //translate(x2,y2);
    //rotate (radians (frameCount));
    //rect(0,0,sz2,sz2);
    //image(pic,0,0,sz2-5,sz2-5);
  //popMatrix();
}

void movFig2()
{
  x2 += dx2;
  y2 += dy2;
  if (x2> width || x2 < 0)
  {
    dx2= -dx2;
    x2 +=dx2;
  }
  else if (y2 > height|| y2 < 0)
  {
    dy2 = -dy2;
    y2 += dy2;
  }
}

void mouseDragged()
{
  if (mouseX>pmouseX)
      { dx1=1; }
  else if (mouseX<pmouseX)
      { dx1=-1;}
  if (mouseY>pmouseY)
      { dy1=1; }
  else if (mouseY<pmouseY)
      { dy1=-1;}
}
      
void keyPressed()
{
  if (keyCode == RIGHT)
  {
    dx2++;
  }
   
  else if (keyCode == LEFT)
  {
    dx2--;
  }
   
  else if (keyCode == UP)
  {
    dy2--;
  }
  else if (keyCode == DOWN)
  {
    dy2++;
  }
   
   
   
  else if (key == ' ')
  {
    x1 = random(400);
    y1 = random(400);
    x2 = random(400);
    y2 = random(400);
    dx1 = random(15);
    dy1 = random(15);
    dx2 = random(15);
    dy2 = random(15);
     
  }
   
}



