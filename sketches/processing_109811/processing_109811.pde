
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
    size(800, 800);
}
 
void draw() {
    background(17,2,237);
    noStroke();
    translate(0.5 * width, 0.5 * height);
     
    fill(255);
    for (int i = 0; i < 10; i++) {
        float offset = (frameCount % 60) + 60 * i;
        for (int j = 0; j < 8; j++) {
            drawChevron(140, 20, offset, j * QUARTER_PI);
        }
    }
     
//    fill(0x00);
//    ellipse(0, 0, 160, 160);
 
    fill(237,2,22);
    ellipse(0, 0, 400, 400);
    fill(0xff);
    ellipse(0, 0, 300, 300);
    fill(17,2,237);
    ellipse(0, 0, 200, 200);
    fill(1237,2,22);
    ellipse(0, 0, 100,100);
}



