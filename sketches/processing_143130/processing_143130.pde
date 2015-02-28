
/*----------------------------------
 
 Copyright by Diana Lange 2014
 Don't use without any permission
 
 This sketch is based on:
 #450 Pupils of the world
 http://geometrydaily.tumblr.com/post/51642495789/450-pupils-of-the-world-a-new-minimal-geometric
 
 mail: kontakt@diana-lange.de
 web: diana-lange.de
 facebook: https://www.facebook.com/DianaLangeDesign
 flickr: http://www.flickr.com/photos/dianalange/collections/
 tumblr: http://dianalange.tumblr.com/
 twitter: http://twitter.com/DianaOnTheRoad
 ------------------------------*/

int margin;
int res = 4;
int padding;

color c [] = {
  #75a665, 
  #5c801a, 
  #5a7e18, 
  #735742, 
  #afb837, 
  #564311, 
  #32320e
};

void setup ()
{
  size (700, 700);
  smooth();

  frameRate (10);
  margin = width/10;
  padding = width /30;
  res = 4;
}

void draw ()
{
  background (237);
  randomSeed (year() + day() + hour() + minute() + (second ()/ 20 % 2));

  noStroke();

  int d = int ((width-2*margin-(res-1)*padding) /(float) res);
  int D = d;

  for (int x = margin; x < width-margin; x+=d+padding)
  {

    for (int y = margin; y < width-margin; y+=d+padding)
    {
      D = d;

      int [] cc = new int [3];

      int i = 0;

      while (i < cc.length)
      {
        int index = (int) random (c.length);

        boolean taken = false;

        for (int j = 0; j < i; j++)
        {
          if (cc[j] == index) 
          {
            taken = true;
            break;
          }
        }
        if (!taken)
        {
          D = (int) random (D/2, D);
          fill (c[index]);
          ellipse (x+d/2, y+d/2, D, D);
          i++;
        }
      }
    }
  }
}

void mouseDragged ()
{
  if (mouseButton == LEFT)
  {
    margin = (int) map (mouseX, 0, width, 0, width/3);
    padding = (int) map (mouseY, 0, width, 0, height/15);
  }
  else res = (int) map (mouseX, 0, width, 1, 50);
}

void keyPressed ()
{
  setup();
}

