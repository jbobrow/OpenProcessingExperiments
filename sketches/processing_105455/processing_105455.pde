
float diaX = 200;
float diaR = 80;
float diaS = 20;

void diamond(float x, float y, float r, float s) {
    quad(x - r, y, x, y - s, x + r, y, x, y + s);
}

void diatri(float x, float y, float r1, float r2, float s) {
    triangle(x, y, x + r1, y - s, x + r2, y + s);
}

float rotFactor(float y, float t) {
    return sin(4 * float(y) / height - t);
}

void setup() {
    size(400, 400);
}

void draw() {
    float t = millis() * 1e-3;
    background(0xcc);
    noStroke();
    for (int y = 0; y < height + diaS; y += 2 * diaS) {
        float p = rotFactor(y, t);
        fill(0xcc + 0x33 * p, 0x99, 0xcc - 0x33 * p);
        diamond(diaX, y, diaR * p, diaS);
        float pp = rotFactor(y + 2 * diaS, t);
        fill(0x00);
        diatri(diaX, y + diaS, +diaR * p, +diaR * pp, diaS);
    }
}
