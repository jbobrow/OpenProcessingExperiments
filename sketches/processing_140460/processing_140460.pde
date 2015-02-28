
/*
 Konkuk University
 SOS iDesign

Name:  LEE Hea Rin
 ID: LEE Hea Rin

*/

PImage img;

void setup(){
background(247,238,182); 
size (600, 600);
 // noLoop();
smooth();
colorMode (RGB, 600);
 img = loadImage ("abcd.jpg"); // put the image in the same folder as the processing file
 }

void draw(){
colorMode(RGB,mouseX/(width/225),mouseY/(height/255),255); 
println(mouseX + " : " + mouseY);

// here you add your code with all shapes and colors. 



stroke(0);
strokeWeight(4);
point(460,11);
line(460,11,463,301);
line(514,12,520,300);
line(565,12,576,295);
line(375,90,593,96);
line(373,145,597,151);
line(373,207,597,212);
line(2,580,310,583);
line(1,479,107,596);
line(1,498,30,595);
line(8,38,56,1);
line(86,161,176,93);
line(63,128,139,75);
line(47,98,122,41);
line(26,66,106,15);
line(7,38,357,597);
line(161,110,100,0);
line(140,122,66,1);


stroke(0);
strokeWeight(3);
line(1,479,109,594);

fill(mouseX,575,138,138);
stroke(0);
strokeWeight(1);
rect(518,94,48,55);
fill(600);
rect(463,152,51,55);

stroke(0);
fill(mouseX,575,138,138);
triangle(143,121,161,108,380,488);
triangle(113,141,133,126,401,594);
triangle(177,0,146,0,426,470);

fill(0);
triangle(329,1,399,1,353,37);
triangle(0,251,0,355,72,358);
triangle(0,120,0,131,55,159);

stroke(0);
strokeWeight(5);
line(74,259,525,405);

fill(mouseY,402,128,128);
quad(9,41,27,68,57,48,38,17);
fill(368,465,376);
quad(57,48,76,81,100,63,83,34);
quad(66,1,83,34,105,13,101,0);
fill(0);
quad(76,81,47,103,67,133,94,113);
quad(94,113,115,145,134,127,118,97);


stroke(388,384,302);
noFill();
bezier(7,481,84,488,99,529,115,578);

stroke(575,542,138);
bezier(1,179,42,195,46,234,24,272);
stroke(575,138,138);
bezier(1,145,85,192,78,243,42,297);


noStroke();
fill(135,240,375);
ellipse(180,161,140,150);

stroke(0);
strokeWeight(13);
line(1,354,424,2);

strokeWeight(13);
stroke(575,138,138);
line(1,354,128,247);

noStroke();
fill(575,542,138);
quad(11,371,10,392,88,486,107,467);



}

