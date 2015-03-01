
int n1, n2, l, w;

float t;

void setup() {
    size(800, 800, P3D);
    background(255);
    
    n1 = 4;
    n2 = 4;
    l = 200;
    w = 10;
    
    noStroke();
}

void draw() {
    background(20);
    lights();
    
    t = millis()/2000;
    
    pushMatrix();
    translate(width/2, height/2);
    rotateX(1);
    rotate(t);
    for (int i = 0; i < n1; i++) {
        pushMatrix();
        translate(sin((i/n1)*TWO_PI)*l, cos((i/n1)*TWO_PI)*l);
        rotate(PI+QUARTER_PI-(i/n1)*TWO_PI);
        for (int j = 0; j < n2; j++) {
            fill(128-(j/n2)*128, (j/n2)*255, 255);
            pushMatrix();
            translate((l/2), j*(l/10)+11, 0);
            rotateY(t);
            box(l+1, l/10, w);
            popMatrix();
        }
        popMatrix();
    }
    popMatrix();
}
