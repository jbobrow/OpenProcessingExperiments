

//----------------------------------------------------------
//     file:  PG_Voronoi1.pde
//  version:  v1.0   2011-02-18  
//            v1.1   2011-02-20
//   author:  Ing. Gerd Platl   
//   tested:  with processing 1.2.1
//  purpose:  interactive Voronoi diagram animation
//    notes:  some tricks used to accelerate drawings:
//            - using pixel[offset] for fast pixels drawing
//            - using square distance calulation to avoid sqrt()
//            - check x and y distance before checking square distance 
//----------------------------------------------------------
// press left mouse button to pause animation
// press right mouse button to swap mode (normal or psychodelic)
//
// key input:   
//   'd'   dots on/off
//   'f'   show/hide frameRate
//   's'   save "snapshoot.png"
//   '-'   decrement dots
//   '+'   increment dots
//   ' '   swap mode (normal or psychodelic)
//-----------------------------------------------------------
class Particle
{
  float x, y;
  color c;
  PVector vel;
   
  Particle()    // constructor
  {
    x = random(width);
    y = random(height);
    c = color(random(64,228), random(128,192), random(128,255));
    vel = new PVector(random(-maxSpeed, maxSpeed), random(-maxSpeed, maxSpeed));
  }
   
  void move()   // move and bounce
  {
    x += vel.x;
    y += vel.y;
    if ((x<0) || (x>width))  vel.x *= -1;
    if ((y<0) || (y>height)) vel.y *= -1;
  }
}
//-----------------------------------------------------------
 Particle[] dots;
 int dim = 512;
 int dotSize = 4;
 int maxDots = 32;
 int animDots = 8;
 float maxSpeed = 4.2;
 float start = 0;
 float fps = 0;
 boolean showDots = true;
 boolean showFPS = true;
 boolean showPsycho = false;
//-----------------------------------------------------------
void drawDots()
{
  for(int i=0; i<animDots; i++)
  {
    Particle s = dots[i];
    fill(s.c, 128);
    stroke(66);
    ellipse(s.x, s.y, dotSize, dotSize);
  }
}
//-----------------------------------------------------------
void moveDots()
{
  for(int i=0; i<animDots; i++)
    dots[i].move();
}
//-----------------------------------------------------------
void colorizeDots(int transparency)
{
  for(int i=0; i<maxDots; i++)
    dots[i].c = color(random(64,228), random(128,192), random(128,255), transparency);
}


//===========================================================
void setup()
{
  size(dim,dim);
  frameRate(120);
  smooth();
  textSize(16); 
  dots = new Particle[maxDots];
  for(int i=0; i<maxDots; i++)   dots[i] = new Particle();
  start = millis();
}
//===========================================================
void draw()
{
  drawRegions();
  if (showDots) drawDots();
  if (!mousePressed) moveDots();  // pause animation
}
//-----------------------------------------------------------
void mouseReleased() 
{
  if (mouseButton == RIGHT) swapMode(); 
}
//-----------------------------------------------------------
void drawRegions()
{
  int pixelOffset = 0;
  float dx,dy,d = 0;
  loadPixels(); // must call before using pixels[]
  
  for(int y=0; y<height; y++)
  {
    for(int x=0; x<width; x++)
    {
      float minDist = 1E12;
      int closest = 0;
      for(int i=0; i<animDots; i++)
      {
        Particle p = dots[i];
        
        dx = sq(p.x - x);
        if (dx < minDist)
        { 
          dy = sq(p.y - y);
          if (dy < minDist)
          {
            d = dx+dy;
            if (d < minDist)
            {
              closest = i;
              minDist = d;   
      } } } }
      // pixels[] is about 10x faster as point(x,y) 
      pixels[pixelOffset] = dots[closest].c;
//      pixels[pixelOffset] = dots[closest].c*int(sqrt(minDist))/100000;
      pixelOffset++;
    }
  }
  updatePixels(); // display picture
  
  // draw average frameRate 
  if (showFPS)
  { if ((frameCount % 30) == 0)
      fps = round(frameCount * 1000 / (millis() - start));
    fill(255,128);
    text("FPS: " + nf(fps,0,1), 11, 22);
  }
}
//-----------------------------------------------------------
void swapMode()
{
  showPsycho = !showPsycho;
  showDots = !showPsycho;
  showFPS = !showPsycho;
  if (showPsycho)
  {
    animDots = 32;
    colorizeDots (24);  // transparent
  }
  else
  {
    animDots = 8;
    colorizeDots (255);  // opaque
  }
  frameCount = 1;
  start = millis();
}
//-----------------------------------------------------------
void keyPressed()
{
  switch (key) 
  { case '+': if (animDots < maxDots) animDots++;   break;
    case '-': if (animDots > 2) animDots--;   break;
    case 'd': showDots = !showDots;   break;
    case 'f': showFPS = !showFPS;   break; 
    case 's': save ("snapshoot.png");   break;
    default:  swapMode();
  }
}

