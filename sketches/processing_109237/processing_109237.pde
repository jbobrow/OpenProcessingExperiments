
size(500, 500);
background(#03E8ff);
fill(#03E8ff);



int bob;
bob = 2;
bob = 4;
bob = bob * bob;
println(bob);

int squareWidth;
squareWidth = 250;
squareWidth = squareWidth + 3;
println(squareWidth);
rect((width / 2) - (squareWidth / 2), (height / 2) - (squareWidth / 2), squareWidth, squareWidth);
fill(0, 255, 0);
squareWidth = 150;
println(squareWidth);
rect((width / 2) - (squareWidth / 2), (height / 2) - (squareWidth / 2), squareWidth, squareWidth);
squareWidth = 100;
println(squareWidth);
rect((width / 2) - (squareWidth / 2), (height / 2) - (squareWidth / 2), squareWidth, squareWidth);
triangle(50, 40, 70, 80, 200, 100);
stroke(0, 255, 0);
line(50, 50, 300, 300);
stroke(#FFD603);
line(40, 50, 300, 300);
stroke(0);
strokeWeight(10);
line(30, 50, 300, 300);
noFill();
arc(50, 55, 70, 70, PI, TWO_PI-PI/2);



