
/*----------------------------------
 
 Copyright by Diana Lange 2014
 Don't use without any permission
 
 This sketch is based on:
 #495 Garden 
 http://geometrydaily.tumblr.com/post/56876400759/495-garden-a-new-minimal-geometric-composition
 
 mail: kontakt@diana-lange.de
 web: diana-lange.de
 facebook: https://www.facebook.com/DianaLangeDesign
 flickr: http://www.flickr.com/photos/dianalange/collections/
 tumblr: http://dianalange.tumblr.com/
 twitter: http://twitter.com/DianaOnTheRoad
 --------------------------------------*/


int margin;
float sw = 2;


void setup ()
{
  size (700, 700);
  smooth();
  margin = width /10;

  frameRate (10);

  background (237);
}


void draw ()
{
  // ellipse

  int dice = (int) random (3);

  float d = 0;//random (width/ 5, width/3);
  if (dice == 0) d = width /3;
  else if (dice == 1) d = width /4.5;
  else d = width /6;

  float x = random (width);
  float y = random (height);

  strokeWeight (sw);
  fill (237);
  stroke(#86A792);

  while (d > 2*sw)
  {
    ellipse (x, y, d, d);

    d-= 4*sw;
  }

  // border

  fill (237);
  noStroke();

  rect (0, 0, width, margin);
  rect (0, height-margin, width, margin);
  rect (0, 0, margin, height);
  rect (width-margin, 0, margin, height);
}


void mouseDragged ()
{
  if (mouseButton ==  LEFT) sw = map (mouseX, 0, width, 0.5, 10);
  else margin = (int) map (mouseY, 0, height, 0, height / 3);
}


void keyPressed ()
{
  if (key == 's') noLoop();
  if (key == 'p') loop();
  if (key == ' ') setup();
}

