
int x = 150;
int y = 150;
int r = 300;
int n = 5;

void setup() {
    size (300,300);
    colorMode(HSB,360,100,100);
    //noStroke();
    smooth();
    noLoop();
}

void draw() {
    drawCircle(x,y,r,n);
    //drawCircle(x,r,n);
}

void drawCircle(int x, int y, int radius, int num) {
    float tt=260-50*num;
    fill(tt,100,100,50);
    ellipse(x, y, radius*2, radius*2);
    if (num>1) {
        num=num-1;
        drawCircle(x - radius/2,y,radius/2,num);
        drawCircle(x + radius/2,y,radius/2,num);
        drawCircle(x,y - radius/2,radius/2,num);
        drawCircle(x,y + radius/2,radius/2,num);
    }
}
