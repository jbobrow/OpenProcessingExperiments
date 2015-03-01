
void setup() {
  size(400, 400);
  noStroke();
  colorMode(HSB, 100);
}

float a, b, c;

void draw() {
  //filter(ERODE);
  float fillEllipse = map(sin(c), -1, 1, 0, 100);
  fill(fillEllipse, 50, 15, 35);
  rect(0, 0, width, height);
    
  fill(fillEllipse, 100, 100);
  translate(width/2, height/2);
  ellipse(sin(a)*cos(c)*(150), cos(a)*sin(b)*(150), 20, 20);

  a = a + 0.09;
  b = b + 0.09;
  c = c + 0.001;
}

