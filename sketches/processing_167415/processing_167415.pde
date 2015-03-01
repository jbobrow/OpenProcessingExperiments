
float lastX;
float lastY;
float lastSize;
float x;
float y;
boolean first;

void setup() {
  size(800, 600);
  colorMode(HSB, 360, 100, 100, 100);
  background(50, 13, 97);
  frameRate(4);
  first = true;
  lastX = width/2;
  lastY = height/2;
  lastSize = 70;
}

void draw() {
  if (random(1000) < 10 || first) drawSoap();
  for (int i = 0; i < 3; i++) drawBubble();
  first = false;
}

void drawBubble() {
  strokeWeight(0.8 + random(1.7));
  stroke(30 + random(20), random(8), 98 + random(3));
  noFill();

  dist = random(10) + lastSize;
  angle = random(2*PI);
  x = lastX + cos(angle)*dist;
  y = lastY + sin(angle)*dist;
  size = lastSize - random(20);
  
  while (size < 4) size = random(100);
  if (x < -size || x > width + size) x = random(width);
  if (y < -size || y > height + size) y = random(height);
  
  translate(x, y);
  ellipse(0, 0, size, size);
  
  lastX = x;
  lastY = y;
  lastSize = size;
  resetMatrix();
}

void drawSoap() {
  noStroke();
  fill(50, 13, 97, 40);
  rect(0, 0, width, height);
  
  noStroke();
  fill(50, 5 + random(3), 94 + random(5));
  translate(random(width), random(height));
  beginShape();
  vertex(246-300, 114-200);
  vertex(444-300, 164-200);
  vertex(445-300, 224-200);
  vertex(363-300, 300-200);
  vertex(156-300, 254-200);
  vertex(158-300, 189-200);
  vertex(246-300, 114-200);
  endShape();
  resetMatrix();
}
