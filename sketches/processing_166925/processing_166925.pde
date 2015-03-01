
float[] xCoord = new float[50];
float[] yCoord = new float[50];
float[] gottagofast = new float[100];
void setup() {
  size(600, 500);
  for (int i = 0; i < 50; i++) {
    xCoord[i] = random(width);
    yCoord[i] = random(height);
    gottagofast[i] = random(1, 2);
  }
}

void draw() {
  fill(0, 10);
  rect(0, 0, width, height);
  stroke(255);
  for (int i = 0; i < 50; i++) {
    fill(0, 200, 0);
    int randNum = int(random(32, 200));
    char randomChar = char(randNum);
    textSize(15);
    text(randomChar, xCoord[i], yCoord[i]);
    yCoord[i]+=1;
    yCoord[i] += gottagofast[i];
    if (yCoord[i]>height) {
      yCoord[i] =0;
    }
  }
}

