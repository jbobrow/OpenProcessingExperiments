
background(193,236,210);
smooth();
int x = 50; //40
int y = 50; //45
int armDown = 65;
//int mouthX = 40;
int mouthY = 45;
//int mouthSizeX = 20;
int mouthSizeY = 25;
int teethTopY = 45;
int teethBottomY = 70;

//face
fill(111,89,57);
stroke(66,46,18);
rect(x-25, y-30, 50, 60);

//eyes
fill(0);
ellipse(x-12, y-15, 8, 8);
ellipse(x+12, y-15, 8, 8);

fill(255);
ellipse(x-11, y-16, 3.5, 3.5);
ellipse(x+11, y-16, 3.5, 3.5);

//mouth
fill(174,48,48);
rect(x-10, mouthY, x-30, mouthSizeY);

//teeth
  //top
fill(255);
triangle(x-9, teethTopY, x-3, teethTopY, x-7, teethTopY+5);
triangle(x-3, teethTopY, x+3, teethTopY, x-1, teethTopY+5);
triangle(x+3, teethTopY, x+10, teethTopY, x+6, teethTopY+5);
  //bottom
triangle(x-9, teethBottomY, x-3, teethBottomY, x-7, teethBottomY-5);
triangle(x-3, teethBottomY, x+3, teethBottomY, x-1, teethBottomY-5);
triangle(x+3, teethBottomY, x+10, teethBottomY, x+6, teethBottomY-5);

//legs
fill(111,89,57);
stroke(66,46,18);
rect(x-20, y+30, 15, 18);
rect(x+5, y+30, 15, 18);

//arms
fill(111,89,57);
stroke(66,46,18);
triangle(x-25, y+5, x-25, y+15, x-40, armDown);
triangle(x+25, y+4, x+25, y+15, x+40, armDown);


