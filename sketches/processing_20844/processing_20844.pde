
BClock bClock;
BClock2 bClock2;
BClock3 bClock3;
BClock4 bClock4;

void setup() {
  size(1000, 1000);
  colorMode(RGB, 256);
  frameRate(1);
  smooth();
  bClock = new BClock(width/2, height/2);
  bClock2 = new BClock2(width/2, height/2);
  bClock3 = new BClock3(width/2, height/2);
  bClock4 = new BClock4(width/2, height/2);
}

void draw() {
  background(255, 255, 255);
  bara(250, 250, 400, 400);
  bara1(750, 250, 400, 400);
  bara2(750, 750, 300, 300);
  bara3(250, 750, 300, 300);

  bClock.getTime();
  bClock.display();

  bClock2.getTime();
  bClock2.display();

  bClock3.getTime();
  bClock3.display();

  bClock4.getTime();
  bClock4.display();
}

void keyPressed() {
  save("0812303.png");
}

void bara(int x, int y, int r, int g) {
  fill(255);
  strokeWeight(2);
  ellipse(250, 250, 400, 400);
  PFont myFont = loadFont("BodoniSvtyTwoITCTT-Book-48.vlw");
  textFont(myFont);
  fill(0);
  textAlign(CENTER);
  textSize(35);
  translate(0, 0);
  text("11", 250, 110);
  text("2", 330, 130);
  text("1", 380, 180);
  text("4", 410, 250);
  text("3", 400, 330);
  text("6", 340, 390);
  text("5", 250, 420);
  text("8", 160, 390);
  text("7", 110, 330);
  text("10", 90, 250);
  text("9", 120, 180);
  text("12", 170, 130);
}

void bara1(int x, int y, int r, int g) {
  fill(255);
  strokeWeight(2);
  ellipse(750, 250, 400, 400);


 PFont myFont = loadFont("BodoniSvtyTwoITCTT-Book-48.vlw");
  textFont(myFont);
  fill(0);
  textAlign(CENTER);
  textSize(35);
  translate(0, 0);
  text("3", 750, 110);
  text("1", 830, 130);
  text("2", 880, 180);
  text("6", 910, 250);
  text("4", 900, 330);
  text("5", 840, 390);
  text("9", 750, 420);
  text("7", 660, 390);
  text("8", 610, 330);
  text("12", 590, 250);
  text("10", 620, 180);
  text("11", 670, 130);
}

void bara2(int x, int y, int r, int g) {
  fill(255);
  strokeWeight(2);
  ellipse(750, 750, 400, 400);


  PFont myFont = loadFont("BodoniSvtyTwoITCTT-Book-48.vlw");
  textFont(myFont);
  fill(0);
  textAlign(CENTER);
  textSize(35);
  translate(0, 0);
  text("6", 750, 610);
  text("1", 830, 630);
  text("2", 880, 680);
  text("9", 910, 750);
  text("4", 900, 830);
  text("5", 840, 890);
  text("12", 750, 920);
  text("7", 660, 890);
  text("8", 610, 830);
  text("3", 590, 750);
  text("10", 620, 680);
  text("11", 670, 630);
}

void bara3(int x, int y, int r, int g) {
  fill(255);
  strokeWeight(2);
  ellipse(250, 750, 400, 400);


  PFont myFont = loadFont("BodoniSvtyTwoITCTT-Book-48.vlw");
  textFont(myFont);
  fill(0);
  textAlign(CENTER);
  textSize(35);
  translate(0, 0);
  text("9", 250, 610);
  text("1", 330, 630);
  text("2", 380, 680);
  text("12", 410, 750);
  text("4", 400, 830);
  text("5", 340, 890);
  text("3", 250, 920);
  text("7", 160, 890);
  text("8", 110, 830);
  text("6", 90, 750);
  text("10", 120, 680);
  text("11", 170, 630);
}


class BClock extends Clock {
  float x, y;

  BClock(float _x, float _y) {
    x = _x;
    y = _y;
  }

  void getTime() {
    super.getTime();
  }

  void display() {
    stroke(0, 0, 0);
    //時間
    pushMatrix();
    translate(250, 250);
    rotate((h + m/60.0) % 12 * TWO_PI/12);
    strokeWeight(2);
    line(0, 0, 0, -90);
    popMatrix();

    //分
    pushMatrix();
    translate(250, 250);
    rotate((m + s/60.0) * TWO_PI/60);
    strokeWeight(2);
    line(0, 0, 0, -130);
    popMatrix();

    //秒
    pushMatrix();
    translate(250, 250);
    rotate(s * TWO_PI/60);
    strokeWeight(1);
    line(0, 0, 0, -140);
    popMatrix();
  }
}


class BClock2 extends Clock {
  float x, y;

  BClock2(float _x, float _y) {
    x = _x;
    y = _y;
  }

  void getTime() {
    super.getTime();
  }

  void display() {
    stroke(0, 0, 0);
    //時間
    pushMatrix();
    translate(750, 250);
    rotate((h + m/60.0) % 12 * TWO_PI/12);
    strokeWeight(2);
    line(0, 0, 0, -90);
    popMatrix();

    //分
    pushMatrix();
    translate(750, 250);
    rotate((m + s/60.0) * TWO_PI/60);
    strokeWeight(2);
    line(0, 0, 0, -130);
    popMatrix();

    //秒
    pushMatrix();
    translate(750, 250);
    rotate(s * TWO_PI/60);
    strokeWeight(1);
    line(0, 0, 0, -140);
    popMatrix();
  }
}


class BClock3 extends Clock {
  float x, y;

  BClock3(float _x, float _y) {
    x = _x;
    y = _y;
  }

  void getTime() {
    super.getTime();
  }

  void display() {
    stroke(0, 0, 0);
    //時間
    pushMatrix();
    translate(750, 750);
    rotate((h + m/60.0) % 12 * TWO_PI/12);
    strokeWeight(2);
    line(0, 0, 0, -90);
    popMatrix();

    //分
    pushMatrix();
    translate(750, 750);
    rotate((m + s/60.0) * TWO_PI/60);
    strokeWeight(2);
    line(0, 0, 0, -130);
    popMatrix();

    //秒
    pushMatrix();
    translate(750, 750);
    rotate(s * TWO_PI/60);
    strokeWeight(1);
    line(0, 0, 0, -140);
    popMatrix();
  }
}

class BClock4 extends Clock {
  float x, y;

  BClock4(float _x, float _y) {
    x = _x;
    y = _y;
  }

  void getTime() {
    super.getTime();
  }

  void display() {
    stroke(0, 0, 0);
    //時間
    pushMatrix();
    translate(250, 750);
    rotate((h + m/60.0) % 12 * TWO_PI/12);
    strokeWeight(2);
    line(0, 0, 0, -90);
    popMatrix();

    //分
    pushMatrix();
    translate(250, 750);
    rotate((m + s/60.0) * TWO_PI/60);
    strokeWeight(2);
    line(0, 0, 0, -130);
    popMatrix();

    //秒
    pushMatrix();
    translate(250, 750);
    rotate(s * TWO_PI/60);
    strokeWeight(1);
    line(0, 0, 0, -140);
    popMatrix();
  }
}

class Clock {
  int h, m, s;
  Clock() {
  }

  void getTime() {
    h = hour();
    m = minute();
    s = second();
  }
}
                                
