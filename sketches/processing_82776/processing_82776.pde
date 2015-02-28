
size (200, 200);
background(0);
noFill();

float a = random (10);
float b = random (10, 100);
float c = random (100, 255);

strokeWeight (b);
stroke (c, b);

ellipse (a, 100, c, c);
ellipse (100, a, b, b);
rect (b, a, c, c);
