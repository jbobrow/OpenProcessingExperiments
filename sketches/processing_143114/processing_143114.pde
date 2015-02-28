

/*----------------------------------
 
 Copyright by Diana Lange 2014
 Don't use without any permission
 
 This sketch is based on:
 #338 Square attractor 
 http://geometrydaily.tumblr.com/post/37113362376/338-square-attractor-a-new-minimal-geometric
 
 mail: kontakt@diana-lange.de
 web: diana-lange.de
 facebook: https://www.facebook.com/DianaLangeDesign
 flickr: http://www.flickr.com/photos/dianalange/collections/
 tumblr: http://dianalange.tumblr.com/
 twitter: http://twitter.com/DianaOnTheRoad
 --------------------------------------*/

int W;
float angle;
float wm;
float xw;


void setup ()
{
  size (700, 700);
  smooth();
  wm = 0.89;
  xw = 4.5;
  angle = PI / 6;
  W = width/3;
  //println (W);
}


void draw ()
{
  background (237);


  translate (width/2, height/2+W/4);

  noFill();

  float TW = W;

  stroke (#5A3E0A, 180);
  strokeWeight (1.25);

  while (TW > 10)
  {
    rect (-TW/2, -TW/2, TW, TW);

    translate (-TW/xw, -TW/(xw*2));
    rotate (angle); 
    TW *= wm;
  }
}


void mouseDragged ()
{
  if (mouseButton == LEFT)
  {
    angle = map (mouseX, 0, width, - PI / 4, PI /4);
    wm = map (mouseY, 0, width, 0.2, 0.99);
  }
  else xw = map (mouseX, 0, width, 0.1, 20);
  xw = constrain (xw, 0.1, 20);
  wm = constrain (wm, 0.2, 0.99);
}


void keyPressed ()
{

  if (key == ' ') setup();
}

