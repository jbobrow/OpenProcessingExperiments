
void setup() {
  size(400, 400);
  smooth();
  background(0, 255, 247, 10);
}

float count = 20;
float rectangle;
float rndColor;


void draw() {
  if (count < 50) {
    rndColor = random(50);
    if (rndColor > 30) {
      fill(0, 255, 133, 10);
    }
    else {
      fill(255, 255, 133, 20);
    }
    rectangle = random(100, 200);
    rect(random(width), random(height), rectangle, rectangle);
  }
}

//rectangles wouldn't stop drawing.

