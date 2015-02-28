
//Flower TIME
//By, John Robbins

//My first Processing sketch. Please do ignore the commented out portions.
//I'm leaving them in because I will probably need to reference them later.

size(500, 500);
background(#9CEBED);
noStroke();

//Window
fill(#C2FBFC);
rect(20, 50, 200, 200);

//Frame
fill(#534741);
rect(0, 50, 20, 200);

fill(#534741);
rect(0, 30, 220, 20);

fill(#534741);
rect(0, 250, 220, 20);

fill(#534741);
rect(220, 30, 20, 200);

//Frame shadows
fill(#2d241d);
rect(20, 50, 2, 200);

fill(#2d241d);
rect(20, 50, 200, 2);

fill(#2d241d);
rect(220, 50, 2, 200);

fill(#2d241d);
rect(20, 250, 200, 2);

//Stem
fill (#46230D);
rect (250, 300, 20, 200);

//Pot
fill(0);
quad(170, 420, 360, 420, 320, 500, 200, 500);

//Center Yellow dot
fill(#D9E35E);
ellipse(260, 250, 70, 70);

//Start Petals
fill(#f69679);
ellipse(260, 210, 35, 35);

fill(#f69679);
ellipse(280, 210, 35, 35);

fill(#f69679);
ellipse(300, 225, 35, 35);

fill(#f69679);
ellipse(307, 240, 35, 35);

fill(#f69679);
ellipse(306, 260, 35, 35);

fill(#f69679);
ellipse(295, 275, 35, 35);

fill(#f69679);
ellipse(270, 290, 35, 35);

fill(#f69679);
ellipse(250, 290, 35, 35);

fill(#f69679);
ellipse(235, 280, 35, 35);

fill(#f69679);
ellipse(225, 260, 35, 35);

fill(#f69679);
ellipse(225, 240, 35, 35);

fill(#f69679);
ellipse(235, 220, 35, 35);

//End Petals



/*
THINGS TO REMEMBER:
On the rect command the first two parameters are the positioning. 
The second two are the size of the rectangle. it is in X, Y format.

On the quad command the parameters are all X, Y base, seemingly
Moving clockwise around the figure.

On ellipse, it is X,Y parameters first followed by the size of the
circle.

If you decide to do anything using rotate, remember that you have to 
first use pushMatrix followed by popMatrix to stop the rest of the
sketch from rotating.



fill (#82C07F);
rect (120, 150, 120, 220);

fill (#6BC067);
rect (180, 170, 220, 220);

fill (#366134);
pushMatrix();
rotate(radians(10));
rect (200, 200, 220, 340);
popMatrix();
*/


