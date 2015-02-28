
int BALLOON_COUNT = 100;

float[] x, y;
float[] spdX, spdY;
float[] wind;
color[] balloonColor;

void setup() {
  size(600, 600);
  background(139, 199, 250);
  noStroke();

  x = new float[BALLOON_COUNT];
  y = new float[BALLOON_COUNT];
  spdX = new float[BALLOON_COUNT];  
  spdY = new float[BALLOON_COUNT];
  wind = new float[BALLOON_COUNT];
  balloonColor = new color[BALLOON_COUNT];

  for (int i = 0; i < BALLOON_COUNT; i++) {
    x[i] = random(width/3, 2*width/3);
    y[i] = height + random(100, 200) * i;
    spdX[i] = random(-0.02, 0.02);
    spdY[i] = random(-0.48, -0.52);
    wind[i] = 0.01;
    balloonColor[i] = color(random(255), random(255), random(255));
  }
}

void draw() {
  background(139, 199, 250);

  drawCloud(100, 100);
  drawCloud(500, 300);
  drawCloud(400, 50);

  for (int i = 0; i < BALLOON_COUNT; i++) {
    fill(balloonColor[i]);
    drawBalloon(x[i], y[i]);


    spdX[i] += wind[i];
    x[i] += spdX[i];
    y[i] += spdY[i];

    if (x[i] <  (width/4)) {
      wind[i] = 0.01;
      spdX[i] /= 1.01;
    }

    if (x[i] > (3 * (width/4))) {
      wind[i] = -0.01;
      spdX[i] /= 1.01;
    }
  }

  drawCloud(75, 430);
  drawCloud(425, 500);
  drawCloud(235, 250);
}

void drawCloud(int x, int y) {
  pushMatrix();
  translate (x, y);
  fill(240, 242, 245);
  ellipse(-15, -25, 50, 50);
  ellipse(0, 0, 135, 65);
  ellipse(20, 20, 50, 50);
  ellipse(-20, 20, 50, 50);
  ellipse(30, -20, 50, 50);
  ellipse(45, 0, 50, 50);
  ellipse(-45, 0, 50, 50);
  popMatrix();
}

void drawBalloon(float x, float y) {
  pushMatrix();
  translate (x, y);

  ellipse(0, 0, 50, 65);

  beginShape();
  vertex(0, 25);
  vertex(-5, 40);
  vertex(5, 40);
  endShape();

  noFill();
  stroke(0);
  strokeWeight(3);
  curve(0, 0, -1, 30, 5, 120, 150, 320);
  noStroke();
  popMatrix();
}


