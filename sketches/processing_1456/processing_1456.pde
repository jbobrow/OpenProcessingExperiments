
/**
 * Pointillism
 * by Daniel Shiffman. 
 * 
 * Mouse horizontal location controls size of dots. 
 * Creates a simple pointillist effect using ellipses colored
 * according to pixels in an image. 
 */

//edited and notated by Cat Homlish

PImage a;

void setup()
{
  a = loadImage("apple.jpg");
  size(240,320);
  noStroke();
  background(59);
  smooth();
}

void draw()
{ 
  float pointillize = map(mouseX, 120, width, 2, 50);
  /*explanation on numbers:
  first number is where you want your smallest dots...
      so 0 is far left, 50 is at 50, 120 is about middle
      for this example, etc etc...
  second number is the smallest size you want your dots to be and
  third number is the largest size you want your dots to be.
  */
  int x = int(random(a.width));
  int y = int(random(a.height));
  color pix = a.get(x, y);
  /* Sets up the component _pix_ to be used for the color of our
     ellipsis.  This can be taken out for randomization. */
  fill(pix, 126);
  /* determines the color of the dots, which in this case is
     based on an image we chose. */
  ellipse(x, y, random(pointillize), random(pointillize));
  /* determines location of the dots..  The random factor is to
     randomize the sizes of the points a little.  This can be
     taken out if desired.  Just replace it with pointillize
     or a number if you want it one consistent size (Though that
     kind of ruins the point of the pointillize statement).*/
}

