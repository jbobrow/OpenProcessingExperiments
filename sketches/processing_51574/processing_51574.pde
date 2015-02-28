
//homework7 2.7.12
//copyright Victoria Adams
 
float gx, gy, gxSpeed, gySpeed, d;
float px, py, pxSpeed, pySpeed;
int s;
 
color b;
color c;
 
void setup()
{
  c = color(100, 252, 246);
  b = color(13, 53, 85);
  gx = 0;
  gy = random(height);
  d = 50;
  gxSpeed = 3;
  gySpeed = 3;
  px = 200;
  py = 200;
  pxSpeed = 0;
  pySpeed = 0;
  s = 0;
   
  size (400, 400);
  smooth ();
  background (b);
   
}
 
void draw ()
{
  prepWindow ();
  drawGhost (gx, gy, d);
  bounceGhost ();
  drawPacman (px, py, d);
  wrapPacman ();
  score ();
}
 
void score ()
{
  int m = second();
  float t = dist( gx, gy, px, py );
  fill (255, 255, 255);
   
  if (t <= 30)
  {
    s++;
  }
  
  textSize (30);
  text (s, width/9, height*.85);
  text (m, width/9, height*.95);
  
  if (t <= 30)
  {
    gx = random (0, width);
    gy = random (0, height);
    gxSpeed = random (1, 7);
    gySpeed = random (1, 7);
  }
  
  if (t <= 30)
  {
    c = color(13, 53, 85);
    b = color (255, 255, 255);
  }
  else if (t > 110)
  {
    b = color (13, 53, 85);
    c = color(100, 252, 246);
  }
}
 
void mouseDragged( )
{
  if ( mouseX > pmouseX )
  {
    pxSpeed+=.1;
  }
  else if ( mouseX < pmouseX )
  {
    pxSpeed-=.1;
  }
  if (mouseY > pmouseY)
  {
    pySpeed+=.1;
  }
  else if (mouseY < pmouseY)
  {
    pySpeed-=.1;
  }
}
 
void wrapPacman ()
{
  px += pxSpeed;
  if (px > width + .5*d)
  {
    px = 0 + .5*d;
  }
    
  if (px < 0 - .5*d)
  {
    px = width - .5*d;
  }
    
  py += pySpeed;
  if (py > height + .5*d)
  {
    py = 0 + .5*d;
  }
    
  if (py < 0 - .5*d)
  {
    py = height - .5*d;
  }
}
  
void drawPacman (float x, float y, float d)
{
  noStroke ();
  fill (255, 249, 64);
  ellipse (x, y, d, d);
    
  fill (b);
  beginShape ();
  vertex (x + .55*d, y + .4*d);
  vertex (x, y);
  vertex (x + .55*d, y - .4*d);
  vertex (x + .55*d, y + .4*d);
  endShape ();
}
 
void prepWindow ()
{
  fill (b);
  rect (0, 0, width, height);
}
 
void bounceGhost ()
{
  gx = gx + gxSpeed;
  if (gx > width)
  {
    gxSpeed = -gxSpeed;
  }
  else if (gx < 0)
  {
    gxSpeed = -gxSpeed;
  }
        
  gy = gy + gySpeed;
  if (gy > width)
  {
    gySpeed = -gySpeed;
  }
  else if (gy < 0)
  {
    gySpeed = -gySpeed;
  }
}
 
void drawGhost (float x, float y, float d)
{
  //body
  noStroke ();
  fill (c);
  ellipse (x, y, d, d);
  beginShape ();
    vertex (x - .5*d, y);
    vertex (x - .5*d, y + .55*d);
    vertex (x - .4*d, y + .5*d);
    vertex (x - .3*d, y + .55*d);
    vertex (x - .2*d, y + .5*d);
    vertex (x - .1*d, y + .55*d);
    vertex (x, y + .5*d);
    vertex (x + .1*d, y + .55*d);
    vertex (x + .2*d, y + .5*d);
    vertex (x + .3*d, y + .55*d);
    vertex (x + .4*d, y + .5*d);
    vertex (x + .5*d, y + .55*d);
    vertex (x + .5*d, y);
    vertex (x - .5*d, y);
  endShape ();
   
  //eyes
  fill (255, 255, 255);
  ellipse (x + .15*d, y - .1*d, .15*d, .15*d);
  ellipse (x - .15*d, y - .1*d, .15*d, .15*d);
     
}               
