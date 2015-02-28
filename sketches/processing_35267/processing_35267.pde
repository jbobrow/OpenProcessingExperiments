
//Homework 2.1

size(300, 300);
smooth();

float birth;
//March 6, 1991
birth = 6;

fill(255, 0, 0);
ellipseMode(RADIUS);
ellipse(width/2, height/2, birth*3, birth*3);

fill(255, 255, 0);
ellipseMode(DIAMETER);
ellipse(width/2+100, height/2, 60, 60);

fill(0, 255, 0);
rectMode(CENTER);
rect(width/birth, height/2, 80, 80);

stroke(255, 125, 0);
strokeWeight(2);
line(width*2/3, height/2 + birth*3, width*2/3, height/2 - birth*3);

fill(0, 0, 255);
strokeWeight(1);
triangle(width/3, height/2 - 2*birth, width/3 + 2*birth, height/2 + 2*birth, width/3 - 2*birth, height/2 + 2*birth);



