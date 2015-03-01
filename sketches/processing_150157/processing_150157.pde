
// Free Will by John Clavin
// May 2014

PFont jcFont;
Fader fader;
Indicator indicator1, indicator2;
color iColor1 = color(230, 0, 0);
color iColor2 = color(0, 230, 0);
int fudgeFactor = 463;
int numBalls = 600;
Ball[] balls;

void setup() {
  size(950, 640);
  frameRate(30);
  noSmooth();
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  jcFont = createFont("Serif", 14);
  textFont(jcFont);
  initBalls();
  fader = new Fader();
  indicator1 = new Indicator(120, 230, iColor1);
  indicator2 = new Indicator(120, 105, iColor2);
  indicator1.name("ORIGINAL IDEAS");
  indicator2.name("EVIRONMENTAL INFLUENCES");
}

void draw() {
  ballSwarm();
  background(240);
  for (int i = 0; i < numBalls; i++) {
    Ball a = balls[i];
    fill(a.currentColor);
    ellipse((int)a.x, (int)a.y, 16, 16);
  }
  fader.drawFader();
  indicator1.drawIndicator();
  indicator2.drawIndicator();
}

void mousePressed() {
  fader.pressed();
}
  
void mouseDragged() {
  fader.dragged(mouseY);
}
  
void mouseReleased() {
  fader.released();
}

void ballSwarm() {
  for (int i = 0; i < numBalls; i++) {
    Ball b = balls[i];
    b.stepToCenter(width/2, height/2, 0.003); // .003
    b.takeStep(b.ballEnemy, -1.38); // -1.4, -1.38
    b.takeStep(b.ballFriend, 2.00); // 2.0
    b.applyVelocity(2.20); // 2.2
    b.timeColor();
    if(int(random(100000)) < (int(height - fader.knob_posY/3) - fudgeFactor)) {
      setRelationship(b);
      b.changeColor();
      indicator1.flash();
      // print("  "+(int(height - fader.knob_posY/3) - fudgeFactor));
    }
    if (b.x < 0 || b.x >= width || b.y < 0 || b.y >= height) {
      setRelationship(b);
      indicator2.flash();
    }
  }
}


void initBalls() {
  balls = new Ball[numBalls];
  for (int i = 0; i < balls.length; i++) {
    balls[i] = new Ball(random(width), random(height));
  }
  setRelationships();
}

void setRelationships() {
  for (int i = 0; i < numBalls; i++) {
    setRelationship(balls[i]);
  }
}

void setRelationship(Ball c) {
  int j = (int)random(numBalls);
  int k = (int)random(numBalls);
  c.ballFriend = balls[j];
  c.ballEnemy = balls[k];
}

class Ball {
  Ball ballFriend, ballEnemy;
  float x, y, vx, vy;
  int rColor = int(random(30, 120));
  int gColor = int(random(30, 120));
  int bColor = int(random(30, 120));
  color mainBall = color(rColor, gColor, bColor);
  color freeWillBall = color(230, 0, 0);
  color currentColor = mainBall;
  int colorTimer = 0;
  boolean colorChangeFlag = false;

  Ball(float _x, float _y) {
    x = _x;
    y = _y;
  }
  
  void stepToCenter(float xCenter, float yCenter, float stcAmount) {
    x = (x*(1-stcAmount) + xCenter*stcAmount);
    y = (y*(1-stcAmount) + yCenter*stcAmount);
  }

  void takeStep(Ball d, float stepSize) {
    float relationshipX = d.x;
    float relationshipY = d.y;
    float angle = atan2(relationshipY - y, relationshipX - x);
    vx += stepSize*cos(angle);
    vy += stepSize*sin(angle);
  }

  void applyVelocity(float amount) {
    x += vx*amount;
    y += vy*amount;
    vx = 0.00;
    vy = 0.00;
  }
  
  void changeColor() {
    currentColor = freeWillBall;
    colorChangeFlag = true;
    colorTimer = 100;
  }
  
  void timeColor() {
    if(colorChangeFlag == true) {
      if(colorTimer > 1) {
        colorTimer --;
      } else {
        currentColor = mainBall;
        colorChangeFlag = false;
      }
    }
  }
}

class Fader {
  
  float knobWidth = 24;
  float knobHeight = 34;
  float faderLineTopX = 120;
  float faderLineTopY = 350;
  float faderLineBotX = 120;
  float faderLineBotY = 550;
  float knob_posX = faderLineBotX;
  float knob_posY = (faderLineBotY - 21);
  String s = "LEVEL OF FREE WILL";
  String id = "johnClavin";
  boolean locked_knob = false;
  
  void drawFader() {
    strokeWeight(2);
    line (faderLineTopX, faderLineTopY, faderLineBotX, faderLineBotY);
    strokeWeight(1);
    fill(0);
    text(s, faderLineBotX, faderLineBotY + 18);
    fill(120);
    rect(knob_posX, knob_posY, knobWidth, knobHeight);
  }
  
  void pressed() {
    if (dist(mouseX, mouseY, knob_posX, knob_posY) < knobWidth/1.50) {
      locked_knob = true;
    }
  }
  void dragged(float mY_pos) {
    if (locked_knob) {
      knob_posY = mY_pos;
    }
    if (knob_posY < (faderLineTopY + 21)) {
      knob_posY = (faderLineTopY + 21);
    }
    if (knob_posY > (faderLineBotY - 21)) {
      knob_posY = faderLineBotY - 21;
    }
  }
  void released() {
    locked_knob = false;
  }
}

class Indicator {
  float x, y;
  String indicatorLabel;
  color iColor;
  int iFlashTimer = 0;
  Indicator( float _x, float _y, color _c) {
    x = _x;
    y = _y;
    iColor = _c;
  }
  
  void drawIndicator() {
    fill(180);
    ellipse(x, y, 18, 18);
    if(iFlashTimer > 1) {
      fill(iColor);
      iFlashTimer --;
    } else {
      fill(240);
    }
    ellipse(x, y, 13, 13);
    fill(0);
    text(indicatorLabel, x, y + 22);
  }
  
  void flash() {
    iFlashTimer = 3;
  }
  
  void name(String n) {
    indicatorLabel = n;
  }
}



