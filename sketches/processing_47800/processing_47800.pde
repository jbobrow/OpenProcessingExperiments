
float x, y, _x, _y, r, strokeWidth;
color strokeColour;
int counter, ellipseD;

void setup() {  
  size(300, 300);
  smooth();
  background(0); 
  strokeWidth = 1;
  strokeColour = color(255, 255, 255);  
  restart();
}

void draw() {
  noStroke();
  fill(0, 5);
  rect(0, 0, width, height);
  stroke(strokeColour);
  strokeWeight(strokeWidth);
  fill(strokeColour);

  _x = x + cos(r) * 4;  
  _y = y + sin(r) * 4;

  line(x, y, _x, _y); 

  x = _x;
  y = _y;

  r += random(-0.5, 0.5); 

  counter++;

  dimensionCheck();
  counterCheck();
}

void restart() {
  x = width / 2;
  y = height / 2;
  r = random(TWO_PI);
}

void dimensionCheck() {
  if (x < 0 || x > width || y < 0 || y > height) {
    restart();
    randomWeight();
    randomColour();
  }
}

void counterCheck() {
  if (counter == 20) {
    ellipseD = (int)random(5, 15);
    ellipse(x, y, ellipseD, ellipseD);  
    counter = 0;
  }
}

void randomWeight() {
  strokeWidth = random(1, 5);
}

void randomColour() {
  strokeColour = color(random(100, 255), random(100, 255), random(100, 255));
}


