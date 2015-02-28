
void setup() {
sizex=500;
sizey=500;
size(sizex, sizey);
rx = 50;
ry = 50;
ex = 50;
ey = 450;
rectMode(CENTER);
frameRate(5);
count = 30;
targetVelx = random(-20,20);
targetVely = random(-20,20);
}

void draw() {
background(225);
rect(rx, ry, 20, 20);
ellipse(ex, ey,20,20);
if(count != 0){
h = ey - ry;
d = ex+targetVelx*count - rx;
y = ey+targetVely*count - ry
dh = h/count;
dd = d/count;
count--;
rx += dd;
ry += dh;
ex+=targetVel;
rx %= sizex;
ry %= sizey;
ex %= sizex;
ey %= sizey;
}
}

void mousePressed() {
if (mouseButton == LEFT) {
targetVel -= 10;
} else if (mouseButton == RIGHT) {
targetVel += 10;
}
}
