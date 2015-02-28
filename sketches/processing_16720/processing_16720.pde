
int AnalogClock analogClock;
PImage king;
PImage queen;
PImage jack;
PImage ace;
PImage two;
PImage three;
PImage four;
PImage five;
PImage six;
PImage seven;
PImage eight;
PImage nine;
PImage ten;
  
void setup() {
  size(720, 720);
  imageMode(CENTER);
  smooth();
  analogClock = new AnalogClock(width/2, height/2);
  king = loadImage("King.png");
  queen = loadImage("Queen.png");
  jack = loadImage("Jack.png");
  ace = loadImage("Ace.png");
  two = loadImage("2.png");
  three = loadImage("3.png");
  four = loadImage("4.png");
  five = loadImage("5.png");
  six = loadImage("6.png");
  seven = loadImage("7.png");
  eight = loadImage("8.png");
  nine = loadImage("9.png");
  ten = loadImage("10.png");
}
  
void draw() {
  background(204);
  analogClock.getTime();
  analogClock.display();
  https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/2.png
  https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/3.png
  https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/4.png
  https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/4.png
  https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/5.png
  https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/6.png
  https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/7.png
  https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/8.png
  https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/9.png
  https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/10.png
  https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/Ace.png
  https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/Jack.png
  https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/King.png
  https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/Queen.png
}
  
class AnalogClock extends Clock {
  float x, y;
    
  AnalogClock(float _x, float _y) {
    x = _x;
    y = _y;
  }
    
  void getTime() {
    super.getTime();
  }
    
  void display() {
    pushMatrix();
    translate(width/2, height/2);
    image(queen, 0, -270);
    popMatrix();
    
    pushMatrix();
    translate(width/2, height/2);
    rotate(PI/6);
    image(ace, 0, -270);
    if(h > 13) image(king, 0, -270);
    popMatrix();
    
    pushMatrix();
    translate(width/2, height/2);
    rotate(PI/3);
    image(two, 0, -270);
    popMatrix();
    
    pushMatrix();
    translate(width/2, height/2);
    rotate(PI/2);
    image(three, 0, -270);
    popMatrix();
    
    pushMatrix();
    translate(width/2, height/2);
    rotate(2*PI/3);
    image(four, 0, -270);
    popMatrix();
    
    pushMatrix();
    translate(width/2, height/2);
    rotate(5*PI/6);
    image(five, 0, -270);
    popMatrix();
    
    pushMatrix();
    translate(width/2, height/2);
    rotate(PI);
    image(six, 0, -270);
    popMatrix();
    
    pushMatrix();
    translate(width/2, height/2);
    rotate(-5*PI/6);
    image(seven, 0, -270);
    popMatrix();
    
    pushMatrix();
    translate(width/2, height/2);
    rotate(-2*PI/3);
    image(eight, 0, -270);
    popMatrix();
    
    pushMatrix();
    translate(width/2, height/2);
    rotate(-PI/2);
    image(nine, 0, -270);
    popMatrix();
    
    pushMatrix();
    translate(width/2, height/2);
    rotate(-PI/3);
    image(ten, 0, -270);
    popMatrix();
    
    pushMatrix();
    translate(width/2, height/2);
    rotate(-PI/6);
    image(jack, 0, -270);
    popMatrix();
    
    //時
    pushMatrix();
    translate(width/2, height/2);
    rotate((h + m/60.0) % 12 * TWO_PI/12);
    strokeWeight(8);
    stroke(0);
    line(0, 0, 0, -90);
    popMatrix();
    //分
    pushMatrix();
    translate(width/2, height/2);
    rotate((m + s/60.0) * TWO_PI/60);
    strokeWeight(4);
    stroke(0);
    line(0, 0, 0, -120);
    popMatrix();
    //秒
    pushMatrix();
    translate(width/2, height/2);
    rotate(s * TWO_PI/60);
    strokeWeight(1);
    stroke(255, 0, 0);
    line(0, 0, 0, -135);
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

                
