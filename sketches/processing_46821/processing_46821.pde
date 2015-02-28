

float gridSize = 20;
float centerX;
float centerY;

PFont font;

void setup() {
  size(400, 400);
  smooth();
  
  centerX = width / 2;
  centerY = height / 2;
  
  font = loadFont("LucidaSans-20.vlw");
  textFont(font);
  
  noLoop();
}

void draw() {
  background(150);
  
  strokeWeight(1);
  stroke(100);
  for (int x = 0; x < width; x += gridSize) {
    line(x, 0, x, height);
  }
  
  for (int y = 0; y < height; y += gridSize) {
    line(0, y, width, y);
  }
  
  fill(0, 0, 0, 20);
  stroke(0);
  strokeWeight(3);
  float diameter = width - 4 * gridSize;
  ellipse(centerX, centerY, diameter, diameter);
  point(width/ 2, height / 2);
   
  float angle = atan2(mouseY - centerY, mouseX - centerX);
  if (angle < 0) angle = TWO_PI + angle;
  
  float kantX = centerX + 0.5 * diameter * cos(angle);
  float kantY = centerY + 0.5 * diameter * sin(angle);
  line(centerX, centerY, kantX, kantY);
  line(centerX, centerY, centerX + 0.5 * diameter, centerY);

  fill(200, 0, 0, 100);
  arc(centerX, centerY, diameter, diameter, 0, angle);
  
  String line = "angle " + round(100 * angle / PI) / 100.0 + " PI   =   " + round(degrees(angle)) % 360 + " degrees";
  float tw = textWidth(line);
  
  fill(255, 255, 255, 200);
  noStroke();
  rect((width - tw) / 2.0 - 8, 400 - 44, textWidth(line) + 16, 32);   
  fill(0);
  
  float tx = (width - tw) / 2.0;
  float ty = (height - 20);
   
  text(line, tx, ty);
}

void mouseMoved() {
  redraw();
}

