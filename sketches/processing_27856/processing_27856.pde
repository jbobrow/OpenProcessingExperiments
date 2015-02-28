
float a = 20;
float b = 250;
float c = 10;
float d = 20;
float e = 105;

void setup () {
  size (500, 500);
  smooth ();
  noStroke ();
}

void draw() {
  fill (255);
  rect (0, 0, 500, 500);
  fill (0, 0, 0, 25);
  rect (0, 48, 500, 2);
  rect (0, 450, 500, 2);
  rect (48, 0, 2, 500);
  rect (450, 0, 2, 500);
  fill (0);
  rect (b, e - d * 2, random (a), c);
  rect (b, e - d, random (a), c);
  rect (b, e, random (a), c);
  rect (b, e + d, random (a), c);
  rect (b, e + d * 2, random (a), c);
  rect (b, e + d * 3, random (a), c);
  rect (b, e + d * 4, random (a), c);
  rect (b, e + d * 5, random (a), c);
  rect (b, e + d * 6, random (a), c);
  rect (b, e + d * 7, random (a), c);
  rect (b, e + d * 8, random (a), c);
  rect (b, e + d * 9, random (a), c);
  rect (b, e + d * 10, random (a), c);
  rect (b, e + d * 11, random (a), c);
  rect (b, e + d * 12, random (a), c);
  rect (b, e + d * 13, random (a), c);
  rect (b, e + d * 14, random (a), c);
  rect (b, e + d * 15, random (a), c);
  rect (b, e + d * 16, random (a), c);
  
  if (mouseX > b + 200 && a <= 190) {
    a = a + 5;
  }
  
  if (mouseX < b - 200 && a >= -190) {
    a = a - 5;
  }
  
  if (mouseY > 450 && c >= 1) {
    c = c - 0.2;
    e = e + 0.1;
  }
  
  if (mouseY < 50 && c <= 20) {
    c = c + 0.2;
    e = e - 0.1;
  }
  
  if (mousePressed) {
    a = 20;
    b = 250;
    c = 10;
    d = 20;
    e = 105;
  }
  
  if (keyPressed) {
    a = random (500);
    b = random (500);
    c = random (500);
    d = random (500);
    e = random (500);
  }
}

