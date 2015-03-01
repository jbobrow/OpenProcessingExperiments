
int x1, x2, y1, y2, a, b;
float t;

void setup() { 
    size(800, 800);
    background(255);
    frameRate(10000);
    
    t = 0;
    a = 100;
    b = 111;
    x1 = (width/2)+b;
    y1 = height/2;
    
    stroke(0);
    noFill();
    
    ellipse(width/2, height/2, b*2, b*2);
    
    stroke(0);
    noFill(0);
}

void draw() {
    t += 0.1;
    
    x2 = (a+b)*cos(t)-a*cos((1+(b/a))*t)+(width/2);
    y2 = (a+b)*sin(t)-a*sin((1+(b/a))*t)+(height/2);
    
    line(x1, y1, x2, y2);
    
    x1 = x2;
    y1 = y2;
}
