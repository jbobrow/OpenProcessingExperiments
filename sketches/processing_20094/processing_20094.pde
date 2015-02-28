
BClock bClock;
String[] message = {
  "は金なり。", "は人を待たず。", "の花を挿頭にせよ。", "は得難く失い易し。"
};
int count = 0;

void setup() {
  size(600, 400);
  colorMode(RGB, 256);
  frameRate(1);
  smooth();
  bClock = new BClock(width/2, height/2);
}

void draw() {
  background(255, 255, 255);
  bClock.getTime();
  bClock.display();
  pushMatrix();
  noFill();
  ellipse(200, height/2, 100, 100);
  popMatrix();
  pushMatrix();
  fill(0);
  textSize(30);
  text(message[count], 280, height/2+30);
  count++;
  count %= message.length;
  //text("は金なり。", 280, height/2+30);
  //text("は人を待たず。", 280, height/2+30);
  popMatrix();
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
    translate(200, height/2);
    //translate(width/2, height/2);
    rotate((h + m/60.0) % 12 * TWO_PI/12);
    strokeWeight(7);
    line(0, 0, 0, -20);
    popMatrix();
 
    //分
    pushMatrix();
    translate(200, height/2);
    //translate(width/2, height/2);
    rotate((m + s/60.0) * TWO_PI/60);
    strokeWeight(5);
    line(0, 0, 0, -30);
    popMatrix();
 
    //秒
    pushMatrix();
    translate(200, height/2);
    //translate(width/2, height/2);
    rotate(s * TWO_PI/60);
    strokeWeight(3);
    line(0, 0, 0, -40);
    popMatrix();
  }
}


