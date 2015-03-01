
int n, d, s, a, f;

void setup() {
    size(400, 400);
    smooth();
    frameRate(60);
    
    n = 15;
    d = 3;
    s = 15;
    a = 30;
    f = 200;
    noStroke();
    fill(255);
}

void draw() {  //draw function loops 
    background(#2D0A40);
    float t = millis()/f;
    
    for (int i = 0; i < n; i++) {
        int x = (width/2)+i*s-(((n-1)/2)*s);
        int y = height/2+sin(t+i*(t/10))*a;
        
        ellipse(x, y, d, d);
    
    }
}
