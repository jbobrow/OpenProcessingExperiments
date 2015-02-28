
// Samantha Ticknor
// sticknor@andrew.cmu.edu
// Copyright Samantha Ticknor January 2013

// init size
size(400, 400);

// Load and display flower image
PImage flowerImg;
flowerImg = loadImage("flowers.jpg");
background(flowerImg);

// Smooth the lines
smooth();

// Create a border
noStroke();
fill(254, 255, 246, 200);
rect(0, 0, 50, 400);
rect(350, 0, 400, 400);
rect(50, 0, 300, 50);
rect(50, 350, 300, 400);

// Create a rectangle over flowerprint
noStroke();
fill(254, 255, 246);
rect(65, 65, 270, 267);

// The font color and font weight
stroke(126, 93, 111);
strokeWeight(2);

// The S
arc(160, 187, 20, 20, HALF_PI+1, PI+HALF_PI+1);
arc(158, 208, 20, 20, -1, HALF_PI+1);
line(152, 193, 162, 198);

// The R
line(197, 176, 197, 216);
arc(207, 187, 20, 20, PI, PI+HALF_PI);

// The T
line(240, 162, 240, 213);
line(232, 178, 248, 178);
arc(245, 214, 8, 7, 1, PI);

// Print Image
//saveFrame("hw1.jpg");

// TA - DA!!


