
/*
Chad Cruz
2/3/13
P.2
Creating a cartoon.
*/
void setup(){
background(0);
size(300,300);
//size and color of background
}
void draw(){
noStroke();
fill(233,255,5);
ellipse(75,150,125,125);
//shape and color of pacman

fill(0);
triangle(150,100,150,200,75,150);
//mouth of pacman

fill(255);
ellipse(150,150,35,35);
//first point orb

fill(255);
ellipse(220,150,35,35);
//second point orb

fill(255);
ellipse(290,150,35,35);
//third point orb

fill(0);
ellipse(90,115,20,20);
//eye of pacman

fill(5,30,250);
rect(0,40,300,10);
//route or border for pacman 1

fill(5,30,250);
rect(0,250,300,10);
//route or border for pacman 2
}
