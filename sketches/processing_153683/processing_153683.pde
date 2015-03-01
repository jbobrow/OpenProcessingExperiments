
float pos = 0;
int backgroundColor = 0;

void setup() {  
  size(250, 250);
}

void draw() {
    background(backgroundColor);
    pos += 0.03;
    drawing(pos);
}

void drawing(float pos) {
    fill(255,0,0);
    drawRing(125, 125, 126, 10, pos);
    fill(0,255,0);
    drawRing(125, 125, 100, 10, pos/3);
    fill(0,0,255);
    drawRing(125, 125, 74, 10, pos/7);
}

void drawRing(float cx, float cy, float d, float w, float angle) {
    float openingRad = 1.6*w/d;
    float startAngle = angle + openingRad;
    float stopAngle =  angle + 2*PI - openingRad;

    ellipse(cx + d/2*cos(startAngle), cy + d/2*sin(startAngle), w, w);
    ellipse(cx + d/2*cos(stopAngle),  cy + d/2*sin(stopAngle),  w, w);
    arc(cx, cy, d + w, d + w, startAngle, stopAngle,OPEN);
    fill(backgroundColor);
    noStroke();     
    ellipse(cx, cy, d - w, d - w);
    stroke(0); 
    arc(cx, cy, d - w, d - w, startAngle, stopAngle,OPEN);
}
