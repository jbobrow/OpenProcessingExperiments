
size(400,200);
smooth();

float r = 200;
float g = 150;
float b = 100;

float x = width * 0.5;
float y = height * 0.5;

noStroke();
rectMode(CENTER);
fill(r,g,b);
rect(x, y, width * 0.75 , height * 0.75 );
fill(r*0.75,g*0.75,b*0.75);
rect(x ,y, width * 0.5, height * 0.5);
fill(r* 0.5,g* 0.5,b* 0.5);
rect(x, y, width * 0.25, height * 0.25);

