
import java.awt.event.*;

OOR out = new OOR();
obstacles o = new obstacles();
car c = new car();
Road b = new Road();
Menu m = new Menu();
final int screenSize = 600;
int timer;
PFont font;
PImage img;
Minim minim;
AudioPlayer song;
BeatDetect beat;
float kickSize, snareSize, hatSize;

void setup() {
  size(screenSize, screenSize);
  timer = second();
}

void draw() {
  background(100);
  b.travelRoad();
  c.car();
  o.CarObstacle();
  out.OutOfRange();
  m.pause();
}

void keyPressed() {
  if (key == 'p') {
    m.onKeyPressed();
  }
}

void keyReleased() {
  if (key == 'r' || key == 'p') {
    m.onKeyReleased();
  }
}
class Road {
  int offset;
  int move;
  int moveBack;
  int w;
  int h;
  int diff;
  int diff2;
  int diff3;
  int movement;

  Road() {
    this.move = 0;
    this.w = screenSize/60;
    this.h = screenSize/12;
    this.offset = this.h + 10;
  }

  void travelRoad() {
    lightGrass();
    Lane();
    fill(255, 255, 0);
    this.move += 5;
    for (int i = 0; i <= 1; i++) {
      for (int y = -this.offset; y < height; y += this.offset) {
        fill(255, 255, 0);
        strokeWeight(2);
        rect(screenSize/3, y + (move % height), this.w, this.h);
        rect(screenSize*2/3, y + (move % height), this.w, this.h);
        rect(screenSize/2, y + (move % height), this.w, this.h);
        this.movement = y + (move % height) - (screenSize/10) + 25;
        this.diff = (i%2)*screenSize/10+( -i%2 * (screenSize/60));
        this.diff2 = ((i%2)*screenSize/8) + movement;
        this.diff3 = screenSize*4/5 + diff + (screenSize/60);

        b.grassPiece((screenSize/60) + this.diff, (screenSize/30) + this.diff, (screenSize/20) + this.diff, (screenSize/15) + this.diff, (screenSize/12) + this.diff, (screenSize/60)+ this.diff2, (screenSize/33)+this.diff2, (screenSize/20)+this.diff2 );
        b.grassPiece((screenSize/60) + this.diff3, (screenSize/30) + this.diff3, (screenSize/20) + this.diff3, (screenSize/15) + this.diff3, (screenSize/12) + this.diff3, (screenSize/60)+ this.diff2, (screenSize/33)+this.diff2, (screenSize/20)+this.diff2);
      }
    }
    if (this.move > this.offset) {
      this.move = 0;
    }
  }
  void Lane() {
    fill(175);
    rect(screenSize/5-(screenSize/60), 0, screenSize*3/5+(screenSize/60)*2, screenSize);
    strokeWeight(5);
    line(screenSize/5-(screenSize/60), 0, screenSize/5-(screenSize/60), screenSize);
    line(screenSize*4/5+(screenSize/60), 0, screenSize*4/5+(screenSize/60), screenSize);
  }
  void lightGrass() {
    fill(0, 255, 0);
    rect(0, 0, screenSize, screenSize);
  }

  void grassPiece(int x1, int x2, int x3, int x4, int x5, 
  float y1, float y2, float y3) {    
    strokeWeight(1);
    int xpos = (int)random(0, screenSize*2/5);
    fill(0, 200, 0);
    beginShape();
    vertex(x1, y1);
    vertex(x2, y2);
    vertex(x3, y1);
    vertex(x4, y2);
    vertex(x5, y1);  
    vertex(x5, y3);
    vertex(x1, y3);
    endShape(CLOSE);
  }
}
class car {
  int xMove;
  int yMove;
  int xPos;
  float yPos;
  int carWidth;
  float carLength;
  car() {
    this.xMove = 0;
    this.yMove = 0;
  }
  void car() {
    strokeWeight(2);
    fill(186, 0, 0);
    this.xPos = (screenSize*9/16)+this.xMove;
    this.yPos = screenSize/1.2+this.yMove;
    //    img = loadImage("flame.jpg");
    //    image(img, c.xPos, c.yPos+c.carLength, c.carWidth, screenSize/10);
    hood();
    body();
    tires();
    if (keyPressed) {
      if (m.pause == false || m.reset == true) {
        if (keyCode == UP || key == 'w') {
          this.yMove-=3;
        }
        if (keyCode == DOWN || key == 's') {
          this.yMove+=3;
        }
        if (keyCode == LEFT || key == 'a') {
          this.xMove-=3;
        }
        if (keyCode == RIGHT || key == 'd') {
          this.xMove+=3;
        }
      }
    }
  }
  void hood() {
    beginShape();
    vertex(xPos, yPos);
    vertex(xPos+screenSize/60, yPos-screenSize/30);
    vertex(xPos+screenSize/20, yPos-screenSize/30);
    vertex(xPos+carWidth, yPos);
    endShape(CLOSE);
  }

  void tires() {
    fill(0);
    ellipse(xPos-screenSize/120, yPos+screenSize/120, screenSize/60, screenSize/30);
    ellipse(xPos-screenSize/120, yPos+screenSize/9, screenSize/60, screenSize/30);
    ellipse(xPos+screenSize/13, yPos+screenSize/120, screenSize/60, screenSize/30);
    ellipse(xPos+screenSize/13, yPos+screenSize/9, screenSize/60, screenSize/30);
  }

  void body() {
    carWidth = screenSize/15;
    carLength = screenSize/7.5;
    rect(xPos, yPos, carWidth, carLength);
  }
}
class Menu {
  boolean pause;
  boolean reset;
  boolean pPressed;
  Menu() {
    this.reset = false;
    this.pause = false;
    this.pPressed = false;
  }

  void onKeyPressed() {
    if (!this.pPressed) {
      this.pPressed = true;
      this.pause = !this.pause;
    }
  }

  void onKeyReleased() {
    this.pPressed = false;
  }

  void pause() {
    if (this.pause) {
      fill(0, 200);
      rect(screenSize/4, screenSize/4, screenSize/2, screenSize*2/5);
      b.move = 0;
      restart();
    }
  }

  void restart() {
    fill(255);
    rect(screenSize/2-screenSize/8, screenSize/2-screenSize/8, screenSize/4, screenSize/8);
    fill(0);
    textAlign(CENTER);
    textSize(30);
    text("restart", screenSize/2, screenSize/2-screenSize/16);
    textSize(10);
    text("press 'r'", screenSize/2, screenSize/2-screenSize/16+24);

    if (key == 'r') {
      this.reset = !this.reset;
      mouseReleased();
      o.move = -screenSize/5;
    }
    if (this.reset) {
      c.yMove = 0;
      c.xMove = 0;
      c.yPos = screenSize/1.25 + c.yMove;
      c.xPos = (screenSize*16/30) + c.xMove;
      this.pause = false;
      this.reset = !this.reset;
    }
    else {
    }
  }
}
class obstacles {
  int level;
  int lane;
  int appear;
  float move;
  int speed;

  obstacles() {
    this.level = 10;
    this.appear = 0;
    this.randomLane();
    this.lane();
    this.move = 0;
  }

  int randomLane() {
    this.lane = (int)random(1, 5);
    println("Lane = " + this.lane);
    return this.lane;
  }

  void CarObstacle() {
    fill(0, 0, 0);
    this.speed = 0;
    if (m.pause == false || m.reset == true) {
      this.speed = 5;
    }
    Car1();
    //    rect(this.appear - screenSize/20, this.move, screenSize/10, screenSize/10);
    if (this.move == screenSize) {
      this.move = -b.h;
      this.randomLane();
      this.lane();
    }
  }

  int lane() {
    if (this.lane == 1) {
      this.appear = screenSize/6+screenSize/12;
    }
    else if (this.lane == 2) {
      this.appear = screenSize/3+screenSize/12;
    }
    else if (this.lane == 3) {
      this.appear = screenSize/2+screenSize/12;
    }
    else if (this.lane == 4) {
      this.appear = screenSize*2/3+screenSize/12;
    }
    println("Appear=" + this.appear);
    return this.appear;
  }
  void Car1() {
    beginShape();
    vertex(this.appear - screenSize/20, this.move += this.speed);
    vertex(this.appear + screenSize/14, this.move);
    vertex(this.appear + screenSize/14, this.move + screenSize/10);
    vertex(this.appear - screenSize/20, this.move + screenSize/10);
    endShape(CLOSE);
  }
  void Car2() {
    beginShape();
    endShape(CLOSE);
  }
}
class OOR {
  int ticks;
  int time;
  OOR() {
    this.ticks = 0;
    this.time = 1;
  }
  void OutOfRange() {
    fill(255, 0, 0);
    if ((c.xPos + b.w <= screenSize/5 || c.xPos + b.w*3 >= screenSize*4/5)) {
      img = loadImage("crashsign.jpg");
      c.xMove = -1000;
      image(img, 0, 0, screenSize, screenSize);
      fill(0);
      fill(255, 0, 0);
      out.timer();
    }
    else {
    }
  }
  void timer() {
    ticks+= time;
    println(ticks);
    if (ticks == 50) {
      time = 0;
      ticks = 0;
      c.xPos = screenSize/2;
      c.yPos = screenSize/1.25;
      c.xMove = 0;
      c.yMove = 0;
      time = 1;
    }
  }
}
