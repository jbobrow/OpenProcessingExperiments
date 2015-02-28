
void setup() {
  size(600, 600);
  smooth();
}

//holysportz
void draw() {
  //backgroundrainbow
  noStroke();
  background(120, 200, 10);
  colorMode(RGB, 100);
  for (int c = 0; c < 600; c++) {
    for (int d = 0; d < 600; d++) {
      stroke(c, d, 0);
      point(c, d);
    }
  }
  //holycirclez
  for (int i = 20; i < 600; i += 40) {
    for (int j = 20; j < 600; j += 20) {
      fill(5, 250, 231);
      ellipse(i, j, 30, 30);
    }
  }
  //CENTER PURP
  for (int p = 40; p < 900; p +=50) {
    strokeWeight(8);
    stroke(250, 5, 169);
    noFill();
    ellipse(300, 300, p, p);
  }
  //REEEEEEDDD
  for (int p = 40; p < 900; p +=25) {
   strokeWeight(2.5);
      stroke(250, 5, 5);
      noFill();
      ellipse(0, 600, p, p);
    }
    //GRRRRAAAYYNEE
      for (int p = 40; p < 900; p +=25) {
   strokeWeight(2.5);
      stroke(9, 209, 6);
      noFill();
      ellipse(600, 600, p, p);
    }
    //ORYANG
        for (int p = 40; p < 900; p +=25) {
   strokeWeight(2.5);
      stroke(255, 50, 5);
      noFill();
      ellipse(0, 0, p, p);
    }
    //YALURP
        for (int p = 40; p < 900; p +=25) {
   strokeWeight(2.5);
      stroke(250, 255, 5);
      noFill();
      ellipse(600, 0, p, p);
    }
  }
  //IM AS HIGH AS A KNIFE, ASK ME ANYTIME
