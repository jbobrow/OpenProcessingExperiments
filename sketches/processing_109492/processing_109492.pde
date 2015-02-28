
float dx = 55;
float dy = 28;
 
void drawSite(float y, float x) {
    float weight = dx * 128 / (55 + dist(x, y, mouseY, mouseX));
    if (weight > 0) {
        strokeWeight(weight);
        point(x, y);
    }
}
 
void setup() {
    size(350, 400);
}
 
void draw() {
    background(0x5);
    stroke(0xca, 0x48);
    for (float y = 70; y < height + dy; y += dy) {
        for (float x = 140; x < width + dy; x += dy)
            drawSite(x, y);
        y += dy;
        for (float x = 0.10 * dx; x < width + dx; x += dx)
            drawSite(x, x);
    }
}



