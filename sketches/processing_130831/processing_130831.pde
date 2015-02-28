
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
    targetVel = 20;
}

void draw() {
    background(204);
    rect(rx, ry, 20, 20);
    ellipse(ex, ey,20,20);
        if(count != 0){
            h = ey - ry;
            d = ex+targetVel*count - rx;
            //d2 = ex+targetVelY*count - ry;
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
            //xrm = random(-20,20);
            //yrm = random(-20,20);
        }
}

void mousePressed() {
    if (mouseButton == LEFT) {
        targetVel -= random(-20,20);
    } else if (mouseButton == RIGHT) {
        targetVel += random(-20,20);
    }
}
