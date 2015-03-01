
int n = 500;

void setup() {
    size(800, 800);
    noFill();
    strokeWeight(2);
    noStroke();
    
}

void draw() {
    background(255);
    float t = millis()/1000;
    
    for (int i = 0; i < n; i++) {
        int rad = 125+sin(t+((i/n)*TWO_PI*4))*75;
        
        int f = (i/n)*TWO_PI;
        int r = sin(f + 0) * 127 + 128;
        int g = sin(f + 2) * 127 + 128;
        int b = sin(f + 4) * 127 + 128;
        
        fill(r, g, b);
        
        int d = sin((i/n)*TWO_PI*8)*10+20;
        
        if (d > 0) ellipse((width/2)+rad*sin(t+TWO_PI*(i/n)), (height/2)+rad*cos(t+TWO_PI*(i/n)), d, d);
    }
}    
