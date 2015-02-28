
int i;
float seaLevel = 0;
boolean seaLevelRising = true;
boolean sketchClicked = false;

void setup() {
  size(800, 600);
  background(255);
  smooth();
  noStroke();
  colorMode(HSB, 100, 100, 100, 100);

  frameRate(30);
}

void draw() {

  if (mousePressed)
    sketchClicked = true;

  if (!sketchClicked)
    return;

  if (seaLevelRising) {
    seaLevel += 2;
  } 
  else {
    seaLevel -= 5;
  }

  if (seaLevelRising && seaLevel >= height-5) {
    seaLevelRising = false;
  } 
  else if (!seaLevelRising && seaLevel <= 0) {
    seaLevelRising = true;
  }

  // Check if we're rising, and draw sea first
  if (seaLevelRising) {
    for (i = 0; i < 50; i++) {
      fill(random(55, 60), 80, 80);
      int size = int(random(35, 75));
      ellipse(random(width), height - seaLevel, size, size);
    }
  }

  // Draw white circles in both cases
  for (i = 0; i < 50; i++) {
    fill(100);
    int size = int(random(35, 75));
    ellipse(random(width), height - seaLevel - 50, size, size);
  }
}


