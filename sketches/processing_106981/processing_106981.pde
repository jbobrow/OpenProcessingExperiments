
int NRINGS = 12;

float[] ringTheta = new float[NRINGS];

color c2 = #cccccc;
color c1 = #999999;

void ring(float r, int n, float phi) {
    for (int i = 0; i < n; i++) {
        float theta = i * TWO_PI / n + phi;
        point(r * cos(theta), r * sin(theta));
    }
}

void setup() {
    size(400, 400);
}

void draw() {
    translate(0.5 * width, 0.5 * height);
    for (int i = NRINGS; i > 0; i--) {
        float r = 20 * pow(1.2, i);
        ringTheta[i] += (dist(mouseX, mouseY, 0.5 * width, 0.5 * height) - r) * 4e-4;
        stroke(c2);
        noFill();
        strokeWeight(r / 3);
        ring(r, 12, ringTheta[i]);
        fill(c1);
        noStroke()
        ellipse(0, 0, 2 * r, 2 * r);
    }
}
