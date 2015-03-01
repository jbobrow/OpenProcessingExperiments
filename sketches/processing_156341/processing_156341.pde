
int a, b;
float at, bt, t, xMid, yMid;
int x1, x2, x3, x4, y1, y2, y3, y4;

var secondLine = false;

void setup() {
    size(800, 800);
    fill(0);
    smooth();
    
    at = 1.7;
    bt = 1.75;
    
    a = width/2-10;
    b = height/2-10;
    
    reset();
}

void reset() {
    background(255);

    x1 = width/2;
    y1 = height/2;
    
    x3 = x1;
    y3 = y1;
    
    t = 0;
}

void mouseClicked() {
    secondLine = !secondLine;
    reset();
}

void draw() {
    t += 0.05;
    
    x2 = a*sin(at*t + PI) + width/2;
    y2 = b*sin(bt*t) + height/2;
    
    xMid = (x1+x2)/2;
    yMid = (y1+y2)/2;
    
    stroke((xMid/width)*255, (yMid/height)*255, 127);
    strokeWeight(2+(dist(xMid, yMid, width/2, height/2)/100));

    line(x1, y1, x2, y2);
    
    x1 = x2;
    y1 = y2;
    
    if (secondLine) {
        x4 = a*sin(at*-t - PI) + width/2;
        y4 = b*sin(bt*-t) + height/2;
        
        line(x3, y3, x4, y4);
        
        x3 = x4;
        y3 = y4;
    } 
}
