
int NVERTS = 6;

float vertX1[] = new float[NVERTS];
float vertY1[] = new float[NVERTS];
float vertX2[] = new float[NVERTS];
float vertY2[] = new float[NVERTS];

float vertX[] = new float[NVERTS];
float vertY[] = new float[NVERTS];

PGraphics multigonImg, backdropImg; 

void resetMultigon() {
  for (int i = 0; i < NVERTS; i++) {
    vertX1[i] = random(width);
    vertY1[i] = random(width);
    vertX2[i] = random(width);
    vertY2[i] = random(width);
  }
}

void drawMultigon(PGraphics pg) {
  float t = 0.5 * millis() * 1e-3;
  for (int i = 0; i < NVERTS; i++) {
    vertX[i] = map(cos(t), -1, +1, vertX1[i], vertX2[i]);
    vertY[i] = map(sin(t), -1, +1, vertY1[i], vertY2[i]);
  }
  pg.beginDraw();
  pg.strokeWeight(5);
  pg.background(0xff);
  for (int i = 0; i < NVERTS - 1; i++) {
    for (int j = i + 1; j < NVERTS; j++) {
      pg.line(vertX[i], vertY[i], vertX[j], vertY[j]);
    }
  }
  pg.endDraw();
}

void drawBackdrop(PGraphics pg) {
  pg.beginDraw();
  pg.colorMode(HSB, 1, 1, 1);
  pg.background(random(1), 1, 1);
  for (int i = 0; i < 400; i++) {
    pg.strokeWeight(random(400 - i));
    pg.stroke(random(1), 1, 1);
    pg.point(random(pg.width), random(pg.height));
  }
  pg.endDraw();
}

void mouseClicked() {
  resetMultigon();
  drawBackdrop(backdropImg);
}

void setup() {
  size(400, 400);
  multigonImg = createGraphics(width, height);
  backdropImg = createGraphics(width, height);
  resetMultigon();
  drawBackdrop(backdropImg);
}

void draw() {
  drawMultigon(multigonImg);
  image(backdropImg, 0, 0);
  blend(multigonImg, 0, 0, width, height, 0, 0, width, height, LIGHTEST);
}
