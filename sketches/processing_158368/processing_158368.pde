
int n;
float t;

void setup() {
    size(800, 800);
    smooth();
    noFill();
    
    n = 128;
}

void draw() {
    background(#150219);
    
    t = millis()/1000;
    
    for (int i = 0; i < n; i++) {
        stroke(128+cos(i/n*TWO_PI)*127, 128+sin(i/n*TWO_PI)*127, 255);
        y1 = (height/2)+cos(t+(i/n*TWO_PI))*200;
        x2 = (width/2)+sin(sin(t)+t+(i/n*TWO_PI))*200;
        line((width/2), y1, x2, (height/2));
    }
}
