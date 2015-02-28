
/*----------------------------------
       
 Copyright by Diana Lange 2014
 Don't use without any permission
     
 This sketch is based on:
 #454 Codes
 http://geometrydaily.tumblr.com/post/52139211344/454-codes-a-new-minimal-geometric-composition
       
 mail: kontakt@diana-lange.de
 web: diana-lange.de
 facebook: https://www.facebook.com/DianaLangeDesign
 flickr: http://www.flickr.com/photos/dianalange/collections/
 tumblr: http://dianalange.tumblr.com/
 twitter: http://twitter.com/DianaOnTheRoad
------------------------------*/

int margin;
int h;
float d;

void setup ()
{
  size (700, 700);
  smooth();

  margin = width/10;
  h = height / 10;
  d = 10;
}

void draw ()
{
  background (237);
  randomSeed (year() + day() + hour() + minute() + (second ()/ 20 % 2));

  float x = margin;
  float y = height/2;
  float dice;

  noStroke();
  fill (#CE005A);

  while (x < width-margin)
  {  
    dice = random (100);
    if (dice < 20)
    {
      y = height/2-h/2;
    }
    else if (dice >= 20 && dice <= 40)
    {
      y = height/2 - h/2 + h * 0.3333;
    }
    else if (dice >= 40 && dice <= 70)
    {
      y = height/2  +h/2 - h*0.3333;
    }
    else {
      y = height/2+h/2;
    }

    ellipse (x, y, d, d);
    x+= d*2;
  }
}

void mouseDragged ()
{
  if (mouseButton == LEFT)
  {
  margin = (int) map (mouseX, 0, width, 0, width/3);
  h = (int) map (mouseY, 0, height, 50, height);
  }
  else d = map (mouseX, 0,width, 2, 100);
}

