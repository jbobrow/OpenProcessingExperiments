
int NSTRIPES = 6;

float stripeX[] = new float[NSTRIPES];
float stripeY[] = new float[NSTRIPES];
float stripeLength[] = new float[NSTRIPES];
float stripeBreadth[] = new float[NSTRIPES];
boolean stripeIsVertical[] = new boolean[NSTRIPES];
float stripeSpeed[] = new float[NSTRIPES];
color stripeColor[] = new color[NSTRIPES];

color colors[] = { #33CCCC, #CC33CC, #CCCC33, #333333 };
color randomColor() {
  return colors[int(random(colors.length)) % colors.length];
}

void resetStripe(int i) {
  stripeLength[i] = random(300, 600);
  stripeBreadth[i] = random(30, 60);
  stripeIsVertical[i] = (random(1) < 0.5);
  if (stripeIsVertical[i]) {
    stripeX[i] = random(width - 0.5 * stripeBreadth[i]);
    stripeY[i] = -stripeLength[i] - random(600);
  }
  else {
    stripeX[i] = -stripeLength[i] - random(600);
    stripeY[i] = random(height - 0.5 * stripeBreadth[i]);
  }
  stripeSpeed[i] = random(1, 3);
  stripeColor[i] = randomColor();
}

void drawStripe(int i) {
  stroke(stripeColor[i]);
  strokeWeight(2);
  if (stripeIsVertical[i]) {
    for (float y = stripeY[i]; y < stripeY[i] + stripeLength[i]; y += 6) {
      float x = stripeX[i];
      line(x, y, x + stripeBreadth[i], y + stripeBreadth[i]);
    }
    stripeY[i] += stripeSpeed[i];
    if (stripeY[i] > height)
      resetStripe(i);
  }
  else {
    for (float x = stripeX[i]; x < stripeX[i] + stripeLength[i]; x += 6) {
      float y = stripeY[i];
      line(x, y, x + stripeBreadth[i], y + stripeBreadth[i]);
    }
    stripeX[i] += stripeSpeed[i];
    if (stripeX[i] > width)
      resetStripe(i);
  }
}

void setup() {
  size(400, 400);
  for (int i = 0; i < NSTRIPES; i++)
    resetStripe(i);
}

void draw() {
  background(0xff);
  for (int i = 0; i < NSTRIPES; i++)
    drawStripe(i);
}
