
void setup() {
    size(500, 500);
    rx = 50;
    ry = 250;
    ex = 350;
    ey = 450;
    h = ey - ry;
        d = ex - rx;
    dh = h/10;
    dd = d/10;
    rectMode(CENTER);
    frameRate(2);
}

void draw() {
        rect(rx, ry, 20, 20);
        ellipse(ex, ey,20,20);
    rx = rx + dd;
        ry = ry + dh;
}

