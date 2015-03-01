
/* @pjs font="ForteMT-48.vlw"; */

float diamWhiteBall = 150;
float diamBlackBall = 25; 
float wx, wy, wr;  
Ball[] balls; 
int numBalls = 10;
float mouseDist = 20;  
int frozenBalls = 0;
PFont myFont; 

void setup() {
  size(400, 400); 
  background(0); 
  smooth(); 
  noStroke(); 

  myFont = loadFont("ForteMT-48.vlw");
  textFont(myFont); 
  textSize(18); 

  wx = width/2; 
  wy = height/2;
  wr = width/3;

  balls = new Ball[numBalls]; 
  for (int i = 0; i < numBalls; i++) {
    balls[i] = new Ball();
  }
}

void draw() {
  background(0); 
  noFill(); 
  stroke(255); 
  ellipse(mouseX, mouseY, mouseDist*2, mouseDist*2);
  noStroke();  

  fill(255); 
  float x = wx + cos(radians(frameCount)) * wr;
  float y = wy + sin(radians(frameCount)) * wr;
  ellipse(x, y, diamWhiteBall, diamWhiteBall); 

  for (int i = 0; i < numBalls; i++) {
    balls[i].drawBall();
  }
    
  fill(165);
  text("Hits: " + str(frozenBalls), 10, textAscent()+5); 
}

class Ball {
  float x, y; 
  float vx, vy; 
  int freeze = 0; 

  Ball() {
    initBall();
  }

  void updateBall() {
    if (freeze > 0) {
      freeze--;
      if(freeze <= 0){
        frozenBalls--; 
      }
    } else {

      vx += random(-1, 1);     
      vy += random(-1, 1);
      vx *= 0.96;
      vy *= 0.96;  
      x += vx; 
      y += vy; 

      checkWalls();

      if (checkMouseDist()) {
        vx += cos(-getMouseAngle()); // * 2;
        vy += sin(-getMouseAngle()); // * 2;
      }
    }
  }

  void drawBall() {
    updateBall();   
    if (freeze > 0) {  
      fill(255, 0, 0);
    } else { 
      fill(0);
    } 
    ellipse(x, y, diamBlackBall, diamBlackBall);
  }

  void initBall() {
    x = random(diamBlackBall, width-diamBlackBall);
    y = random(diamBlackBall, height-diamBlackBall);

    vx = 0; 
    vy = 0; 
    freeze = 0;
  }  

  void checkWalls() {
    if (x < diamBlackBall/2) {
      vx *= -1; 
      x = diamBlackBall/2;
    }
    if (x > width - diamBlackBall/2) {
      vx *= -1; 
      x = width - diamBlackBall/2;
    }
    if (y < diamBlackBall/2) {
      vy *= -1; 
      y = diamBlackBall/2;
    }
    if (y > height - diamBlackBall/2) {
      vy *= -1; 
      y = height - diamBlackBall/2;
    }
  }

  boolean checkMouseDist() {
    float d = dist(x, y, mouseX, mouseY); 
    if (d <= mouseDist + diamBlackBall/2) {
      return true;
    } 
    return false;
  }  

  float getMouseAngle() { 
    float angle = atan2(mouseY - y, mouseX - x);
    return angle;
  }

  void freezeBall() {
    if (freeze <= 0) {
      freeze = 500;
      frozenBalls++; 
    }
  }
}

void mouseReleased() {
  for (int i = 0; i < numBalls; i++) {
    if (balls[i].checkMouseDist()) {
      balls[i].freezeBall();
    }
  }
}



