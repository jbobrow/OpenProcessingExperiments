
Ball[] ball = new Ball[1000];
int numBalls;

void setup() {
  size(400, 400);
  colorMode(HSB);      //color(hue, saturation, brightness)
  numBalls = 3;
  for (int i = 0; i < numBalls; i++) {
    ball[i] = new Ball();
  }
  noStroke();
  smooth();
}

boolean canAdvance = false;
int countFrozen;

void draw() {
  background(0);
  if (canAdvance == false) {
    for (int i = 0; i < numBalls; i++) {
      bounce(i);
      revive(i);
      ball[i].make();
      ball[i].move();
    }
  }
  checkIfWon();
  if (canAdvance) {
    winScreen();
  }
}

void bounce(int _i) {
  for (int i = 0; i < numBalls; i++) {
    if (i != _i && sqrt(sq(ball[_i].xpos-ball[i].xpos)+
      sq(ball[_i].ypos-ball[i].ypos)) <=
      ball[_i].siz/2+ball[i].siz/2) {

      float storeXspeed = ball[i].xspeed;
      float storeYspeed = ball[i].yspeed;
      ball[i].xspeed = ball[_i].xspeed;
      ball[i].yspeed = ball[_i].yspeed;
      ball[_i].xspeed = storeXspeed;
      ball[_i].yspeed = storeYspeed;
      determineCollision(i, _i);
    }
  }
}

void revive(int _i) {
  for (int i = 0; i < numBalls; i++) {
    if (i != _i && sqrt(sq(ball[_i].xpos-ball[i].xpos)+
      sq(ball[_i].ypos-ball[i].ypos)) <=
      ball[_i].siz/2+ball[i].siz/2 + sqrt(sq(ball[i].xspeed-ball[_i].xspeed) + sq(ball[i].yspeed-ball[_i].yspeed))) {

      if (ball[i].isMoving == true &&
        ball[_i].isMoving == false) {

        ball[_i].isMoving = true;
        countFrozen--;
        float storeXspeed = ball[i].xspeed;
        float storeYspeed = ball[i].yspeed;
        ball[i].xspeed = ball[_i].xspeed;
        ball[i].yspeed = ball[_i].yspeed;
        ball[_i].xspeed = storeXspeed;
        ball[_i].yspeed = storeYspeed;
        determineCollision(i, _i);
      }
    }
  }
}

void determineCollision(int i, int _i) {
  if (ball[i].xspeed > 0 && ball[_i].xspeed > 0 ||
    ball[i].xspeed < 0 && ball[_i].xspeed < 0) {
    if (ball[i].xspeed > 0) {
      if (ball[i].xpos > ball[_i].xpos) {
        ball[_i].xspeed *= -1;
      }
      else {
        ball[i].xspeed *= -1;
      }
    } 
    else {
      if (ball[i].xpos > ball[_i].xpos) {
        ball[i].xspeed *= -1;
      }
      else {
        ball[_i].xspeed *= -1;
      }
    }
  }
  if (ball[i].yspeed > 0 && ball[_i].yspeed > 0 ||
    ball[i].yspeed < 0 && ball[_i].yspeed < 0) {
    if (ball[i].yspeed > 0) {
      if (ball[i].ypos > ball[_i].ypos) {
        ball[_i].yspeed *= -1;
      }
      else {
        ball[i].yspeed *= -1;
      }
    } 
    else {
      if (ball[i].ypos > ball[_i].ypos) {
        ball[i].yspeed *= -1;
      }
      else {
        ball[_i].yspeed *= -1;
      }
    }
  }
}

void mousePressed() {
  for (int i = 0; i < numBalls; i++) {
    ball[i].check();
  }
}

void checkIfWon() {
  if (countFrozen == numBalls) {
    canAdvance = true;
  } 
  else {
    canAdvance = false;
  }
}

void winScreen() {
  background(0);
  textSize(30);
  textAlign(CENTER);
  fill(200);
  text("Level Up!", width/2, height/3);
  text("- press space to advance -", width/2, height/2);
}

void keyReleased() {
  if (canAdvance == true) {
    if (key == ' ') {
      numBalls++;
      ball[numBalls-1] = new Ball();
      for (int i = 0; i < numBalls; i++) {
        ball[i].isMoving = true;

        ball[i].siz = random(20, 60);
        ball[i].xspeed = random(-4, 4);
        ball[i].yspeed = random(-4, 4);
        ball[i].xpos = random(ball[i].siz/2, width-ball[i].siz/2);
        ball[i].ypos = random(ball[i].siz/2, height-ball[i].siz/2);
        ball[i].c = random(25, 230);
      }
      countFrozen = 0;
    }
    canAdvance = false;
  }
}

void changeSpeed() {
}

public class Ball {
  float xpos;
  float ypos;
  float siz;
  float xspeed;
  float yspeed;
  float c;        //color
  boolean isMoving;

  public Ball() {
    siz = random(20, 60);
    xspeed = random(-4, 4);
    yspeed = random(-4,4);
    xpos = random(siz/2, width-siz/2);
    ypos = random(siz/2, height-siz/2);
    c = random(25, 230);      //random hue not red
    isMoving = true;
  }

  public void make() {
    if (isMoving) {
      stroke(c, 255, 255);
    } 
    else {
      stroke(0, 255, 255);
    }
    strokeWeight(siz);
    point(xpos, ypos);
  }

  public void move() {
    if (isMoving) {
      xpos+=xspeed;
      ypos+=yspeed;
      if (xpos <= siz/2 || xpos >= width-siz/2) {
        xspeed*=-1;
        c = random(25, 230);
      }
      if (ypos <= siz/2 || ypos >= width-siz/2) {
        yspeed*=-1;
        c = random(25, 230);
      }

    xpos = constrain(xpos, siz/2, width-siz/2);
    ypos = constrain(ypos, siz/2, height-siz/2);
    }
  }

  public void check() {
    if (sqrt(sq(mouseX-xpos)+sq(mouseY-ypos)) <= siz/2) {
        if (isMoving) {
          isMoving = false;
          countFrozen++;
        } else {
          isMoving = true;
          countFrozen--;
        }
    }
  }
}



