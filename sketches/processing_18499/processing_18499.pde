
void setup() {
  size(250, 200);
  smooth();
  ellipseMode(CENTER);
  textFont(createFont("sans", 20));
  textAlign(CENTER);
}

float fraction;
float gutterWidth = 15;
color graphFill = color(0, 100);

void draw() {
  background(255);
  
  if (mouseIsInGutter()) {
    drawGutter(0.5);
  }
  else {
    updateFraction();
    drawGutter(0.2);
  }
  
  drawPieChart();
  drawBarChart();
}

void drawPieChart() {
  PVector location = new PVector(90, 70);
  float size = 100;
  float wedgeAngle = fraction * TWO_PI;
  
  noFill();
  stroke(0);
  ellipse(location.x, location.y, size, size);
  fill(graphFill);
  arc(location.x, location.y, size, size, 0, wedgeAngle);
  
  text(round(fraction*100) + " %", width/2, location.y + size);
}

void drawBarChart() {
  PVector location = new PVector(170, 20);
  PVector dimensions = new PVector(30, 100);
  float barHeight = fraction * dimensions.y;
  
  noFill();
  stroke(0);
  rect(location.x, location.y, dimensions.x, dimensions.y);
  fill(graphFill);
  rect(location.x, location.y + (dimensions.y - barHeight), dimensions.x, barHeight);
}

void updateFraction() {
  fraction = norm(mouseX, gutterWidth, width-gutterWidth);
}

boolean mouseIsInGutter() {
  return mouseX < gutterWidth || mouseX > width-gutterWidth;
}

void drawGutter(float opacity) {  
  fill(255, 0, 0, 255 * opacity);
  noStroke();
  rect(0, 0, gutterWidth, height);
  rect(width-gutterWidth, 0, width, height);
}

