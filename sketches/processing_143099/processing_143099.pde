

/*----------------------------------
      
 Copyright by Diana Lange 2014
 Don't use without any permission
    
 This sketch is based on:
 #498 What the moon does when nobody is watching
 http://geometrydaily.tumblr.com/post/57156418537/498-what-the-moon-does-when-nobody-is-watching
      
 mail: kontakt@diana-lange.de
 web: diana-lange.de
 facebook: https://www.facebook.com/DianaLangeDesign
 flickr: http://www.flickr.com/photos/dianalange/collections/
 tumblr: http://dianalange.tumblr.com/
 twitter: http://twitter.com/DianaOnTheRoad
 --------------------------------------*/
  

int margin, padding;
int res = 4;
float ef = 0.7;


void setup ()
{
  size (700, 700);
  smooth();
  margin = width /10;
  padding = width / 60;

  frameRate (30);
}


void draw ()
{
  background (237);

  randomSeed (year() + day() + hour() + minute() + (second ()/ 20 % 2));
  noStroke();

  int dicePosition = 0;
  int diceColor = 0;

  float rectW = (width - 2*margin - (res-1)*padding) / (float) res;
  float d = rectW * ef;

  color ellipseFill = color (237);

  for (float x = margin; x < width-margin; x+=rectW+padding)
  {
    for (float y = margin; y < height-margin; y+=rectW+padding)
    {
      fill (#326C89);
      rect (x, y, rectW, rectW);

      // dice 0 == kein kreis
      // dice 1 == nur oben
      // dice 2 == nur unten
      // dice 3 == oben und unten
      // dice 4 == nur rechts
      // dice 5 == nur links
      // dice 6 == rechts und links
      // dice 7 == vollkreis
      // dice 8 == kein kreis

      diceColor = (int) random (2);
      if (diceColor == 0 ) ellipseFill = color (237);
      else ellipseFill = #1C3D4D;

      dicePosition = (int) random (9);

      if (dicePosition == 1) 
      {
        fill (ellipseFill);
        arc (x + rectW/2, y + rectW /2, d, d, PI, TWO_PI);
      }
      else if (dicePosition == 2) 
      {
        fill (ellipseFill);
        arc (x + rectW/2, y + rectW /2, d, d, 0, PI);
      }
      else if (dicePosition == 3) 
      {
        fill (ellipseFill);
        arc (x + rectW/2, y + rectW /2, d, d, 0, PI);

        if (diceColor == 0) ellipseFill = #1C3D4D;
        else ellipseFill = color (237);

        fill (ellipseFill);
        arc (x + rectW/2, y + rectW /2, d, d, PI, TWO_PI);
      }
      else if (dicePosition == 4) 
      {
        fill (ellipseFill);
        arc (x + rectW/2, y + rectW /2, d, d, PI/2, PI + PI/2);
      }
      else if (dicePosition == 5) 
      {
        fill (ellipseFill);
        arc (x + rectW/2, y + rectW /2, d, d, -PI/2, PI/2);
      }
      else if (dicePosition == 6) 
      {
        fill (ellipseFill);
        arc (x + rectW/2, y + rectW /2, d, d, PI/2, PI + PI/2);

        if (diceColor == 0) ellipseFill = #1C3D4D;
        else ellipseFill = color (237);

        fill (ellipseFill);
        arc (x + rectW/2, y + rectW /2, d, d, -PI/2, PI/2);
      }
      else if (dicePosition == 7) 
      {
        fill (ellipseFill);
        ellipse (x + rectW/2, y + rectW /2, d, d);
      }
    }
  }
}

void mouseDragged ()
{
  if (mouseButton == LEFT) 
  {
    margin = (int) map (mouseX, 0, width, 0, width/2);
    padding = (int) map (mouseY, 0, height, 0, height/10);
  }
  else 
  {
    res = (int) map (mouseX, 0, width, 1, 100);
    ef = map (mouseY, 0, height, 0.1, 2);
  }
}


void keyPressed ()
{
  res = 4;
  ef = 0.7;
  margin = width /10;
  padding = width / 60;
}

