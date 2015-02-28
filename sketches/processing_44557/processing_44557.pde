
//  R.A. Robertson 2011.10 ~ www.rariora.org ~
//  Study derived from "collision test" www.kaubonschen.com
//  credit to Kim Asendorf http://openprocessing.org/visuals/?visualID=3520

Ball[] myBall;
int ballAmount = 100;
int distance = 100;
float distBalls, lineWeight, fr;
int d = 2;  // Diameter.
boolean toggleLoop = true;

void setup() {
  size(800, 400);
  //  size(screen.width, screen.height);
  background(255);
  fill(0);
  smooth();

  //class setup
  myBall = new Ball[ballAmount];
  for (int i = 0; i < ballAmount; i++) {
    myBall[i] = new Ball();
    myBall[i].setup();
  }
}

void draw() {
  //  background(255);
  noStroke();
  fill(255, 2.0);
  rect(0, 0, width, height);
  for (int i = 0; i < ballAmount; i++) {
    myBall[i].collide();  // Physics collision.
    myBall[i].step();
    fill(255, 0, 0);
    //    myBall[i].drawBall();  // Optional node display.
    for (int j = 0; j < i; j++) {
      if (i != j) {
        distBalls = dist(myBall[i].x, myBall[i].y, myBall[j].x, myBall[j].y);

        if (distBalls <= distance) {  // Use this block for proximal lines.
          lineWeight = 10/distBalls;
          stroke(lineWeight*5, lineWeight, lineWeight);
          strokeWeight(lineWeight);
          line(myBall[i].x, myBall[i].y, myBall[j].x, myBall[j].y);
        }
        //        stroke(0, 10);  // Use this instead for global lines.
        //        line(myBall[i].x, myBall[i].y, myBall[j].x, myBall[j].y);

        //        if (distBalls <= d) {  // Simple collision reset.
        //          myBall[i].setInc();  // If using, comment out collide().
        //          myBall[j].setInc();

        //        }
      }
    }
  }
}

void mousePressed() {
  if (mouseButton == LEFT) {
    if (toggleLoop) { 
      noLoop(); 
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

//THE CLASS
class Ball {
  float x, y, incX, incY;

  void setup() {
    x = random(width);
    y = random(height);
    setInc();
  }

  //speed
  void setInc() {
    incX = random(-2, 2);
    incY = random(-2, 2);
  }

  //the ball
  void drawBall() {
    noStroke();
    ellipse(x, y, d, d);
  }

  //direction
  void step() {
    if (x >= width - d/2 || x <= 0 + d/2) {
      incX = -incX;
    }
    if (y >= height - d/2 || y <= 0 + d/2) {
      incY = -incY;
    }
    x = x + incX;
    y = y + incY;
  }

  // Optional Collision Physics a la "Bouncy Bubbles."
  float dx, dy, distance, minDist, angle, targetX, targetY, ax, ay;
  float friction = 1.0004, frictionX = friction, frictionY = friction;
  int diameter = d;
  void collide() {
    for (int i = 0; i < ballAmount; i++) {
      dx = myBall[i].x - x;
      dy = myBall[i].y - y;
      distance = sqrt(dx*dx + dy*dy);
      minDist = myBall[i].diameter/2 + diameter/2;
      if (distance < minDist) { 
        angle = atan2(dy, dx);
        targetX = x + cos(angle) * minDist;
        targetY = y + sin(angle) * minDist;
        ax = (targetX - myBall[i].x);
        ay = (targetY - myBall[i].y);
        incX -= ax;
        incY -= ay;
        myBall[i].incX += ax;
        myBall[i].incY += ay;
        incX /= frictionX;
        incY /= frictionY;
        //     int f = frameCount;
        //     println(f + "    " + incX);
      }
    }
  }
}

//www.kaubonschen.com
/*
Notes:
 This excellent sketch, in its original form, makes for a fine
 study in understanding how to not only create a particle system,
 but set up relationships between each particle in the system.
 
 I've taken out some code that was not necessary for simple study's
 sake. I rearranged some things and inadvertently found some
 optimization opportunities.
 
 By default, the original code only draws lines between proximal
 particles as defined by a specified distance. As well as being
 cool, it does make the sketch run faster. I've included an option
 to show all lines globally, with performance penalty and all.
 Reduce particle number to help with speed.
 
 At odds with my desire to have a really simple sketch for study,
 I also wanted to see if I could upgrade the collision detection
 for more realistic physics. So I lifted the collide() method from
 "bouncy_bubbles" (http://processing.org/learning/topics/bouncybubbles.html)
 and integrated it in this sketch. I'm not sure it greatly improves
 the aesthetics, but the performance hit is not bad, and it was a 
 good learning exercise for me.
 
 However, "Bouncing Bubbles" has a runaway effect above a certain 
 particle count and diameter, even in the original code. I added some
 friction to offset this, but it's an imperfect solution.
 */                                                                             
