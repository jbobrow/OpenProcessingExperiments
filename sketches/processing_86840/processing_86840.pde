
/**
 * Shape Primitives.
 *
 * The basic shape primitive functions are triangle(),
 * rect(), quad(), ellipse(), and arc(). Squares are made
 * with rect() and circles are made with ellipse(). Each
 * of these functions requires a number of parameters to
 * determine the shape's position and size.
 */

size(640, 360);
background(#202121);
noStroke();

fill(200);
pushMatrix();
rotate(radians(-2)) ;
triangle(550, 250, 300, 100, 100, 200);
popMatrix();


fill(#CBF4FF);
pushMatrix();
arc(310, 180, 177, 170, PI, TWO_PI);
popMatrix();

fill(#FFFF5F);
rotate(radians(-26));
arc(120, 220, 70, 50, PI, TWO_PI);



