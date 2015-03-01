

void setup() {
    size(800, 800);
    background(255);
    noStroke();
    fill(0);
}

void draw() {
    background(255);
    float t = millis()/32000;
    int n = 3;
    
    for (int j = 1; j < 49; j++) {
        for (int i = 0; i < n; i++) {
            int f = (i/n)*TWO_PI;
            int r = sin(f + 0) * 127 + 128;
            int g = sin(f + 2) * 127 + 128;
            int b = sin(f + 4) * 127 + 128;
         
            fill(r, g, b);

            ellipse((width/2)+j*15*sin((i/n)*TWO_PI+t*(j)), (height/2)+j*15*cos((i/n)*TWO_PI+t*(j)), 10, 10);
        }
        n+=3;
    }
}
