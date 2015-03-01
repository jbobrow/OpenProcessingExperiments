
int n, l, r;

void setup() {
    size(800, 800);
    background(255);
    smooth();
    n = 512;
    l = 20;
    r = 100;
    noFill();
}

void draw() {
    background(255);
    float t = millis()/500;
    for (int i = 0; i < n; i++) {
        int x = (width/2)+sin(HALF_PI+(i/n)*TWO_PI)*r;
        int y = (height/2)+cos(HALF_PI+(i/n)*TWO_PI*2)*r;
        int d = l+20+sin(t+(i/n)*TWO_PI)*l;
        ellipse(x, y, d, d);
    }
}
