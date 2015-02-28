
float R = 140;
float N = 9;
float OMEGA = 0.2;

int NSTARS = 400;
float starX[] = new float[NSTARS];
float starY[] = new float[NSTARS];

void drawGlobe(float r, int n, float phi) {
    for (int i = 0; i < n; i++) {
        float theta = i * PI / n + (phi % (PI / n));
        float s = r * cos(theta);
        if (s > 0) {
            arc(0, 0, +2 * s, 2 * r, -HALF_PI, +HALF_PI);
        }
        else {
            arc(0, 0, -2 * s, 2 * r, +HALF_PI, TWO_PI - HALF_PI);
        }
    }
}

void drawPulsar(float t) {
    float r = map(sin(t * 3) + sin(t * 4) + sin(t * 5), -3, +3, 0.8 * R, R);
    strokeWeight(r);
    point(0, 0);
}

void setup() {
    size(400, 400);
    for (int i = 0; i < 400; i++) {
        starX[i] = random(width);
        starY[i] = random(height);
    }
}

void draw() {
    float t = millis() * 1e-3;
    background(0x00);
    noFill();
    
    strokeWeight(1);
    for (int i = 0; i < NSTARS; i++) {
        stroke(random(0xff));
        point(starX[i], starY[i]);
    }
    
    translate(0.5 * width, 0.5 * height);
    strokeWeight(3);
    stroke(0x99);
    drawGlobe(R, N, ((-OMEGA * t) % TWO_PI) + TWO_PI);
    stroke(0xff);
    drawPulsar(t);
    strokeWeight(3);
    stroke(0x66);
    drawGlobe(R, N, +OMEGA * t);
}
