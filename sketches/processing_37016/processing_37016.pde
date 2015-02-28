
void setup(){ 
 
  size(800,800); 
 
} 
 
void draw(){ 
 
  background(252, 125, 187);
 
 
smooth();
strokeWeight(2);
fill(37, 171, 193);
rect(20, 20, 760, 760);

fill(103, 222, 242);
rect(200, 200, 400, 400);

fill(201, 10, 147);
triangle(400, 200, 600, 400, 200, 400);
triangle(200, 400, 600, 400, 400, 600);

fill(215, 142, 255);
triangle(200, 600, 200, 400, 400, 400);
//triangle 12

fill(183, 87, 232);
triangle(600,600, 400, 600, 400, 400);
//triangle 11

fill(152, 72, 193);
triangle(600, 200, 600, 400, 400, 400);
//triangle 10

fill(120, 57, 152);
triangle(200, 200, 400, 200, 400, 400);
//triangle 9

fill(250, random(187), 232);
ellipse(400, 400, 40, 40);

fill(129, 27, 124);
triangle(20, 200, 200, 200, 200, 400);
//triangle 8

fill(157, 35, 151);
triangle(20, 600, 200, 600, 200, 400);
//triangle 7

fill(185, 41, 179);
triangle(200, 780, 400, 600, 200, 600);
//triangle 6

fill(211, 47, 203);
triangle(600, 780, 600, 600, 400, 600);
//triangle 5

fill(232, 52, 223);
triangle(780, 600, 600, 600, 600, 400);
//triangle 4

fill(252, 59, 243);
triangle(780, 200, 600, 400, 600, 200);
//triangle 3

fill(255, 124, 249);
triangle(600, 20, 600, 200, 400, 200);
//triangle 2

fill(255, 173, 251);
triangle(200, 20, 400, 200, 200, 200);




}

