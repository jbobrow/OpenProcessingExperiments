
/*
Day01_Assignment_By_Katherine_Louise_Boehm
Creating a Simple Character
Space Fisherman
*/

size(1000, 800);
 
//Draw the moon

fill(227, 227, 227);
stroke(52, 49, 49);
strokeWeight(10);
smooth();
ellipse(500, 800, 600, 600);

//Moon Craters

fill(52, 49, 49);
ellipse(400, 600, 50, 40);
ellipse(300, 725, 70, 50);
ellipse(600, 675, 70, 50);
ellipse(675, 800, 100, 80);
ellipse(600, 550, 30, 20);

//Draw the Astronaut Body

//Body
fill(229, 227, 227);
stroke(111, 102, 102);
strokeWeight(6);
smooth();
ellipse(500, 410, 220, 180);

//Left Button

fill(136, 209, 116);
stroke(255);
strokeWeight(2);
ellipse(475, 450, 25, 25);

//Right Button

fill(136, 209, 116);
stroke(255);
strokeWeight(2);
ellipse(525, 450, 25, 25);

//Line

fill(255);
stroke(136, 209, 116);
strokeWeight(4);
rect(485, 440, 30, 20);


//Draw the Astronaut Feet

//Left Foot

fill(191, 187, 187);
stroke(111, 102, 102);
strokeWeight(6);
smooth();
ellipse(450, 500, 30, 60);

//color

noFill();
stroke(136, 209, 116);
strokeWeight(3);
smooth();
ellipse(450, 500, 25, 55);

//Right Foot

fill(191, 187, 187);
stroke(111, 102, 102);
strokeWeight(6);
smooth();
ellipse(550, 500, 30, 60);

//color

noFill();
stroke(136, 209, 116);
strokeWeight(3);
smooth();
ellipse(550, 500, 25, 55);


//Draw Astronaut Arms

//Left Arm

fill(229, 227, 227);
stroke(111, 102, 102);
strokeWeight(6);
smooth();
ellipse(375, 400, 50, 40);

//color

noFill();
stroke(136, 209, 116);
strokeWeight(3);
smooth();
ellipse(375, 400, 45, 35);

//Right Arm

fill(229, 227, 227);
stroke(111, 102, 102);
strokeWeight(6);
smooth();
ellipse(625, 400, 50, 40);

//color

noFill();
stroke(136, 209, 116);
strokeWeight(3);
smooth();
ellipse(625, 400, 45, 35);


//Draw Astronaut Head

//Helmet

fill(229, 227, 227);
stroke(111, 102, 102);
strokeWeight(6);
smooth();
ellipse(500, 300, 250, 250);

//Helmet Stripe

stroke(136, 209, 116);
strokeWeight(3);
ellipse(500, 300, 245, 245);

//Helmet Glass

fill(239, 208, 207);
stroke(111, 102, 102);
strokeWeight(6);
smooth();
ellipse(500, 300, 215, 215); 


//Draw Astronaut Face

//Left Eye

fill(255);
stroke(3, 1, 0);
strokeWeight(4);
smooth();
ellipse(450, 280, 75, 100);

//Left Pupil

fill(3, 1, 0);
stroke(3, 1, 0);
strokeWeight(4);
smooth();
ellipse(450, 305, 35, 45);

//Right Eye
fill(255);
stroke(3, 1, 0);
strokeWeight(4);
smooth();
ellipse(550, 280, 75, 100);

//Right Pupil

fill(3, 1, 0);
stroke(3, 1, 0);
strokeWeight(4);
smooth();
ellipse(550, 305, 35, 45);

//Mouth

fill(3, 1, 0);
stroke(3, 1, 0);
strokeWeight(4);
smooth();
ellipse(475, 360, 50, 25);


//Draw Fisherman Pole

strokeWeight(5);
line(650, 400, 800, 200);

//Fisherman Line
strokeWeight(1);
line(800, 200, 800, 800);













