
float grayLvls[];
int grays = 17;

void setup() {
  size(100, 500);
  background(0);

  grayLvls = new float[grays];

  for (int i=0; i < grays; i++) {
    float randomF = random(255);
    grayLvls[i] = randomF;
  }

  return;
}

void draw() {
  background(255);
  int loc = 50;

  for (int j=0; j < grays; j++) {
    fill(grayLvls[j], grayLvls[j], grayLvls[j], 230);
    ellipse(50, loc, 40, 40);
    loc += 25;
    if (grayLvls[j] >= 255.0) grayLvls[j] = 0.0;
    else grayLvls[j]++;
  }
}
