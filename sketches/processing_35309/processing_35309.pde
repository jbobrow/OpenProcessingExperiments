
size(300,300);

float d = 27;

fill(255,0,0);
ellipseMode(RADIUS);
ellipse(width/2, height/2, d * 3, d * 3);

fill(255,255,0);
ellipseMode(DIAMETER);
ellipse(width/2 + 100, height/2, 60, 60);

fill(0,255,0);
rectMode(CENTER);
rect(width/d, height/2, 80, 80);

fill(255,105,0);
rect(width * 2 / 3, height/2, 2, 6 * d);

fill(0,0,255);
triangle(100, 150 - 2 * d, 100 - 2 * d, 150 + 2 * d, 100 + 2 * d, 150 + 2 * d);

//12/27/1990


