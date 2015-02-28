
size(300, 300);
background(#006699);

int x;
int y;
x = -2;
y = 1;

println(x);
println(y);

x = x+3;
println(x);

y = y*y;
println(y);

float f = 1.5;
float k = -.5;

float j = f +k;
println(j);

f = f + 3;
println(f);
f = f -2;
println(f);
f = f +k;
println(f);

x = x + int(k);
println(x);

x = x*y + int(f)*int(k);
println(x);

int squareWidth;
squareWidth = 250;
fill(245,15,136);
rect((width / 2) - (squareWidth / 2), (height / 2) - (squareWidth / 2), squareWidth, squareWidth);
squareWidth = 50;
fill(55,15,145);
rect((width / 2) - (squareWidth / 2), (height / 2) - (squareWidth / 2), squareWidth, squareWidth);
fill(24,234,147);
squareWidth = 150;
ellipse((width / 2) - (squareWidth / 2), (width / 2) - (squareWidth / 2), squareWidth, squareWidth);
squareWidth=125;
fill(204,124,147);
ellipse((width / 2) - (squareWidth / 2), (width / 2) - (squareWidth / 2), squareWidth, squareWidth);
squareWidth=100;
fill(255,34,147);
ellipse((width / 2) - (squareWidth / 2), (width / 2) - (squareWidth / 2), squareWidth, squareWidth);


