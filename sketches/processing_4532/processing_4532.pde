
/*
Aja Julian
Processing
September 3, 2009

Create a color, animated composition that scales proportionally
with different window sizes. Use the height or width coordinate
of each primitive to determine its color or grayscale. You must
use one conditional statement in your program.

Sept3, 6:22PM at this point, it's a bunch of fading circles with
colors set by a height/width int.. the colors are keeping a strange
position with the reds and purples along the left side, oranges
and yellows are in the middle/right, and greens/blues are at the
top of the window. I like it!

if you change the ellipse position to be at a stationary point,
it's bunch of centered cirlces that stay in one place.. weird!
*/

int var1;
int var2;
int int1;
int int2;

void setup() {
  size(500,500);
  smooth();
  frameRate(10);
  background(255,255,255);
}

void draw() {
  noStroke();
  int var1 = (int) (random(width));
  int var2 = (int) (random(height));
  int int1 = (int) (random(width/2));
  int int2 = (int) (random(height/3));
  int opac = (int) (random(255));
  fill(var2,var1,int2,opac);
  ellipse(var1,var2,int1,int1);
  fill(0,0,0);
  ellipse(var2,var1,opac/30,opac/30);
  fill(255,255,255,15); // the opacity @x makes a disappearing background
  rect(0,0,width,height);
}
/* if the blahblahblah is located in the upper blah blah blah, it will be a certain
 shade of blahblahblah. If the something has a width of something <>= to something,
 it will be a shade of hoonanny */


