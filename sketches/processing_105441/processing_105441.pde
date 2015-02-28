
color waterColor;

int N = 50;

float fishX[] = new float[N];
float fishY[] = new float[N];
float fishK[] = new float[N];
float fishLength[] = new float[N];
float fishSpeed[] = new float[N];
color fishColor[] = new color[N];
color fishEyeColor[] = new color[N];

void drawFish(int i) {
    pushMatrix();
    translate(fishX[i], fishY[i]);
    scale(fishK[i]);
    noStroke();
    fill(fishColor[i]);
    beginShape();
    vertex(0, 0);
    bezierVertex(69, -120, 338, -17, 346, -17);
    bezierVertex(360, -53, 385, -73, 415, -88);
    bezierVertex(385, -34, 375, 21, 421, 75);
    bezierVertex(386, 71, 363, 50, 344, 24);
    bezierVertex(233, 65, 186, 76, 113, 64);
    bezierVertex(120, 54, 125, 32, 119, -2);
    bezierVertex(120, 25, 115, 51, 102, 65);
    bezierVertex(84, 64, 18, 43, 0, 0);
    endShape(CLOSE);
    fill(fishEyeColor[i]);
    ellipse(66, -6, 17, 17);
    popMatrix();
}

void stepFish(int i) {
    fishX[i] -= fishSpeed[i];
    if (fishX[i] < -fishLength[i])
        resetFish(i, fishK[i]);
}

void resetFish(int i, float k) {
    fishX[i] = width + random(k * 200);
    fishY[i] = random(height);
    fishK[i] = k;
    fishLength[i] = k * 421;
    fishSpeed[i] = k * 10;
    fishColor[i] = lerpColor(waterColor, color(random(360), 70, 100), k);
    fishEyeColor[i] = lerpColor(waterColor, color(0), k);
}

void setup() {
    size(400, 400);
    colorMode(HSB, 360, 100, 100)
    waterColor = color(200, 80, 60);
    for (int i = 0; i < N; i++) {
        resetFish(i, pow(float(i + 1) / N, 5));
        fishX[i] = random(width);
    }
}

void draw() {
    background(waterColor);
    for (int i = 0; i < N; i++) {
        drawFish(i);
        stepFish(i);
    }
}
