
void setup() {
  size(600, 300);
  background(0);
  noStroke();
  fill(255, 150);
  smooth();
}

float numSprays = 1;
int numPoints = 5;

void draw() {
  PImage img = get(298, 0, width, height);
  image(img, 300, 0);
  
  fill(0);
  rect(0, 0, width/2, height);
  
  fill(255, 150);  
  if (mouseX < (width/2)) {
    numPoints = round(map(mouseX, 0, height, 0, 300));
  }
  
  for (int i = 1; i < numSprays+1; i++) {
    spray(round(i*height/(numSprays+1)), numPoints);
  }
}

float damp = 0.0;

void spray(int height, int numPoints) {
  for (int i = 1; i < numPoints; i++) {
    float x = i * (width/2) / numPoints;
    
    float y = height;
    float range = map(sqr(i), 1, sqr(numPoints), 0, 60);
    if (mouseX < (width/2)) {
      damp = map(mouseY, 0, (width/2), 0, 1);
    }
    float yOff = random(-range, range) * damp;
    y += round(yOff);
    
    ellipse(x, y, 3, 3);
    
    if (i == numPoints - 1) {
      ellipse(x + 2, y, 3, 3);
    }
  }
}

int sqr(int x) {
  //return round(pow(x, 3) - pow(x, 2) + 3);
  return round(pow(x, 1.75));
}

void mousePressed() {
  noLoop();
}

void mouseReleased() {
  loop();
}

void keyReleased() {
  numSprays++;
  if (numSprays > 6)
    numSprays = 1;
}

