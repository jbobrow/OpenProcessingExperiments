
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
    ex+=targetVelX;
    ey+=targetVelY;
    rx %= sizex;
        if(rx<0)
            rx = 500 + rx;
    ry %= sizey;
        if(ry<0)
            ry = 500 + ry;
    ex %= sizex;
        if(ex<0)
            ex = 500 + ex;
    ey %= sizey;
        if(ey<0)
            ey = 500 + ey;
    }
}

void mousePressed() {
    if (mouseButton == LEFT) {
        targetVelX += random(-20,20);
    } else if (mouseButton == RIGHT) {
        targetVelY += random(-20,20);
    }
}
