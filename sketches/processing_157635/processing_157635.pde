
int n, r;
float t;
void setup() {
    size(250, 250);
    smooth();
    noStroke();
    
    n = 20;
    r = 40;
}

void draw() {
    background(#381203);
    t = -(millis()/500);
    
    for (int i = 0; i < n; i++) {
        fill(255, 255-(i/n)*128, 0);
        
        int x = (width/2)+sin((sin(t+((i/n)*PI))/2)+t)*r;
        int y = (height/2)+cos((sin(t+((i/n)*PI))/2)+t)*r;
        int d = (sin((i/n)*PI))*4;
        ellipse(x, y, d, d);
    }
}
