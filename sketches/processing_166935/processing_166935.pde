
float[] xCoord = new float[50];
float[] yCoord = new float[50];
float[] rate=new float[100];

void setup() {
  size(600, 500);
  background(0);
  for (int i = 0; i < 50; i++) {
    xCoord[i] = random(width);
    yCoord[i] = random(height);
    rate[i]=random(1, 3);
  }
}

void draw() {
  fill(0,10);
  rect(0,0,width,height);
  for (int i = 0; i < 50; i++) {
    fill(0,190,0);
    int randNum = int(random(1300,1400));
    char randChar = char(randNum);
    text(randChar, xCoord[i], yCoord[i]);
    yCoord[i] += 1.5;
    yCoord[i] +=rate[i];
    if (yCoord[i] >height) {
      yCoord[i] = 0;
    }
  }
}

