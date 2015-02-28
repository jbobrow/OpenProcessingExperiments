
//http://processing.org/examples/milliseconds.html
color[] c= {
  color(255, 0, 0), color(255, 0, 0), color(255, 0, 0)
};
int[] fr= {
  250, 500, 1000
};
int[] nextOn = {
  0, 0, 0
};
boolean[] b = {
  true, true, true
};

void setup() {
  size(600, 400);
  frameRate(60);
  background(255);
}

void draw() {
  int m = millis();
  for (int i =0; i < 3; i ++) {
    if (m > nextOn[i]) {
      nextOn[i] = m + fr[i];
      b[i] = !b[i];
    }
    if (b[i] == true) {
      c[i] = color(255,255,0);
    } 
    else {
      c[i] = color(255,0,0);
    }
    fill (c[i]);
    rect(200 * i+50, height/2-100, 100, 100);
  }
}
