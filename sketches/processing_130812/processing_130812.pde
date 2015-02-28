
void setup() {
sizex=500;
sizey=500;
size(sizex, sizey);
rx = 50;
ry = 50;
ex = 50;
ey = 450;
rectMode(CENTER);
frameRate(2);
count = 20;
targetVelX = 20;
targetVelY = 20;
}

void draw() {
background(225);
rect(rx, ry, 20, 20);
ellipse(ex, ey,20,20);
if(count != 0){
h = ey+targetVelY*count - ry;
d = ex+targetVelX*count - rx;
dh = h/count;
dd = d/count;
count--;
rx += dd;
ry += dh;
ey+=targetVelY;
ex+=targetVelX;
rx %= sizex;
ry %= sizey;
ex %= sizex;
ey %= sizey;
}
}

void mousePressed() {
if (mouseButton == LEFT) {
targetVelX += random(-20,20);
} else if (mouseButton == RIGHT) {
targetVelY += random(-20,20);
}
}
