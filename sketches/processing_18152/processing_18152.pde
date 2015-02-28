
PImage photo, photo1, photo2, photo3;
BClock bClock;
BClock2 bClock2;
BClock3 bClock3;
BClock4 bClock4;

void setup() {
  size(1000, 1000);
  colorMode(RGB, 256);
  frameRate(1);
  smooth();
  photo = loadImage("https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/be.png");
  
  
  
  
  
  photo1 = loadImage("https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/3top.png");
  
  
  
  
  
  
  
  photo2 = loadImage("https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/6top.png");
  
  
  
  
  
  
  
  photo3 = loadImage("https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/9top.png");
  imageMode(CENTER);
  bClock = new BClock(width/2, height/2);
  bClock2 = new BClock2(width/2, height/2);
  bClock3 = new BClock3(width/2, height/2);
  bClock4 = new BClock4(width/2, height/2);
}

void draw() {
  background(255, 255, 255);
  bara(250, 250, 300, 300);
  bara1(750, 250, 300, 300);
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
  image(photo, x, y, r, g);
}

void bara1(int x, int y, int r, int g) {
  image(photo1, x, y, r, g);
}

void bara2(int x, int y, int r, int g) {
  image(photo2, x, y, r, g);
}

void bara3(int x, int y, int r, int g) {
  image(photo3, x, y, r, g);
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
    line(0, 0, 0, -70);
    popMatrix();

    //分
    pushMatrix();
    translate(250, 250);
    rotate((m + s/60.0) * TWO_PI/60);
    strokeWeight(2);
    line(0, 0, 0, -100);
    popMatrix();

    //秒
    pushMatrix();
    translate(250, 250);
    rotate(s * TWO_PI/60);
    strokeWeight(1);
    line(0, 0, 0, -110);
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
    line(0, 0, 0, -70);
    popMatrix();

    //分
    pushMatrix();
    translate(750, 250);
    rotate((m + s/60.0) * TWO_PI/60);
    strokeWeight(2);
    line(0, 0, 0, -100);
    popMatrix();

    //秒
    pushMatrix();
    translate(750, 250);
    rotate(s * TWO_PI/60);
    strokeWeight(1);
    line(0, 0, 0, -110);
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
    line(0, 0, 0, -70);
    popMatrix();

    //分
    pushMatrix();
    translate(750, 750);
    rotate((m + s/60.0) * TWO_PI/60);
    strokeWeight(2);
    line(0, 0, 0, -100);
    popMatrix();

    //秒
    pushMatrix();
    translate(750, 750);
    rotate(s * TWO_PI/60);
    strokeWeight(1);
    line(0, 0, 0, -110);
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
    line(0, 0, 0, -70);
    popMatrix();

    //分
    pushMatrix();
    translate(250, 750);
    rotate((m + s/60.0) * TWO_PI/60);
    strokeWeight(2);
    line(0, 0, 0, -100);
    popMatrix();

    //秒
    pushMatrix();
    translate(250, 750);
    rotate(s * TWO_PI/60);
    strokeWeight(1);
    line(0, 0, 0, -110);
    popMatrix();
  }
}


                
                
