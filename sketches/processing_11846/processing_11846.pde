
/* 
Sam Wood
CSE 1341-808
Lab assignment #1 - Simple Drawing/Technology Requirement
Due 09/08/10
*/

//setting the background size and color
size(500, 500);
background(209, 184, 137);
smooth();

/* creating the rectangle that takes up approx. one third of the bottom of the picture,
representing the surface on which the objects are sitting */
fill(162, 162, 162);
noStroke();
rect(0, 300, 500, 300);

//creating the bottom half of the jug on the left
fill(225, 184, 137);
noStroke();
rect(100, 250, 150, 150);

//the very top/spout of the jug on the left
fill(200, 180, 150);
rect(165, 75, 21, 60);

//the top half of the jug on the left
triangle(175, 110, 100, 250, 250, 250);

//creating the shadow of the jar/tube on the right
fill(131, 101, 34, 100);
rect(365, 340, 125, 70);

//creating the jar/tube on the right
fill(198, 200, 255);
rect(250, 170, 120, 240);

//creating the shadow of the ball
fill(131, 101, 34, 100);
ellipse(295, 450, 100, 20);

//creating the ball that rests towards the bottom of the picture, in front of the two large containers
fill(200, 190, 240);
stroke(5, 5, 5, 20);
ellipse(265, 425, 70, 70);

//creating the shading on the right side of the tube on the right
fill(32, 57, 82);
rect(352, 170, 18, 240);















