
size(400, 400);

background(200, 255, 117);

int x;

x = 75;

strokeWeight(x/7.5);
stroke(255, 154, 85);

line(0, 0, 400, 400);

ellipseMode(RADIUS);

fill(82, 82, 82);

ellipse(x+125, x+125, x*(1+ 1/3), x*(1 + 1/3));




