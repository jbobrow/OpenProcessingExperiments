

size(700, 490);
//background(255);
stroke(100, 100, 100);

// Declare variables here

int rect1 = 150;
int rect2 = 100;
int xPosition = round( random(250, 700) );
PImage img;
PImage img1;


//PIZZA BACKGROUND
img1 =loadImage("wall.jpg");
background(img1);

//PIZZA HUT


//rect(45, 60, 280, 300);
//fill (#121212);

noStroke();
fill (#FF0A27);
triangle(45, 60, 180, 30, 310, 60);

img = loadImage("pizzahut.png");
image (img, 40, 60);


// Draw code below here:
noStroke();
fill(255, 255, 100, 150);
rect(xPosition, 100, 100, rect1);

fill(100, 100, 255, 150);
rect(xPosition, rect1+100, 100, rect2);

//leg left
fill(0);
rect(xPosition+20, rect1+rect2+100, 5, 100);

//leg right
fill(0);
rect(xPosition+70, rect1+rect2+100, 5, 100);

//shoe left
fill (#FA0D28);
rect(xPosition-2, rect1+rect2+200, 27, 15);

//shoe right
fill (#FA0D28);
rect(xPosition+70, rect1+rect2+200, 27, 15);

//cheeks-left
ellipse (xPosition+15, rect1+20, 35, 35);

//cheeks-right
ellipse (xPosition+83, rect1+20, 35, 35);

//eyes-left
fill(0);
ellipse (xPosition+34, rect1+2, 5, 5);

//eyes-right
fill(0);
ellipse (xPosition+65, rect1+2, 5, 5);

//hair1
fill(0);
rect(xPosition+67, rect1-58, 1, 10);

//hair2
fill(0);
rect(xPosition+50, rect1-68, 1, 20);

//smile
arc(xPosition+50, rect1+20, 38, 40, 0, PI);
fill (0);

//arm1
rect(xPosition-2, rect1+20, 2, 40);
fill (0);

//arm2
fill (0);
rect(xPosition+100, rect1+20, 2, 40);
//pushMatrix();
//rotate(PI/3.0); The rotation of the arm is not working?










