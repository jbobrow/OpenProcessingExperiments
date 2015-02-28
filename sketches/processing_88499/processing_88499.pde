
size(600, 200);
smooth();
noSmooth();
background(30);

int n = 4;
float x = width/(n+1);

colorMode(RGB);
fill(150);
rect(x*1, height/3, 75, 75);

colorMode(HSB, 360, 100, 100);
fill(198, 100, 99);
rect(x*2, height/3, 80, 80);

colorMode(HSB, 300, 255, 255);
fill(90, 17, 200);
rect(x*3, height/3, 90, 90);
