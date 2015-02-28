
void setup() {
    size(500, 500);
    rx = 50;
    ry = 250;
    ex = 350;
    ey = 450;
    h = ey - ry;
        d = ex - rx;
    dh = h/20;
    dd = d/20;
    rectMode(CENTER);
    frameRate(2);
}

void draw() {
    background(255)
        rect(rx, ry, 20, 20);
        ellipse(ex, ey,20,20);
    rx = rx + dd;
        ry = ry + dh;
}
