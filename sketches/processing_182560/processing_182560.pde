
/*
Title: Fun with shapes
Goal: Learn and practise creating shapes in Processing. Getting used to coding. Trying different variations of weight, colors etc.
Created by: Petra Dvorakova
Date: 4.9.2014
*/

//setup
size (600, 600);
background(#FFDDCC);

//strokeWeight for all rectangles
strokeWeight(6);

//first rectangle
stroke(#4C4C4C);
fill(255, 0, 0);
rect(0, 0, 75, 75);

//second rectangle
stroke(#696969);
fill(255, 218, 185);
rect(50, 50, 100, 100);

//third rectangle
stroke(#757575);
fill(200, 150, 122, 75);
rect(100, 100, 110, 110);

//fourth rectangle
stroke(#8E8E8E);
fill(175, 150, 122, 50);
rect(150, 150, 120, 120);

//fifth rectangle
stroke(#9E9E9E);
fill(150, 160, 122, 25);
rect(200, 200, 130, 130);

//stroke and strokeWeight for ellipses
stroke(#800000);
strokeWeight(2);

//first ellipse
fill(255, 69, 0);
ellipse(70, 500, 100, 100);

//second ellipse
fill(255, 99, 71, 50);
ellipse(120, 500, 100, 100);

//third ellipse
fill(245, 222, 179, 50);
ellipse(170, 500, 100, 100);

//fourth ellipse
fill(255, 245, 238, 50);
ellipse(220, 500, 100, 100);

//fifth ellipse
fill(255, 99, 71, 80);
ellipse(270, 500, 100,100);

//sixth ellipse
fill(255, 69, 0, 50);
ellipse(320, 500, 100,100);

//initializing first triangle
strokeWeight(1);
fill(0, 255, 0);
triangle(500, 50, 450, 150, 550, 150);

//second triangle
strokeWeight(2);
fill(0, 255, 0, 50);
triangle(500, 100, 450, 200, 550, 200);

//third triangle
strokeWeight(3);
fill(173, 255, 47, 50);
triangle(500, 150, 450, 250, 550, 250);

//fourth triangle
strokeWeight(4);
fill(173, 255, 47, 50);
triangle(500, 200, 450, 300, 550, 300);

//fifth triangle
strokeWeight(5);
fill(124, 252, 0, 50);
triangle(500, 250, 450, 350, 550, 350);

//sixth triangle
strokeWeight(6);
fill(152, 251, 152, 50);
triangle(500, 300, 450, 400, 550, 400);

//face
strokeWeight(4);
stroke(255,255,255);
fill(255,250,250);
ellipse(530, 500, 100, 100);

//eyes
strokeWeight(12);
stroke(100,149,237);
point(510,480);
point(550,480);

//mouth
strokeWeight(5);
stroke(220,20,60);
arc(530,510,20,20, 0, PI, OPEN);


