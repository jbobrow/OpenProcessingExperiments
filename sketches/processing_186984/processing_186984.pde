
float dx = 32;
float dy = 28;

void drawSite(float x, float y) {
    float weight = dx * 128 / (32 + dist(x, y, mouseX, mouseY));
    if (weight > 1) {
        strokeWeight(weight);
        point(x, y);
    }
}

void setup() {
    size(600, 600);
    colorMode(HSB);
strokeWeight(5);
}

void draw() {
    background(0x00);
    stroke(0xff, 0x66);
    for (float y = 0; y < height + dy; y += dy) {
        for (float x = 0; x < width + dx; x += dx)
            drawSite(x, y);
        y += dy;
        for (float x = 0.5 * dx; x < width + dx; x += dx)
            drawSite(x, y);
    }
}
