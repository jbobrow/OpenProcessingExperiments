
/*****************************************
 * Assignment #1
 * Name:         Jordan Schwartz
 * E-mail:       jrschwartz@brynmawr.edu
 * Course:       CS 110 - Section 01
 * Submitted:    9/12/2012
 * 
 * This is the code for Assignment 1. I chose to draw an abstract flower
 accompanied by the sun using triangles, ellipses, rectangles, stroke, fill, 
 smooth, curves, and beginShape() in this project.
***********************************************/

//canvas setup
size(500,500);
background(100,200,250);
smooth();

//Grass
noStroke();
fill(0, 200, 0);
rect(0,450,500,450);

//Flower Stem
noFill();
stroke(0, 200, 0);
strokeWeight(20);
bezier(222, 222,  280, 255,  380, 275,  300, 475);

//Border on Flower
stroke(0);
strokeWeight(1);

//Translucent Petals
fill(250,250,250,100);
triangle(222,222,50,100,125,275);
fill(0,0,0,100);
triangle(222,222,250,100,425,275);

//Blue Petals
fill(200,100,250);
triangle(222,222,100,75,200,70);
triangle(222,222,400,300,100,350);

//Center of Flower
fill(225,175,250);
ellipse(220,225,60,50);

//Sun
stroke(250,150,0);
strokeWeight(5);
fill(250,200,0);
beginShape(TRIANGLES);
vertex(400,70);
vertex(400,30);
vertex(200,40);
vertex(400,70);
vertex(400,115);
vertex(200,150);
vertex(420,120);
vertex(470,138);
vertex(300,240);
vertex(460,100);
vertex(500,110);
vertex(450,290);
ellipse(500,50,240,230);
