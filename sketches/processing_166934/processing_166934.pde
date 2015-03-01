
float[] xCoord = new float[50];
float[] yCoord = new float[50];



void setup() {
  size(600, 400);
  for (int i = 0; i < 50; i++) {
    xCoord[i] = random(width-random(-75,75));
    yCoord[i] = random(height);
  }
}

void draw() {
  frameRate(20);
  fill(0, 5);
  rect(0, 0, width, height);
  for (int i = 0; i < 50; i++) {
    fill(#2CE81C);
    int randNum = int(random(5,1000));
    char randomCharacter = char(randNum);
    text(randomCharacter, xCoord[i], yCoord[i]);
    yCoord[i] += 1.5;
    if (yCoord[i]>height) yCoord[i]=0;
  }
}
