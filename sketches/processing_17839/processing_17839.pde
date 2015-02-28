
RadialHand radialHand;
  
void setup() {
  size(300, 400);
  colorMode(HSB, 100);
  smooth();
  radialHand = new RadialHand(width/2, height/2);
}
  
void draw() {
  background(90);
  fill(100);
  stroke(100);
  strokeWeight(25);
  strokeJoin(ROUND);
  triangle(width/2, 355, 50, 50, 250, 50);
  radialHand.getTime();
  radialHand.display();
}
  
  class RadialHand extends Clock {
  float x, y;
    
  RadialHand(float _x, float _y) {
    x = _x;
    y = _y;
  }
    
  void getTime() {
    super.getTime();
  }
    
  void display() {
    //針の色
    stroke(0);
    //時
    pushMatrix();
    translate(width/2, 350);
    strokeWeight(5);
    textSize(10);
    fill(50);
    textAlign(CENTER);
    text("24", 0, -300);
    text("23", 0, -290);
    text("22", 0, -280);
    text("21", 0, -270);
    text("20", 0, -260);
    text("19", 0, -250);
    text("18", 0, -240);
    text("17", 0, -230);
    text("16", 0, -220);
    text("15", 0, -210);
    text("14", 0, -200);
    text("13", 0, -190);
    text("12", 0, -180);
    text("11", 0, -170);
    text("10", 0, -160);
    text("09", 0, -150);
    text("08", 0, -140);
    text("07", 0, -130);
    text("06", 0, -120);
    text("05", 0, -110);
    text("04", 0, -100);
    text("03", 0, -90);
    text("02", 0, -80);
    text("01", 0, -70);
    text("00", 0, -60);
    line(0, 0, 0, -60+-h*10);
    popMatrix();
    //分
    pushMatrix();
    translate(width/2, 350);
    rotate(TWO_PI/-20);
    strokeWeight(3);
    textSize(10);
    fill(50);
    textAlign(CENTER);
    text("60", -8, -300);
    text("55", -8, -270);
    text("50", -8, -250);
    text("45", -8, -225);
    text("40", -8, -200);
    text("35", -8, -175);
    text("30", -8, -150);
    text("25", -8, -125);
    text("20", -8, -100);
    text("15", -8, -75);
    text("10", -8, -50);
    text("05", -8, -25);
    text("00", -8, 0);
    line(0, 0, 0, -m*5);
    popMatrix();
    //秒
    pushMatrix();
    translate(width/2, 350);
    rotate(TWO_PI/20);
    strokeWeight(3);
    stroke(25, 100, 80);
    textSize(10);
    fill(50);
    textAlign(CENTER);
    text("60", 8, -300);
    text("55", 8, -270);
    text("50", 8, -250);
    text("45", 8, -225);
    text("40", 8, -200);
    text("35", 8, -175);
    text("30", 8, -150);
    text("25", 8, -125);
    text("20", 8, -100);
    text("15", 8, -75);
    text("10", 8, -50);
    text("05", 8, -25);
    text("00", 8, 0);
    line(0, 0, 0, -s*5);
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
