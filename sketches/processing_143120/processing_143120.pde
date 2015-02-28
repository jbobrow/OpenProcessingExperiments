

/*----------------------------------
 
 Copyright by Diana Lange 2014
 Don't use without any permission
 
 This sketch is based on:
 #392 Binocular interference
 http://geometrydaily.tumblr.com/post/44861153655/392-binocular-interference-a-new-minimal
 
 mail: kontakt@diana-lange.de
 web: diana-lange.de
 facebook: https://www.facebook.com/DianaLangeDesign
 flickr: http://www.flickr.com/photos/dianalange/collections/
 tumblr: http://dianalange.tumblr.com/
 twitter: http://twitter.com/DianaOnTheRoad
 --------------------------------------*/

int margin;
float d;
int res = 60;
float a1, a2;

void setup ()
{
  size (700, 700);
  smooth();
  margin = width/10;
  d = (width-2*margin) * 0.66667;
  a1 = -PI;
  a2 = PI/2;
}


void draw ()
{
  background (237);


  noFill();
  stroke (#5A4E09);

  translate (margin+d, height/2+d/2);

  float x1=-d/2 + cos (0)*d/2, y1 = -d/2 + sin (0)*d/2;
  float x2, y2;

  for (int j = 0; j < 2; j++)
  {
    x1= -d/2 + cos ((j == 0 ? a2 : a1))*d/2;
    y1 = -d/2 + sin ((j == 0 ? a2 : a1))*d/2;

    for (int i = 0; i < res; i++)
    {
      x2 = -d/2 + cos ((j == 0 ? a2 : a1)+TWO_PI/res*i)*d/2; 
      y2 = -d/2 + sin ((j == 0 ? a2 : a1)+TWO_PI/res*i)*d/2; 

      line (x1, y1, x2, y2);
    }

    translate (d/2, 0);
  }
}


void mouseDragged ()
{
  res = (int) map (mouseX, 0, width, 3, 300);  
}


void keyPressed ()
{
  if (key == 'a')
  {
    int dice = (int) random (4);
    if (dice == 0) a1 = 0;
    else if (dice == 1) a1 = PI;
    else if (dice == 2) a1 = PI/2;
    else a1 = -PI /2;
    
    dice = (int) random (4);
    if (dice == 0) a2 = 0;
    else if (dice == 1) a2 = PI;
    else if (dice == 2) a2 = PI/2;
    else a2 = -PI /2;
  }
  
  if (key == ' ') setup();
}

