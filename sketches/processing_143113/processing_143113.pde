
/*----------------------------------
 
 Copyright by Diana Lange 2014
 Don't use without any permission
 
 This sketch is based on:
 #468 Arise 
 http://geometrydaily.tumblr.com/post/53757017292/468-arise-a-new-minimal-geometric-composition
 
 mail: kontakt@diana-lange.de
 web: diana-lange.de
 facebook: https://www.facebook.com/DianaLangeDesign
 flickr: http://www.flickr.com/photos/dianalange/collections/
 tumblr: http://dianalange.tumblr.com/
 twitter: http://twitter.com/DianaOnTheRoad
 --------------------------------------*/

int W;
float H;
float h;
float hChange;
float sChange;
int res = 7;
int margin;

void setup ()
{
  size (700, 700);
  smooth();

  margin = width /10;
  res = 7;

  W = width-2*margin;
  H = (int) sqrt (sq (W) - sq (0.5*W));
  h = 188;
  hChange = 35.0/res;
  sChange = 35.0/res;
  colorMode (HSB, 360,100,100);
}


void draw ()
{
  background (0, 0, 92);


  PVector p1 = new PVector (margin, height-margin);
  PVector p2 = new PVector (width-margin, height-margin);
  PVector p3 = new PVector (margin+W/2.0, height-margin-H);

  float x2, y2, x3, y3;
  float m;

  noStroke();
  
  float htemp = h, s = 20, b = 76;
  

  for (int i = 0; i < res; i++)
  {
    m = map (i, 0, res, 0, 1);
    x2 = lerp (p3.x, p1.x, m);
    y2 = lerp (p3.y, p1.y, m);

    m = map (i+1, 0, res, 0, 1);
    x3 = lerp (p3.x, p1.x, m);
    y3 = lerp (p3.y, p1.y, m);
    
    fill (htemp,s+sChange/res*i,b-70.0 / res *i);

    triangle (p2.x, p2.y, x2, y2, x3, y3);
    
    htemp -= hChange/res;
    if (htemp < 0) htemp+= 360;
    else if (htemp > 360) htemp-= 360;
  }
}


void mouseDragged ()
{
  if (mouseButton == LEFT) res = (int) map (mouseX, 0, width, 3,  30);
  else 
  {
    margin = (int) map (mouseX, 0, width, 0, width/3);
     H = (int) sqrt (sq (W) - sq (0.5*W));
     W = width-2*margin;
  }
}


void keyPressed ()
{
  if (key == 'h') 
  {
    h = random (360);
    hChange = random (-150, 150);
    sChange = random (20, 80);
  }
  if (key == ' ') setup();
}

