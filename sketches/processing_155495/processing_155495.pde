
color c = 20;
int rT = 2000;

void setup() {
    size(800, 800);
    background(c);
    noStroke();
    smooth();
}

void draw() {
    background(c);
    var t = millis()/rT;

    for (int i = 0; i < 20; i++) {
        var t = millis()/rT;
        drawArc(590-30*i, (cos(t+(i/(TWO_PI*2))))*TWO_PI);
    }
}

void drawArc(int radius, float start) {
    float pos1, pos2;

    int f = (abs(radius/550))*PI;

    int r = sin(f + 0) * 127 + 128;
    int g = sin(f + 1) * 127 + 128;
    fill(r, g, 0);
    
    if (start > 0) {
        if (start > TWO_PI) {
            pos1 = start-TWO_PI;
            pos2 = TWO_PI;
        
        } else {
            pos1 = 0;
            pos2 = start;
        }
    } else {
        pos1 = start;
        pos2 = 0;
    }
    
    arc(width/2, height/2, radius, radius, pos1+PI, pos2+PI);
    
    fill(c);
    ellipse(width/2, height/2, radius-10, radius-10);
}
