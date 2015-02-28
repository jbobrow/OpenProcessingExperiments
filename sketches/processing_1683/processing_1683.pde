
float a = 0;
float b = 0;
float c = 75;
float x = 255;

void setup() {
  size(600, 600);
  background(0);  
  smooth();
}

void draw() {
  translate(width/2, height);  
  strokeWeight(2);
  stroke(242, 186, 81, 50);
  fill(mouseX, 98, 62, x);  
  ellipse(0, b - 75, c, c);
  b -= random(0.5);
  c += random(-6, 6);
  if (b < -height) {
    c = 550;
    x = 3;
    if (b < -height - 170) {
    noLoop();
    }  
  }
}

