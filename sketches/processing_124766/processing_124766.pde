
void setup() {
    size(500, 500);
    rx = 50;
    ry = 250;
    ex = 350;
    ey = 450;
    rectMode(CENTER);
    frameRate(5);
    count = 10;
}
void draw() {
        background(225);
    rect(rx, ry, 20, 20);
        ellipse(ex, ey,20,20);
    if(count != 0){
        h = ey - ry;
            d = ex - rx;
        dh = h/count;
        dd = d/count;
        count--;
        rx += dd;
        ry += dh;
        ex+=3;
    }
}

