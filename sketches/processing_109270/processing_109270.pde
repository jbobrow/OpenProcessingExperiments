
size(300, 300);
background(#03E8FF);
//fill(#03E8FF);
//rect(100, 100, 100, 100);
//float squareWidth = 200;
//float squareWidth = 250;

int lev = -2;
int bro = 1;
println(lev);
println(bro);
bro = bro + 3;
println(bro);
float front;
float back;
front = lev + 3;
println(front);
back = bro - 2;
println(back);


int squareWidth = 250;
rect((width / 2) - (squareWidth / 2), (height / 2) - (squareWidth / 2), squareWidth, squareWidth);
fill(0, 255, 0);
squareWidth = 150;
ellipse((width / 2), (height / 2), squareWidth, squareWidth);
fill(0, 0, 255);
squareWidth = 100;
rect((width / 2) - (squareWidth / 2), (height / 2) - (squareWidth / 2), squareWidth, squareWidth);
fill(255, 0, 0);
int other = 50;
ellipse((width / 2), (height / 2), other, other);
fill(150, 20, 10);
int way = 25;
rect((width / 2) - (way / 2), (height / 2) - (way/ 2), way, way);
fill(20, 30, 40);
triangle(width / 6 , (175/ 300) * height, width / 2, width / 6, (250 / 300) * width, (175 / 300) * height);
arc((width / 2), (height / 2), way, way, PI, TWO_PI-PI/2); 
/*triangle(50, 40, 70, 80, 200, 100);
line(50, 50, 300, 300);
stroke(0, 242, 0);
line(40, 50, 300, 300);
stroke(0);
strokeWeight(10);
line(30, 50, 300, 300);
noFill();
arc(50, 55, 70, 70, PI, TWO_PI-PI/2);*/


