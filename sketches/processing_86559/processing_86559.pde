
/**
 * Shape Primitives. 
 * 
 * The basic shape primitive functions are triangle(),
 * rect(), quad(), ellipse(), and arc(). Squares are made
 * with rect() and circles are made with ellipse(). Each 
 * of these functions requires a number of parameters to 
 * determine the shape's position and size. 
 */

size(600, 600);
background(#7ED7FF);
noStroke();

fill(#7C4701); /** brown circle */
ellipse(305, 198, 110, 110);

fill(#F2E702); /** yellow circle */
ellipse(305, 198, 50, 50);

fill (#006C08); /**green stem*/
rect (300, 300, 10, 300);

fill (#006C08); /**green grass*/
rect (0, 500, 600, 100);

fill(255); /** white petal*/
ellipse(305, 115, 50, 100);

fill(#FFCBEC); /** pink petal*/
pushMatrix ();
rotate (radians (15));
ellipse(360, 30, 50, 100);
popMatrix ();

fill(255); /** white petal*/
pushMatrix ();
rotate (radians (42));
ellipse(380, -140, 50, 100);
popMatrix ();

fill(#FFCBEC); /** pink petal*/
pushMatrix ();
rotate (radians (70));
ellipse(320, -300, 50, 100);
popMatrix ();

fill(255); /** white petal*/
pushMatrix ();
rotate (radians (120));
ellipse(40, -440, 50, 100);
popMatrix ();

fill(#FFCBEC); /** pink petal*/
ellipse(305, 280, 50, 100);

fill(255); /** white petal*/
pushMatrix ();
rotate (radians (30));
ellipse(360, 100, 50, 100);
popMatrix ();

fill(#FFCBEC); /** pink petal*/
pushMatrix ();
rotate (radians (70));
ellipse(290, -130, 50, 100);
popMatrix ();

fill(255); /** white petal*/
pushMatrix ();
rotate (radians (96));
ellipse(150, -240, 50, 100);
popMatrix ();

fill(#FFCBEC); /** pink petal*/
pushMatrix ();
rotate (radians (-15));
ellipse(220, 190, 50, 100);
popMatrix ();



