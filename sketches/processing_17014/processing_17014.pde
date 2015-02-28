
PImage myImage;
BClock bClock;

void setup() {
  size(500, 500);
  colorMode(RGB, 256);
  frameRate(1);
  smooth();
  imageMode(CENTER);
  myImage = loadImage("http://24.media.tumblr.com/tumblr_ldpr6nddq61qbmd7oo1_500.png");
  bClock = new BClock(width/2, height/2);
}

void draw() {
  background(255, 255, 255);
  image(myImage, width/2, height/2);
  bClock.getTime();
  bClock.display();
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
    translate(width/2, height/2);
    rotate((h + m/60.0) % 12 * TWO_PI/12);
    strokeWeight(7);
    line(0, 0, 0, -90);
    popMatrix();

    //分
    pushMatrix();
    translate(width/2, height/2);
    rotate((m + s/60.0) * TWO_PI/60);
    strokeWeight(5);
    line(0, 0, 0, -140);
    popMatrix();

    //秒
    pushMatrix();
    translate(width/2, height/2);
    rotate(s * TWO_PI/60);
    strokeWeight(4);
    line(0, 0, 0, -150);
    popMatrix();
  }
}


