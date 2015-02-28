
void setup() {
    size(500, 500);
    rx = 450;
    ry = 70;
    ex = 100;
    ey = 400;
    count = 20;
    frameRate(2);

}
void draw() {
        background(225);
        rect(rx%width, ry%height, 20, 20);
        ellipse(ex%width, ey%height, 20, 20);
        if(count != 0){
            h = ey - ry;
            d = ex - rx;
            dh = h/count;
            dd = d/count;
            count--;
            rx += dd;
            ry += dh;
            ex+=20;
        }
}

