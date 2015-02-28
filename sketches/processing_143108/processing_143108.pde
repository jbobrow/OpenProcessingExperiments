

/*----------------------------------
 
 Copyright by Diana Lange 2014
 Don't use without any permission
 
 This sketch is based on:
 #493 Focus shifting
 http://geometrydaily.tumblr.com/post/56516764690/493-focus-shifting-a-new-minimal-geometric
 
 mail: kontakt@diana-lange.de
 web: diana-lange.de
 facebook: https://www.facebook.com/DianaLangeDesign
 flickr: http://www.flickr.com/photos/dianalange/collections/
 tumblr: http://dianalange.tumblr.com/
 twitter: http://twitter.com/DianaOnTheRoad
 --------------------------------------*/


int margin;
int num = 12;
float rad = TWO_PI;
float y = 40;


void setup ()
{
  size (700, 700);
  smooth();
  margin = width /10;

  frameRate (30);

  background (237);
}


void draw ()
{
  background (237);



  strokeWeight (2);
  stroke (#687493);
  translate (width/2, height/2);
  rotate (PI/2);


  for (int i = 0; i < num; i++)
  {
    rotate (rad/num);

    line (-10-i*10, y, width/2-2*margin+i*10, y);
  }
}


void mouseDragged ()
{
  if (mouseButton == LEFT)
  {
    num = (int) map (mouseX, 0, width, 3, 360);
  }
  else 
  {
    y = map (mouseY, 0, width, 0, 100);
    if (!keyPressed) rad = map (mouseX, 0, width, PI/12, 4*TWO_PI);
  }
}


void keyPressed ()
{
  num = 12;
  rad = TWO_PI;
  y = 40;
}

