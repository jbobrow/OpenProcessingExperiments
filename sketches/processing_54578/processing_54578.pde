
PFont font;
float[] xCoords= new float[100];
float[] yCoords= new float[100];
char [] chars = new char[100];

void setup() {
  size(400, 400);
  font = loadFont("CourierNewPSMT-48.vlw");
  for (int i = 0; i < 100; i++) {
    xCoords[i] = random(width);
    yCoords[i] = random(height);
    char c = 'a';
    c+= random(64);
    chars[i] = c;
  }
}
void draw() {
  noStroke();
  fill(0, 20);
  rect(0, 0, width, height);

  //draw matrix
  for (int i = 0; i < 100; i++) {
    fill(0, 255, 0);
    text(chars[i], xCoords[i], yCoords[i]);

    // move chars
    yCoords[i] +=2;
    if (yCoords[i] > height)yCoords[i]= 0;
    chars[i] += random(64);
    chars[i] %=64;
  }
}


