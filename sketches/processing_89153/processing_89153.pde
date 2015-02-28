
size(600, 200);
smooth();
noStroke();
background(163);
rectMode(CENTER);
colorMode(HSB, 360, 100, 100);

int n = 4;
float x = width/(n+1);

fill(360 * 1/6, 100, 100);
rect(x*1, height/2, 100, 100);

fill(360 * 2/6, 100, 100);
rect(x*2, height/2, 100, 100);

fill(360 * 3/6, 100, 100);
rect(x*3, height/2, 100, 100);

fill(360 * 4/6, 100, 100);
rect(x*4, height/2, 100, 100);
