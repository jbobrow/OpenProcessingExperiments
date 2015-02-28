
void setup() {
    size(500, 500);
    rx = 450;
    ry = 70;
    ex = 100;
    ey = 400;
    h = ey - ry;
        d = ex - rx;
    dh = h/10;
    dd = d/10;
    rectMode(CENTER);
    frameRate(20);
}

void draw() {
        background(225);
    rect(rx, ry, 20, 20);
        ellipse(ex, ey,20,20);
    if(rx != ex)
        rx = rx + dd;
        if(ry != ey)
        ry = ry + dh;
}

