

/*----------------------------------
      
 Copyright by Diana Lange 2014
 Don't use without any permission
    
 This sketch is based on:
 #504 Rumour 
 http://geometrydaily.tumblr.com/post/58058180988/504-rumour
      
 mail: kontakt@diana-lange.de
 web: diana-lange.de
 facebook: https://www.facebook.com/DianaLangeDesign
 flickr: http://www.flickr.com/photos/dianalange/collections/
 tumblr: http://dianalange.tumblr.com/
 twitter: http://twitter.com/DianaOnTheRoad
 --------------------------------------*/
  
int margin;
float centerX, centerY;

void setup ()
{
  size (700, 700);
  smooth();
  margin = width /10;
  centerX = width/2;
  centerY = height /2;

  frameRate (30);
}


void draw ()
{

  if (mousePressed) 
  {
    centerX = mouseX;
    centerY = mouseY;

    if (mouseButton == RIGHT)
    {
      fill (255, 5);
      noStroke();
      rect (0, 0, width, height);

      copy (1, 1, width, height, -1, -1, width+3, height+3);
    }
    else background (237);
  }
  else 
  {
    background (237);
  }

  stroke (#25576F, 180);
  noFill();

  float kleinD = (height-2*margin) / 5;

  float y1 = centerX;
  float y2 = centerY;
  float x1 = centerX+kleinD/2;
  float x2 = centerX-kleinD/2;

  ellipse (x1, y1, kleinD, kleinD);
  ellipse (x2, y2, kleinD, kleinD);

  line (x1, y1 - kleinD /2, x1, y1 + kleinD/2);
  line (x2, y2 - kleinD /2, x2, y2 + kleinD/2);

  float mittelD = kleinD*2;

  y1 = y1 - kleinD / 2;
  y2 = y2 + kleinD / 2;

  ellipse (x1, y1, mittelD, mittelD);
  ellipse (x2, y2, mittelD, mittelD);

  line (x1-mittelD/2, y1, x1+mittelD/2, y1);
  line (x2-mittelD/2, y2, x2+mittelD/2, y2);

  float grossD = mittelD*2;

  y1 = y1 + kleinD;
  y2 = y2 - kleinD;

  ellipse (x1, y1, grossD, grossD);
  ellipse (x2, y2, grossD, grossD);
}

