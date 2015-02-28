
int circleX, circleY; 
int circleSize = 100;   
color circleColor, baseColor;
color circleHighlight;
color currentColor;
boolean circleOver = false;

void setup() {
  size(320, 240);
  circleColor = color(255);
  circleHighlight = color(10);
  baseColor = color(0);
  currentColor = baseColor;
  circleX = width/2+circleSize/2+10;
  circleY = height/2;
  ellipseMode(CENTER);
}

void draw() {
  update(mouseX, mouseY);
  background(currentColor);
  
  if (circleOver) {
    fill(circleHighlight);
  } else {
    fill(circleColor);
  }
  stroke(0);
  ellipse(circleX, circleY, circleSize, circleSize);
}

void update(int x, int y) {
  if ( overCircle(circleX, circleY, circleSize) ) {
    circleOver = true;
  }
}

void mousePressed() {
  if (circleOver) {
    currentColor = circleColor;

  }
}

boolean overCircle(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}


