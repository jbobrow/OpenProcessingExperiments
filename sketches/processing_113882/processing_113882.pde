
float x, y, j;
int elems = 40;
int rows = 30;
int[] _x = new int[elems*rows];
int[] _y = new int[elems*rows];
int incr;
int bg = 220;
int s = 50;

void setup() {
  size(500, 300);
  background(bg);
  incr = int(height/rows);
}

void draw() { 
  if (frameCount % 10 == 0) {
    fill(bg, 150);
    rect(0, 0, width, height);    
    for (int j = incr/2; j < height; j += random(incr*.2, incr*1)) {
      drawLine(j);
    }
  }

}

void drawLine(int _j) {
  int j = _j;
  x = -5;
  stroke(s);
  noFill();
  beginShape();
  for (int i=0; i< elems; i++) {
    strokeWeight(random(1, 2));
    y = j + random(-10, 10);
    _x[i]=int(x);
    _y[i]=int(y);
    vertex(x, y);
    x += random(40, 70);
  }
  endShape();

  for (int i=0; i< elems; i++) {
    int x = _x[i];
    int y = _y[i];
    ellipse(x, y, random(3, 6), random(2, 5));
  }
}
