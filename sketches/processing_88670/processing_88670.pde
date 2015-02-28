
//Copyright Yaakov Lyubetsky / ylyubets@andrew.cmu.edu / Januray 31st, 2013
//Homework #6 - Processing for the Arts

//Use "w,a,s,d" keys to control whale that wraps in all four directions
//Use "i,j,k,l" keys to control bird that bounces in all four directions

//Every key press of any of the above keys accelerates that animal in the
//pressed direction

float x, y, wd, ht, bx, by, tx, ty, d, p, velocityWrap, velocityYWrap, velocityBounce, velocityYBounce;
PImage whale, bird;

void setup()
{
  size(400, 400);
  x = .5*width;
  y = .5*height;
  bx = width * .10;
  
  tx = .25*width;
  ty = .25*width;
  d = width * .10;
  p = width * .10;
  
  velocityWrap  = 1;
  velocityYWrap  = 1;
  velocityBounce  = 1;
  velocityYBounce  = 1;
  
  whale = loadImage("Whale.png");
  bird = loadImage("Bird.png");
}

void draw()
{
  //rect(0, 0, width, height);
  //fill(70, 206, 196);
  background(70, 206, 196);
  figure(x, y, bx, by);
  moveFigure();
  target(tx, ty, d, p);
  Bounce();
 
}

void figure(float x, float y, float bx, float by)
{
  image(whale, bx + 10, by + 10, x, y);
}

void moveFigure()
{
  bx += velocityWrap;
  by += velocityYWrap;
  if(bx > width + x)
  {
   bx= 0 - x; 
  }
  if(bx < 0 - x)
  {
   bx= width + x; 
  }
  
  if(by > height + y)
  {
    by= 0 - y; 
  }
  if(by < 0 - y)
  {
    by= height + y; 
  }
}

void target(float tx, float ty, float d, float p)
{
 //fill(0, 200, 105);
 //ellipse(tx, ty, d, d);
 image(bird, tx, ty, d, p);
}

void Bounce()
{
 ty += velocityYBounce;
 tx += velocityBounce;
 if(ty > height)
 {
  velocityYBounce = - velocityYBounce;
 }
 else if(ty < 0)
 {
    velocityYBounce = -velocityYBounce; 
 }
 
  if(tx > width)
 {
  velocityBounce = - velocityBounce;
 }
 else if(tx < 0)
 {
    velocityBounce = -velocityBounce; 
 }
  
}

void keyPressed()
{
 if(key == 'd') //WASD moves wrap object in all directions
  {
   velocityWrap++;
  }
  if(key == 'a')
  {
   velocityWrap--;
  }
  if(key == 's')
  {
   velocityYWrap++;
  }
  if(key == 'w')
  {
   velocityYWrap--;
  }  
  
  
  if(key == 'k') //IJKL moves bounce object in all directions
  {
   velocityYBounce++;
  }
  if(key == 'i')
  {
   velocityYBounce--;
  }
  if(key == 'l')
  {
   velocityBounce++;
  }
  if(key == 'j')
  {
   velocityBounce--;
  }  
}

