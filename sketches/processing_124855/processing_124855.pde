
int n = 0;
int nextChange = 0;
float angle = random(TWO_PI);
float angleIncr = 0.2;
float widthIncr = 0.3;
float lengthIncr = 0.3;
float x0, y0, x1, y1;
float maxWidth = 40;
float maxLength = 30;
float lineLength = maxLength;
float lineWidth = maxWidth;

void setup() {
  size(1000, 500);
  background(255);
  stroke(0);
  smooth();
  x0 = 0;
  y0 = 0;
}

void draw() {
  x1 = constrain(x0 + lineLength * cos(angle), -lineWidth, width + lineWidth);
  y1 = constrain(y0 + lineLength * sin(angle), -lineWidth, height + lineWidth);

  float x2 = constrain(x0 + 4 * cos(angle), -lineWidth, width + lineWidth);
  float y2 = constrain(y0 + 4 * sin(angle), -lineWidth, height + lineWidth);

  strokeWeight(lineWidth + 4);
  stroke(255);
  line(x2, y2, x1, y1);
  strokeWeight(lineWidth);
  stroke(0);
  line(x0, y0, x1, y1);
  x0 = x1;
  y0 = y1;
  lineWidth -= widthIncr;
  lineLength -= lengthIncr;
  angle += angleIncr;
  
  if (n == nextChange) {
    angleIncr = -angleIncr;
    n = 0;
    nextChange = int(random(1, 50));
    noStroke();
    fill(255, 5);
    rect(0, 0, width, height);    
  }
  
  n++;
  
  if (lineWidth < 2 || lineWidth > maxWidth) {
    widthIncr = -widthIncr;
  }

  if (lineLength < 5 || lineLength > maxLength) {
    lengthIncr = -lengthIncr;
  }
}

