
/*
Exercies I - Self Portrait
By Irene Ye Yuan 
1/6/2015
*/

// Set up the canvas size 100x100
size(100,100);
// Change the background color to white
background(255,255,255);

// Set the color for face and ear
fill(254,217,131);
noStroke();
// Draw the face with a rectangle
rect(20,20,60,70);
// Draw the ear with rectangle
rect(10,50,10,20);
rect(80,50,10,20);

// Set the color for the hair
fill(30,13,6);
// Draw the hair
triangle(35,15,85,15,85,60);
triangle(65,15,45,55,40,35);
triangle(15,15,65,15,15,65);

// Set the color for eyes
fill(0,0,0);
// Draw the eyes
rect(35,60,5,10);
rect(60,60,5,10);

// Set the color for glasses
noFill();
strokeWeight(2);
stroke(0,0,255);
// Draw glasses
rect(29,60,17,10);
rect(54,60,17,10);
line(46,65,54,65);

// Set the color for mouth
strokeWeight(1);
stroke(30,13,6);
// Draw the first part of the mouth with a line
line(40,89,65,85);
// Set the fill color
fill(254,217,131);
// Draw the second part of the mouth with ROTATION!! and arc
translate(width/2+18, height/2+33);
rotate(PI/3.0);
arc(0,0,10,10,0,PI);


