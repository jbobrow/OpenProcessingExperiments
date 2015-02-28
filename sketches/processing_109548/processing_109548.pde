
/**
 * Shape Primitives. 
 * 
 * The basic shape primitive functions are triangle(),
 * rect(), quad(), ellipse(), and arc(). Squares are made
 * with rect() and circles are made with ellipse(). Each 
 * of these functions requires a number of parameters to 
 * determine the shape's position and size. 
 */

size(640, 350);
background(#FCCC91); // #FCCC91
noStroke();

fill(#342525); //Ground
rect(0, 270, 640, 200);

fill(#0E405A); //Shadow
rect(94, 52, 300, 200);

fill(#1572A2);
rect(98, 50, 300, 200);

fill(#676767); // Exhaust Shadow
rect(402, 125, 15, 35, 4);

fill(#898787); // Exhaust
rect(404, 125, 15, 35, 4);

fill(#2F3031); //Shadow
rect(400, 147, 100, 110);

fill(102);
rect(403, 145, 100, 110);

fill(#4A4A4B); //Front wheel
ellipse(445, 250, 70, 70);

fill(#AAAAAA); //Front wheel
ellipse(450, 250, 70, 70);

fill(255); //Front wheel
ellipse(450, 250, 35, 35);

fill(#4A4A4B); //Back wheel dark gray
ellipse(170, 250, 80, 80);

fill(#AAAAAA); //Back wheel light gray
ellipse(175, 250, 80, 80);

fill(255); //Back wheel white
ellipse(178, 250, 40, 40);

fill(#CCCDCE); //Window
rect(425, 160, 60, 40, 12, 12, 3, 3);

fill(#E8E8E8); //Window
rect(428, 159, 60, 40, 12, 12, 3, 3);

fill(255); //Smoke small
ellipse(404, 115, 15, 10);

fill(255); //Smoke small
ellipse(395, 102, 19, 14);




