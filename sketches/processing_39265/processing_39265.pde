
size(400,600);
smooth();

int R = 198;
int G = 198;
int B = 198;

// Background

// Blue

noStroke();
fill(0,98,252);
rect(160,0,240,300);

// White

noStroke();
fill(255);
rect(0,0,160,300);
rect(160,300,200,200);

// Orange

noStroke();
fill(252,165,0);
rect(0,300,60,200);

// Black

noStroke();
fill(0);
rect(60,300,100,200);

// Yellow

noStroke();
fill(219,202,7);
rect(280,500,80,100);

// Light Grey

noStroke();
fill(R,G,B);
rect(0,500,280,100);
rect(360,300,40,300);

// Lines

stroke(0);
strokeWeight(10);
line(160,0,160,500);
line(10,80,160,80);
line(0,300,400,300);
line(160,200,400,200);
line(280,200,280,580);
line(60,300,60,500);
line(40,500,360,500);
line(360,300,360,560);

