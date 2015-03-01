
float[] xCoord = new float[100];
float[] yCoord = new float[100];
float[] speed = new float[100];

void setup() {
  size(800, 800);
  background(0);
  for (int i = 0; i < 100; i++) {
    xCoord[i] = i* width/50;
    yCoord[i] = random(height);
    speed[i] = random(1, 6);
  }
}
void draw() {
  fill(0, 10);
  rect (0, 0, width, height);
  for (int i = 0; i < 100; i++) {
    fill(15, 240, 24);
    int randNum = int (random(60, 120));
    char randomletter = char(randNum);
    text(randomletter, xCoord[i], yCoord[i]);

    for (yCoord[i] += speed[i]; yCoord[i] > height; yCoord[i] = 0);
  }
}

