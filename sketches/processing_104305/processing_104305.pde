
void setup() {
    size(400, 400);
}

void draw() {
    float x0 = (1.2 * mouseX) % (0.5 * width);
    float x1 = (1.5 * mouseX) % (0.5 * width);
    float x2 = (1.8 * mouseX) % (0.5 * width);
    float y0 = (1.2 * mouseY) % (0.5 * height);
    float y1 = (1.5 * mouseY) % (0.5 * height);
    float y2 = (1.8 * mouseY) % (0.5 * height);

    translate(0.5 * width, 0.5 * height);
    background(0x00, 0x33, 0x66);
    fill(0x33, 0x99, 0x66, 0x99);
    noStroke();
    triangle(+x0, +y0, +x1, +y1, +x2, +y2);
    triangle(+y0, +x0, +y1, +x1, +y2, +x2);
    triangle(-x0, +y0, -x1, +y1, -x2, +y2);
    triangle(-y0, +x0, -y1, +x1, -y2, +x2);
    triangle(+x0, -y0, +x1, -y1, +x2, -y2);
    triangle(+y0, -x0, +y1, -x1, +y2, -x2);
    triangle(-x0, -y0, -x1, -y1, -x2, -y2);
    triangle(-y0, -x0, -y1, -x1, -y2, -x2);
}
