
void setup(){
    sizex = 500;
    sizey = 500;
    size(sizex, sizey);
    rx = 50;
    ry = 50;
    ex = 350;
    ey = 450;
    rectMode(CENTER);
    frameRate(2);
    count = 20;
    targetVel = 20;
    h = ey-ry;
    d = ex+targetVel*count-rx;
    dh = h/count;
    dd = d/count;
    }
    void draw(){
        background(225);
        rect(rx,ry,20,20);
        ellipse(ex,ey,20,20);
        if(count!=0){
                count--;
                rx+=dd;
                ry+=dh;
                ex+=targetVel;
                rx%=sizex;
                ry%=sizey;
                ex%=sizex;
                ey%=sizey;
          }
}

