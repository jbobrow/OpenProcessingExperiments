
/* @pjs preload="donut2.jpg"; */

size (300, 300);
background (255);
color y =color (200, 214, 41);
color t =color (150, 190, 32);
color g =color (190, 177, 132);

PImage img= loadImage ("donut2.jpg");

tint (g+y);
image (img, 0, 0, 100, 100);


tint (y);
pushMatrix ();
translate (100, 0);
image (img, 0, 0, 100, 100);
popMatrix ();

tint (g+y);
pushMatrix ();
translate (0, 100);
image (img, 0, 0, 100, 100);
translate (100, 0);
tint (g+t);
image (img, 0, 0, 100, 100);
tint (g+y);
translate (0, 100);
image (img, 0, 0, 100, 100);
translate (100, 0);
tint(t);
image (img, 0, 0, 100, 100);
popMatrix ();

tint (t);
pushMatrix ();
image (img, 200, 0, 100, 100);
tint (g+t);
translate (0, 100);
image (img, 200, 0, 100, 100);
popMatrix ();

tint (g);
image (img, 0,200, 100, 100);


