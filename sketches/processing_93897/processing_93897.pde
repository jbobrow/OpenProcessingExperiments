
float data[][] = new float[2][21];
void setup() {
  size(500, 500);
  background(255);
  for (int i = 1990; i <= 2010; i++) {
    data[0][i - 1990] = i;
  }
  data[1][0] = 7.22;
  data[1][1] = 7.9;
  data[1][2] = 7.97;
  data[1][3] = 8.21;
  data[1][4] = 8.39;
  data[1][5] = 8.43;
  data[1][6] = 8.26;
  data[1][7] = 8.33;
  data[1][8] = 8.44;
  data[1][9] = 8.39;
  data[1][10] = 7.95;
  data[1][11] = 7.67;
  data[1][12] = 7.74;
  data[1][13] = 7.73;
  data[1][14] = 7.8;
  data[1][15] = 8.46;
  data[1][16] = 9.71;
  data[1][17] = 11.89;
  data[1][18] = 13.84;
  data[1][19] = 14.98;
  data[1][20] = 14.32;
}
void draw() {
  background(0);
  image(loadImage("bulb2.png"), 125, 125);
  fill(0, 0, 0, 100 - 500 * findValue(mouseX) / 250);
  rect(0, 0, 500, 500);
  stroke(255);
//  for (int i = 0; i < 19; i++) {
//    line(i * 25, 400 - 25 * data[1][i], (i + 1) * 25, 400 - 25 * data[1][i + 1]);
//  }
  fill(255);
  textSize(20);
  text("Price of Total Electric Industry in " + data[0][constrain((int)(mouseX / (500 / 21)), 0, 20)], 75, 50);
  text(data[1][constrain((int)(mouseX / (500 / 21)), 0, 20)] + " cents / kilowatt hr", 150, 75);
  fill(100,100,100);
  rect(0,490,width, 10);
  fill(255,0,0);
  rect(mouseX - 12.5,490, 25, 10);
}
float findValue(float x) {
  int index1 = constrain((int)(x / (500 / 21)), 0, 20);
  int index2 = constrain(index1 + 1, 0, 20);
  float out = (data[1][index1] + data[1][index2]) * (mouseX - index1 * 21) / (500 / 21);
  return out;
}


