
int N = 4;

float roboX[] = new float[N];

float noseWidth[] = new float[N];
float noseExt[] = new float[N];
float eyeR[] = new float[N];
float eyeSpacing1[] = new float[N];
float eyeSpacing2[] = new float[N];
float earWidth[] = new float[N];
float mouthHeight[] = new float[N];
float mouthExt[] = new float[N];
float mouthSpacing[] = new float[N];
float neckWidth[] = new float[N];
float neckHeight[] = new float[N];
float foreheadHeight[] = new float[N];
float foreheadR[] = new float[N];
float lipSpacing[] = new float[N];
float chinSpacing[] = new float[N];
float chinR[] = new float[N];

void drawNeck(float u3, float v3, float v5) {
  fill(0xcc, 0xcc, 0xdd);
  noStroke();
  rect(-u3, 0, 2 * u3, v3 + v5);
}

void drawEars(float u1, float v2, float v4, float r3) {
  fill(0xaa, 0xaa, 0xbb);
  noStroke();
  rect(-(u1 + r3), -v2, 2 * (u1 + r3), v2 + v4, r3);
}

void drawChin(float u1, float v2, float v3, float r2) {
  fill(0xdd, 0xdd, 0xee);
  noStroke();
  rect(-u1, -(v2 + 1), 2 * u1, v2 + v3, 0, 0, r2, r2);
}

void drawEyes(float u4, float r4) {
  fill(0x33, 0x33, 0x44);
  stroke(0x88, 0x88, 0x99);
  strokeWeight(4);
  ellipse(-u4, 0, 2 * r4, 2 * r4);
  ellipse(+u4, 0, 2 * r4, 2 * r4);
  fill(0xff);
  noStroke();
  ellipse(-u4 - 0.2 * r4, -0.2 * r4, 0.5 * r4, 0.5 * r4);
  ellipse(+u4 - 0.2 * r4, -0.2 * r4, 0.5 * r4, 0.5 * r4);
}

void drawForehead(float u1, float v1, float v2, float r1) {
  fill(0xcc, 0xcc, 0xdd);
  noStroke();
  rect(-u1, -(v1 + v2), 2 * u1, v1, r1, r1, 0, 0);
}

void drawMouth(float u6, float v4, float r5) {
  fill(0xee, 0xee, 0xff);
  stroke(0x99, 0x99, 0xaa);
  strokeWeight(3);
  strokeCap(SQUARE);
  rect(-u6, v4, 2 * u6, 2 * r5, r5);
  for (int x = 0; x <= u6 - r5; x += r5) {
    line(-x, v4, -x, v4 + 2 * r5);
    line(+x, v4, +x, v4 + 2 * r5);
  }
}

void drawNose(float u5, float v2, float v6) {
  fill(0xcc, 0xcc, 0xdd);
  noStroke();
  rect(-u5, -v2, 2 * u5, v2 + v6);
}

void drawRobo(int i) {
  float u3 = 0.5 * neckWidth[i];
  float u5 = 0.5 * noseWidth[i];
  float u4 = u5 + eyeSpacing1[i] + eyeR[i];
  float u6 = 0.5 * mouthExt[i] + mouthHeight[i];
  float u1a = u5 + eyeSpacing1[i] + eyeSpacing2[i] + 2 * eyeR[i];
  float u1b = u6 + mouthSpacing[i];
  float u1 = max(u1a, u1b);
  float v1 = foreheadHeight[i];
  float v2 = eyeSpacing1[i] + eyeR[i];
  float v5 = neckHeight[i];
  float v6 = eyeR[i] + noseExt[i];
  float v4 = v6 + lipSpacing[i];
  float v3 = v4 + mouthHeight[i] + chinSpacing[i];
  float r1 = foreheadR[i];
  float r2 = chinR[i];
  float r3 = earWidth[i];
  float r4 = eyeR[i];
  float r5 = 0.5 * mouthHeight[i];

  drawNeck(u3, v3, v5);
  drawEars(u1, v2, v4, r3);
  drawChin(u1, v2, v3, r2);
  drawEyes(u4, r4);
  drawForehead(u1, v1, v2, r1);
  drawMouth(u6, v4, r5);
  drawNose(u5, v2, v6);
}

void randRobo(int i) {
  noseWidth[i] = random(8, 24);
  noseExt[i] = random(6, 22);
  eyeR[i] = random(6, 18);
  eyeSpacing1[i] = random(4, 14);
  eyeSpacing2[i] = random(8, 18);
  earWidth[i] = random(10, 22);
  mouthHeight[i] = random(12, 18);
  mouthExt[i] = random(0, 52);
  mouthSpacing[i] = random(12, 36);
  neckWidth[i] = random(36, 68);
  neckHeight[i] = random(8, 18);
  foreheadHeight[i] = random(36, 72);
  foreheadR[i] = random(12, 52);
  lipSpacing[i] = random(6, 14);
  chinSpacing[i] = random(12, 22);
  chinR[i] = random(18, 52);
}

void setup() {
  size(400, 400);
  for (int i = 0; i < N; i++) {
    float dx = float(width) / (N - 2);
    roboX[i] = (i - 1) * dx;
    randRobo(i);
  }
}

void draw() {
  float t = millis() * 1e-3;
  
  background(0xff, 0xdd, 0xdd);

  for (float y = 0; y < height + 40; y += 40) {
    for (float x = 0; x < width + 40; x += 40) {
      fill(0xff, 0xee, 0xee);
      noStroke();
      beginShape();
      for (int i = 0; i < 6; i++) {
        float mag = 16, arg = i * TWO_PI / 6 - 2 * t;
        vertex(x + mag * cos(arg), y + mag * sin(arg));
      }
      endShape(CLOSE);
      fill(0xff, 0xdd, 0xdd);
      ellipse(x, y, 12, 12);
    }
  }

  for (int i = 0; i < N; i++) {

    pushMatrix();
    translate(roboX[i], 0.5 * height);
    drawRobo(i);
    popMatrix();

    roboX[i] -= 1;
    float dx = float(width) / (N - 2);
    if (roboX[i] < -dx) {
      roboX[i] += width + 2 * dx;
      randRobo(i);
    }
  }
}
