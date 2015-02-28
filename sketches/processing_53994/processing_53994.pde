
PFont font;

float[] xCoords = new float[2000];
float[] yCoords = new float[2000];
float[] yMove = new float[2000];

char[] chars = new char[2000];

void setup() {
  size (1280, 800);
  smooth();
  font = loadFont("SynchroLET-48.vlw");
  textFont(font, 10);
  for (int i = 0; i < 2000; i++) {
    xCoords[i] = random(width);
    yCoords[i] = random(height);
    yMove[i] = random(10);
    char c = 'a';
    c += random(64);
    chars[i] = c;
  }
}

void draw() {
  noStroke();
  fill(0, 20);
  rect(0, 0, width, height);

  //draw matrix
  for (int i = 0; i < 2000; i++) {
    fill(0, 255, 0);
    text(chars[i], xCoords[i], yCoords[i]);

    //move chars
    yCoords[i] += yMove[i];
    if (yCoords[i] > height) yCoords[i] = 0;
    chars[i] += random(64);
    chars[i] %= 64;
  }
}


