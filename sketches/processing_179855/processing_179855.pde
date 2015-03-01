
int r, seed;
var isEllipse;

void setup() {
     size(800, 800);
     r = 50;
     isEllipse = false;
     newSeed();
     rectMode(CENTER);
     noFill();
     strokeWeight(200);
     redraw();
}

void mouseMoved() {
    redraw();
}

void mouseClicked() {
    if (mouseButton == LEFT) 
        isEllipse= !isEllipse;
    else if (mouseButton == RIGHT) 
        newSeed();
    redraw();
}

void newSeed() {
     seed = random(2147483647);
}

void redraw() {
    randomSeed(seed);
    int x, y, w;
    int n = 10+(mouseX/width)*(ellipse ? 40 : 90);
    float t;
    float f = (mouseY/height)*5;
    for (int i = 0; i < n; i++) {
        stroke(255, random(255), 127);
        t = (i/n);
        x = (width/2)+cos(t*TWO_PI*f)*r;
        y = (height/2)+sin(t*TWO_PI*f)*r;
        w = t*max(width, height)*2;
        if (isEllipse) 
            ellipse(x, y, w, w);
        else 
            rect(x, y, w, w);
    }
}
