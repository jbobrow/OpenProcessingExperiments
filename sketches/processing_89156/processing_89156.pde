
//This palette is called "Full of Life" by casobb

color[] full = {#027373, #038C7F, #D9B343, #F28C3A, #BF3F34};
color[] palette = full;

int s = 80;
int d = 10;

size(600, 200);
smooth();
noStroke();
background(163);

fill(palette[0]);
rect(0, 0, s, s);

translate(50, 100);
fill(palette[1]);
rect(0, 0, s, s);

translate(125, -65);
scale(2);
fill(palette[2]);
rect(0, 0, s, s);

translate(200, 25);
scale(2);
rotate(radians(90));
fill(palette[3]);
