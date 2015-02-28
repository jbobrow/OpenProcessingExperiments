
//sikakuga en wo oikakeru en ha touhi
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
    count=10;
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
        rx%=width;
        ry%=height;
        ex%=width;
        ey%=height;
        
    }
}
