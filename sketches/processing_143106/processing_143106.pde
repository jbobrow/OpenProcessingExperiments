

/*----------------------------------
 
 Copyright by Diana Lange 2014
 Don't use without any permission
 
 This sketch is based on:
 #497 Four touching spheres form a tetrahedron
 http://geometrydaily.tumblr.com/post/57063952893/497-four-touching-spheres-form-a-tetrahedron
 
 mail: kontakt@diana-lange.de
 web: diana-lange.de
 facebook: https://www.facebook.com/DianaLangeDesign
 flickr: http://www.flickr.com/photos/dianalange/collections/
 tumblr: http://dianalange.tumblr.com/
 twitter: http://twitter.com/DianaOnTheRoad
 --------------------------------------*/


int margin;
int res = 4;
float d;
float zoom = 1;
int W, H;

float [] xpos;
float [] ypos;

void setup ()
{
  size (700, 700);
  smooth();
  margin = width /10;
  d = 0.5*(width-2*margin);
  zoom =1;
  res = 4;
  W = H = (width-2*margin);

  frameRate (30);

  createArray();
  fillArray();
}

void createArray ()
{
  xpos = new float [res];
  ypos = new float [res];
}

void fillArray ()
{
  float x = 0, y = 0;
  for (int i = 0; i < res; i++)
  {
    if (i == 0) 
    {
      x = -W/2+d/2;
      y = -H/2+d/2;
    }
    else if (i == 1) 
    {
      x = W/2 - d/2;
      y = random (-W/2 + d/2, H/2-d/2);
    }
    else if (i == 2)
    {
      y = H/2-d/2;
      x = random (-H/2+d/2, H/2-d/2);
    }
    else 
    {
      x = random (-H/2+d/2, H/2-d/2);
      y = random (-W/2 + d/2, H/2-d/2);
    }
    xpos [i] = x;
    ypos [i] = y;
  }
}


void draw ()
{
  background (237);

  translate (margin+W/2, margin+H/2);
  scale (zoom);


  fill (#AA022C, 200);
  noStroke();
  for (int i = 0; i < res; i++)
  { 
    ellipse (xpos [i], ypos [i], d, d);
  }

  strokeWeight (2);
  stroke (237);
  for (int i = 0; i < res; i++)
  {
    for (int j = i+1; j < res; j++)
    {
      line (xpos [i], ypos [i], xpos [j], ypos [j]);
    }
  }
}


void mouseDragged ()
{
  if (mouseButton == LEFT) d = map (mouseX, 0, width, 5, (width-2*margin) * 0.6667);
  else zoom = map (mouseY, 0, height, 0.5, 3);
}


void keyPressed ()
{
  if (key == '+')
  {
    res++;
    createArray();
    fillArray();
  }

  if (key == '-' && res > 4)
  {
    res--;
    createArray();
    fillArray();
  }

  if (key == ' ' ) fillArray();

  if (key == 'p') setup();
}

