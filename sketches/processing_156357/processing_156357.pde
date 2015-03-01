
int x1, x2, y1, y2, p;
float t, a, b;

void setup() { 
    size(800, 800);
    background(255);
    frameRate(100000);
    
    t = 0;
    a = 70;
    b = 140.11;
    p = 35;
    
    x1 = (width/2)+b+p;
    y1 = height/2;
}

void draw() {
    t += QUARTER_PI;
    
    x2 = (a+b+p)*cos(t)-a*cos((1+(b/a))*t)+(width/2);
    y2 = (a+b+p)*sin(t)-a*sin((1+(b/a))*t)+(height/2);
    
    line(x1, y1, x2, y2);
    
    x1 = x2;
    y1 = y2;
}
