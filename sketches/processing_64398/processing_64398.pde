

//  R.A. Robertson 2012.06 Core code derived from "collision test" www.kaubonschen.com
//  credit to Kim Asendorf http://openprocessing.org/visuals/?visualID=3520

Ball[] myBall;
int ballAmount = 25;
int distance = 100;
float distBalls, lineWeight, speed;
boolean toggleLoop = true;
boolean adhere = false;
boolean showCursor;
int clockStart, clockEnd, timeLapse;
float deviance, cpX, cpY;  // For bezier connector lines.

void setup() {
//  frame.setTitle("River of Souls");
//  frame.setResizable(true);
  size(900, 600);
//  float vertical = 640, aspect = 16.0 / 9.0;
//  size(int(vertical * aspect), int(vertical));
//  size(screen.width, screen.height);
  frameRate(16);
  background(0);
  smooth();

  //class setup
  myBall = new Ball[ballAmount];
  for (int i = 0; i < ballAmount; i++) {
    myBall[i] = new Ball();
    myBall[i].setup();
  }
}

void draw() {
  noStroke();
  fill(0, 18);
  rect(0, 0, width, height);
  if (!showCursor) { noCursor(); }
  else { cursor(); showCursor = false; }
  
  for (int i = 0; i < ballAmount; i++) {
    stroke(100, 10, 200, 10);
    strokeWeight(2);
    fill(100, 10, 200, 5);
    myBall[i].drawBall();
    myBall[i].step();
    myBall[i].separate();  // Physics collision and separation.
//    deviance = random(-30, 30);  // for bezier connectors.
          
    for (int j = 0; j < ballAmount; j++) {
      if (i != j) {
        distBalls = dist(myBall[i].x, myBall[i].y, myBall[j].x, myBall[j].y);
        
        // Draw connector lines.
        if (distBalls <= distance + 50) {
          lineWeight = 50/distBalls;
          stroke(lineWeight*200, lineWeight, lineWeight, 6);
          line(myBall[i].x, myBall[i].y, myBall[j].x, myBall[j].y);  // Simple lines.

//          cpX = (lerp(myBall[i].x, myBall[j].x, random(.5, 1)));  // Bezier block...
//          cpY = (lerp(myBall[i].y, myBall[j].y, random(.5, 1)));  // (cool, but costly).
//          bezier(myBall[i].x, myBall[i].y,
//                 cpX + deviance, cpY + deviance,
//                 cpX + deviance, cpY + deviance,
//                 myBall[j].x, myBall[j].y);
                 
//          stroke(lineWeight*200, lineWeight, lineWeight, 6);
        }

        //  Adhesion.
        if (distBalls <= myBall[i].d/2 + myBall[j].d/2) {
          
          // Adhesion & timer setup.
          adhere = true;  // (Connect this w/separate() conditional.)
          if (clockStart == 0) {
            clockStart = millis();
          }

          //  Adhesion: average directions.
          myBall[j].incX = (myBall[j].incX + myBall[i].incX) / 2;
          myBall[j].incY= (myBall[j].incY + myBall[i].incY) / 2;
          myBall[i].incX = (myBall[j].incX + myBall[i].incX) / 2;
          myBall[i].incY= (myBall[j].incY + myBall[i].incY) / 2;
          
          // Adhesion: duration timer and disengagement directives.
          timeLapse = millis() - clockStart;
          clockEnd = int(random(50, 20000));
          if (timeLapse >= clockEnd) {
            clockStart = 0;
            adhere = false;
            myBall[i].setInc();
            myBall[j].setInc();
          }
        }
        strokeWeight(lineWeight);
      }
    }
    
    //  Inner glow.
    for (int k = 0; k < 14; k++) {
      bezier(myBall[i].x, myBall[i].y, 
      myBall[i].x + random(-50, 50), myBall[i].y + random(-50, 50), 
      myBall[i].x + random(-50, 50), myBall[i].y + random(-50, 50), 
      myBall[i].x, myBall[i].y);
    }
  }
//  println(frameRate);
}


/* ========= Class ========== */

class Ball {
  float x, y, incX, incY;
  float speed = 2;
  int d = int(random(10, 100));
  void setup() {
    x = random(d, width - 2 * d);
    y = random(d, height - 2 * d);
    setInc();
  }

  // Speed
  void setInc() {
    incX = random(-speed, speed);
    incY = random(-speed, speed);
  }

  // Object
  void drawBall() {
    ellipse(x, y, d, d);
  }

  // Boundaries, with some allowance for resizable frame.
  void step() {
    if (x >= width - d/2) {
      x = width - d/2;
      incX = -incX;
    }      
    if (x <= 0 + d/2) {
      incX = -incX;
    }
    if (y >= height - d/2) {
      y = height - d/2;
      incY = -incY;
    }
    if (y <= 0 + d/2) {
      incY = -incY;
    }
    x += incX;
    y += incY;
    incX = constrain(incX, -speed, speed);  // This is needed in case Balls initialize inside
    incY = constrain(incY, -speed, speed);  // minDist (below). Otherwise they exceed speed.
  }

  // Collision physics a la "Bouncy Bubbles"
  // http://processing.org/learning/topics/bouncybubbles.html
  float dx, dy, distance, minDist, angle, targetX, targetY, ax, ay;
  int ballRadius = d/2;
  void separate() {
    for (int i = 0; i < ballAmount; i++) {
      dx = myBall[i].x - x;
      dy = myBall[i].y - y;
      distance = sqrt(dx*dx + dy*dy);
      minDist = myBall[i].ballRadius + ballRadius;
      if (distance < minDist && adhere == false) {
        angle = atan2(dy, dx);
        targetX = x + cos(angle) * minDist;
        targetY = y + sin(angle) * minDist;
        ax = (targetX - myBall[i].x);
        ay = (targetY - myBall[i].y);
        incX -= ax;
        incY -= ay;
        myBall[i].incX += ax;
        myBall[i].incY += ay;
      }
    }
  }
}

/* =========== UI ============= */

void mousePressed() {
  if (mouseButton == LEFT) {
    if (toggleLoop) { 
      noLoop();
      cursor();
      toggleLoop = false;
    }
    else { 
      loop(); 
      toggleLoop = true;
    }
  }
  if (mouseButton == RIGHT) {
    setup();
  }
}

void mouseMoved() {
  showCursor = true;
}
