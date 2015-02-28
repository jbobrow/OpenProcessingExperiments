
// Shaped random value from 0 to 1
float srand() {
    float x = random(1);
    return 3 * x * x - 2 * x * x * x;
}

color randColor() {
    return color(srand() * 0xff, srand() * 0xff, srand * 0xff);
}

void drawThing(color c1, color c2, color c3, color c4) {
    float s = 8, d = 48, u = 36, v = 64, f = 40, g = 40;
    
    fill(c1);
    beginShape();
    vertex(-(u + s), 0);
    bezierVertex(-(u + s), f + s, 0, g + s, 0, v + 2 * s);
    bezierVertex(0, g + s, (u + s), f + s, (u + s), 0);
    endShape();

    fill(c2);
    beginShape();
    vertex(-u, 0);
    bezierVertex(-u, f, 0, g, 0, v);
    bezierVertex(0, g, u, f, u, 0);
    endShape();
    
    fill(c3);
    ellipse(0, 0, d + s, d + s);

    fill(c4);
    ellipse(0, 0, d - s, d - s);
}

void mouseReleased() {
    redraw();
}

void setup() {
    size(400, 400);
    noStroke();
    noLoop();
}

void draw() {
    color c1 = randColor();
    color c2 = randColor();
    color c3 = randColor();
    color c4 = randColor();
    for (int y = height - 1; y >= -64; y -= 64) {
        for (int x = -44; x < width; x += 88) {
            pushMatrix();
            translate(x, y + 28);
            drawThing(c1, c2, c3, c4);
            popMatrix();
        }
        for (int x = 0; x < width; x += 88) {
            pushMatrix();
            translate(x, y);
            drawThing(c1, c2, c3, c4);
            popMatrix();
        }
    }
}
