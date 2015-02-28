
//Homework 2
//Copyright Yoni Afek , 9/1/11 Carnegie Mellon
background(51);

float x, y; //variable declaration
x = 120; // init
y = 150;

size(400,400);
smooth();

noStroke();
fill(204, 102, 0);
ellipse(x, y+30, x, y+70);

fill(51);
ellipse(x-8, y+22, x-6, y+70);


fill(204, 102, 0);
ellipse(x, y, x, y);

fill(51);
ellipse(x-4, y-8, x-10, y);

fill(204, 102, 0);
ellipse(x+130, y+80, x, y*2);

fill(51);
ellipse(x+134, y+88, x-18, y*2);


fill(204, 102, 0);
ellipse(x+130, y+80, x, y/2);

fill(51);
ellipse(x+134, y+96, x-18, y/2+18);





