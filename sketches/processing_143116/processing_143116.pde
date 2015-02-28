

/*----------------------------------
 
 Copyright by Diana Lange 2014
 Don't use without any permission
 
 This sketch is based on:
 #379 Planetary balance 
 http://geometrydaily.tumblr.com/post/43487133293/379-planetary-balance-a-new-minimal-geometric
 
 mail: kontakt@diana-lange.de
 web: diana-lange.de
 facebook: https://www.facebook.com/DianaLangeDesign
 flickr: http://www.flickr.com/photos/dianalange/collections/
 tumblr: http://dianalange.tumblr.com/
 twitter: http://twitter.com/DianaOnTheRoad
 --------------------------------------*/

int margin;
float y;


void setup ()
{
  size (700, 700);
  smooth();
  margin = width/10;
  y = height / 2;
  noLoop();
}


void draw ()
{
  background (237);


  noFill();
  stroke (#3F6F30);
  rect (margin, margin, width-2*margin, height-2*margin);

  float startX = margin+margin*0.75;
  float endX = width-margin-margin*0.75;

  line (startX, y, endX, y);

  float d = (endX - startX) / 4.0;

  float x = random (startX+d/2, endX-d);

  ellipse (x, y, d, d);
  d /= 2;

  ellipse (x, y, d, d);
  ellipse (x+d, y, d, d);

  d /= 2;

  x = random (startX+d, endX-d);
  ellipse (x, y, d, d);
}


void mouseDragged ()
{
}


void keyPressed ()
{
  if (key == ' ')redraw();
}

