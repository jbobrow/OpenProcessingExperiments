
/*----------------------------------
  
 Copyright by Diana Lange 2014
 Don't use without any permission
  
 This sketch is based on:
 http://beesandbombs.tumblr.com/post/45513650541/orbiters
  
 mail: kontakt@diana-lange.de
 web: diana-lange.de
 facebook: https://www.facebook.com/DianaLangeDesign
 flickr: http://www.flickr.com/photos/dianalange/collections/
 tumblr: http://dianalange.tumblr.com/
 twitter: http://twitter.com/DianaOnTheRoad
 ------------------------------*/

float margin;
float padding;
float angle;
float angleSpeed;

void setup ()
{
  size (600, 600);
  smooth();

  margin = width/10.0;
  padding = margin / 12.0;

  angle = 0;
  angleSpeed = PI / 20;
}

void draw ()
{
  background (#7a9686);

  float x = 0, y = 0;
  float d = 10*padding;
  float d2 = map (d, 3*10, 10*10, 5, 20);
  
  
  noFill();

  while (y < height+d)
  {
    x = 0;
    while (x < width+d)
    {
      noFill();
      stroke(#e8e2b2);
      ellipse (x, y, d, d);
      fill (255);
      noStroke();
      ellipse ( x + cos (angle+radians (x+y))*d/2, y + sin (angle+radians (x+y))*d/2, d2, d2); 
      x += d/2+padding;
    }
    y += d/2+padding;
  }

  angle+= angleSpeed;
  
  fill (#7a9686);
  noStroke();
  rect (0, 0, width, margin);
  rect (0, height-margin, width, margin);
  rect (0, 0, margin, height);
  rect (width-margin, 0, margin, height);
}

void mouseDragged ()
{
  if (mouseButton == LEFT) padding = map (mouseY, 0, height, 3, 10);
  else angleSpeed = map (mouseX, 0, width, 0, PI / 5);
}

