
 void setup() {
    sizex=500;
    sizey=500;
    size(sizex, sizey);
    rx = 450;
    ry = 70;
    ex = 100;
    ey = 400;
    rectMode(CENTER);
    frameRate(2);
    count = 20;
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
            ex+=20;
            rx %= sizex;
            ry %= sizey;
            ex %= sizex;
            ey %= sizey;
    }
}


