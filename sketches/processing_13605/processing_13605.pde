
Rect[] rects;

void setup() {
    size(240, 200);
    rectMode(CENTER);
    rects = new Rect[10];
    init();
}

void init() {
    for (int i = 0; i < rects.length; i++) {
        rects[i] = new Rect();
    }
}

void draw() {
    background(255);
    translate(width/2, height/2);
    for (int i = 0; i < rects.length; i++) {
        rects[i].model();
        rects[i].view();
    }
}

void mousePressed() {
    init();
}

class Rect {
    
    float a, b, w, s;
    
    Rect() {
        b = -0.05 + random()*0.1;
        w = random()*180;
        s = random()*8;
    }
    
    void model() {
        a += b;
    }
    
    void view() {
        strokeWeight(s);
        stroke(0, 255 - 2*s*s);
        noFill();
        pushMatrix();
            rotate(a);
            rect(0, 0, w, w);
        popMatrix();
    }
    
}
                                
