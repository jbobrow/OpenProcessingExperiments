
/*
  This program studies what happens when you map noise() or random() to hue.
   
  random() covers the whole spectrum and you get all kinds of hues. The probability for
  all values is the same.
   
  noise() does not cover the whole spectrum. Reds, oranges and yellows are missing.
  Not all numbers between 0 and 1 have the same probability of appearing.
  Numbers near 0.5 are much more likely.
   
  Stretched noise, first attempt at fixing this.
  snoise() tries to solve the problem by stretching the noise() values. 
  But red is still missing.
  
  Wrapped noise, better solution
  wnoise() wraps the noise values 6 times using modulo. All hues are there, and the
  distribution of values seems similar to random().
 
*/
 
float[] n;
Button[] but;
boolean doWork = true;
int modeID = 2;
 
void setup() {
  size(500, 500);
  colorMode(HSB, 500);
  n = new float[width];
  reset();
  but = new Button[4];
  but[0] = new Button(0, "random()", 20, 40);
  but[1] = new Button(1, "noise()", 20, 60);
  but[2] = new Button(2, "snoise()", 20, 80);
  but[3] = new Button(3, "wnoise()", 20, 100);
}
void reset() {
  for (int i = 0; i<width; i++) {
    n[i] = 0;
  }
  doWork = true;
}
float snoise(float x, float y, float z) {
  float n = noise(x, y, z);
  if (n > 0.5) {
    n = pow(2*(1-n), 3) / 2; // 0.5 .. 1 >> 1 .. 0
    n = 1 - n;
  }
  else {
    n = pow(2*n, 3) / 2;
  }
  return n;
}
float wnoise(float x, float y, float z) {
  float n = noise(x, y, z);
  return (n * 6) % 1;
}
void calculate() {
  for (int j = 0; j<1000; j++) {
    int r = 0;
    switch(modeID) {
    case 0:
      r = int(random(0, width));
      break;
    case 1:
      r = int(noise(frameCount/10.0, j/10.0) * width);
      break;
    case 2:
      r = int(snoise(frameCount/10.0, j/10.0, 0) * width);
      break;
    case 3:
      r = int(wnoise(frameCount/10.0, j/10.0, 0) * width);
      break;
    }
    n[r] += 0.6;
  }
  if (n[(int)(width * 0.45)] > height) {
    doWork = false;
  }
}
void draw() {
  background(255);
  if (doWork) {
    calculate();
  }
  for (int i = 0; i<width; i++) {
    stroke(i, n[i], n[i]);
    line(i, height, i, height-n[i]);
    stroke(0);
  }
  for (int i=0; i<but.length; i++) {
      but[i].draw();
  }
}
class Button {
  int id;
  String t;
  int x;
  int y;
  int w;
  int h;
  Button(int id, String t, int x, int y) {
    this.id = id;
    this.t = t;
    this.x = x;
    this.y = y;
    this.w = int(textWidth(t)) + 20;
    this.h = int(textAscent() + textDescent());
  }
  void draw() {
    boolean inside = mouseOver();
    fill(inside ? 500 : (modeID == id ? 400 : 200));
    rect(x, y, w, h);
    fill(0);
    text(t, x+2, y+h-2);
    if (inside && mousePressed) {
      modeID = id;
      reset();
    }
  }
  boolean mouseOver() {
    return mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h;
  }
}
