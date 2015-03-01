
PImage webImg;
int[] dotSizes = new int[] {
  5, 4, 4, 3, 3, 3, 3, 2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
};
int multiplier = 5;

void setup() {
  size(480, 720);

  // String url = "http://actor-images.celebritizer.com/actor/107048/Jack-Nicholson.jpg";
  // Load image from a web server
  webImg = loadImage("Jack-Nicholson.jpg");
  noStroke();
  smooth();
}
void draw() {
  int currentDot = 0;
  while (currentDot < 20) {
    int random = (int)(Math.random() * 10);

    int offsetFactor = 40;
    int offsetX = calculateRandomOffsetSquare(offsetFactor) + mouseX;
    int offsetY = calculateRandomOffsetSquare(offsetFactor) + mouseY;

    int lineLength = getLineLength();


    int colr = webImg.get(offsetX, offsetY);
    fill(colr);

    int dotRadius = getDotRadius(currentDot);
    ellipse(offsetX, offsetY, dotRadius*2, dotRadius*2);

    currentDot++;
  }
}

int getDotRadius( int currentDot) {
  return dotSizes[currentDot] * multiplier;
}

int getLineLength() {
  return 6;
}

int calculateRandomOffsetSquare(int factor) {
  return ((int)((Math.random() * (factor*2))) - factor) ^ 2;
}

void incrementmultiplier() {
  multiplier--;
  if (multiplier < 1) {
    multiplier = 5;
  }
}

void mouseClicked() {
  incrementmultiplier();
}



