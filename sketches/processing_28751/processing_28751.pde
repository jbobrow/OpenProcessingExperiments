
float x = 0;
float y = 0;
float r = 0;
boolean cw = true;
float lineLength = 10;
float turnProbability = .2;
int minWidth = 10;
int maxWidth = 50;
int lineWidth = maxWidth;
int turnDivider = 20;
//PImage img;

void setup() {
  size(1024, 768, P2D);
  background(0);
  x = width / 2;
  y = height / 2;
  smooth();
  //img = loadImage("colorama.jpg");
}

void draw() {
  if (random(1) < turnProbability) {
    turnDivider = int(random(50))+50;
    cw = !cw;
  }
  lineWidth += round(round(random(4))-2);
  if (lineWidth < minWidth) {
    lineWidth = minWidth;
  }
  if (lineWidth > maxWidth) {
    lineWidth = maxWidth;
  }
  if (cw) {
    r += lineLength/lineWidth;
  } 
  else {
    r -= lineLength/lineWidth;
  }

  float oldX = x;
  float oldY = y;

  x += cos(r)*lineLength;
  y += sin(r)*lineLength;

  x = min(max(x, 0), width);
  y = min(max(y, 0), height);

  float tempX = oldX + cos(r);
  float tempY = oldY + sin(r);

  //int colorX = int(map(int(x), 0, width, 0, img.width-1));
  //int colorY = int(map(int(y), 0, height, 0, img.height-1));
  //color sampleColor = img.get(colorX, colorY);
  color sampleColor = color(255);

  if (random(1) < .1) {
    float i = random(PI*2);
    fill(sampleColor);
    stroke(0);
    strokeWeight(1);
    float s = lineWidth * random(1);
    ellipse(x + sin(i) * s, y + cos(i) * s, s, s);
  }
  
  noStroke();
  fill(0);
  ellipse(x, y, lineWidth + 2, lineWidth + 2);

  fill(sampleColor);
  ellipse(tempX, tempY, lineWidth, lineWidth);
}

