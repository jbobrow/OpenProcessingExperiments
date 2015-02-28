

// Luca Sassone
// luglio 2010

int t = 0;

// ----------------------------------------------

void setup () {
  size(600, 600, P2D);
  background(255);
  stroke(0);
  fill(255, 10);
}

// ----------------------------------------------

void draw () {
  int x1 = (int)random(0, width);
  int x2 = (int)random(0, width);
  int y1 = (int)random(0, height);
  int y2 = (int)random(0, height);
  line(x1, 0, x2, height);
  line(0, y1, width, y2);
  t++;
  
  if (t == 1) {
    t = 0;
    copy(5, 5, width-10, height-10, 0, 0, width, height);
//    filter(BLUR, 1);
    noStroke();
    rect(0, 0, width, height);
    stroke(0);
//    noLoop();
  }
}

// ----------------------------------------------


