
size(300, 300);
background(#1A97D8);
fill(#B1B219);
int x = -2;
println(x);
int y = 1;
println(y);
y = y + 3;
println(y);
x = x * x;
println(x);

float c = 3.2;
float half = 0.5;
c = c * half;
println(c);
c = y * y * half;
println(y);

ellipse((width / 2), (height - 2), x, x);
fill(#AA38E8);
rect((width - 2) - (x + 2), (height - 2) - (x + 2), x, x);
fill(#E35117);
ellipse((width / 2), (height / 2), width / 4, 100);
fill(#777C77);
rect((width / 6), (height / 6), width / 21, 180);
fill(#B0CE38);
arc(65, 45, 50, 50, PI, TWO_PI-PI / 2);
fill(#0E3E89);
rect((width / 6), (height / 3), width / 7.65, 95);
fill(#016A6F);
ellipse((width / 2), (height / 2), width / 4, 47);
fill(#89C618);
ellipse((width / 2), (height / 2), width / 21, 50);


