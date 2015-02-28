
void drawChevron(float d, float s, float offset, float angle) {
    pushMatrix();
    rotate(angle);
    translate(offset, 0);
    beginShape();
    vertex(0, 0);
    vertex(-d, -d);
    vertex(-d + s, -d);
    vertex(s, 0);
    vertex(-d + s, +d);
    vertex(-d, +d);
    endShape(CLOSE);
    popMatrix();
}

void setup() {
    size(400, 400);
}

void draw() {
    background(0xff);
    noStroke();
    translate(0.5 * width, 0.5 * height);
    
    fill(0x00);
    for (int i = 0; i < 7; i++) {
        float offset = (frameCount % 80) + 80 * i;
        for (int j = 0; j < 8; j++) {
            drawChevron(60, 40, offset, j * QUARTER_PI);
        }
    }
    
//    fill(0x00);
//    ellipse(0, 0, 160, 160);

    fill(0xff);
    ellipse(0, 0, 160, 160);
    fill(0x00);
    ellipse(0, 0, 120, 120);
    fill(0xff);
    ellipse(0, 0, 80, 80);
    fill(0x00);
    ellipse(0, 0, 40, 40);
}
