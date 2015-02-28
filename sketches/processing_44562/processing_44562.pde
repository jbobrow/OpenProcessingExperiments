
//  R.A. Robertson 2011, "Particle Chain."
//  Credit to Kim Asendorf http://openprocessing.org/visuals/?visualID=3520
//  Credit "bouncy_bubbles" (http://processing.org/learning/topics/bouncybubbles.html)

float cp1X, cp1Y, cp2X, cp2Y, endX, endY;
float distCP, cp1XV = 0, distX, distY, range = 200;
float driftX, driftY, rate = .002, freq, amp;
boolean toggleLoop = true;

Ball[] myBall;
int ballAmount = 7;  // Line: n > 1; Curve: n > 3; Bez: ((n > 0) * 3) + 1 
float[] randX = new float[ballAmount];
float[] randY = new float[ballAmount];
int distance = 150;
float distBalls, lineWeight, fr;
int d = 20;  // Diameter.

void setup() {
  size(800, 500);
//  size(screen.width, screen.height);
  background(255);
  fill(0);
  smooth();

  //class setup
  myBall = new Ball[ballAmount];
  for (int i = 0; i < ballAmount; i++) {
    myBall[i] = new Ball();
    myBall[i].setup();
    randX[i] = random(-range, range);  // Offset distance endpoint to cp1.
    randY[i] = random(-range, range);
  }
}

void draw() {
//  background(255);
  noStroke();
  fill(255, 120);
  rect(0, 0, width, height);
  
  for (int i = 0; i < ballAmount; i++) {
    myBall[i].collide();  // Physics collision.
    myBall[i].step();
    
//    d = (i == 0) ? 40 : 20;  // Enlarge start node.
    if (i % 3 == 0) {  // Color endpoints.
    fill(255, 0, 0);}
    else if (i % 3 == 1) {fill(0, 255, 0);}  // Color cp1.
    else {fill(0, 0, 255);}  // Color cp2.
       
    myBall[i].drawBall();  // Show nodes.
    
//    stroke(0);  // Straight line through chain.
//    if (i != ballAmount - 1) {  // Do not close start, endpoints.
//    line(myBall[i].x, myBall[i].y,  // Draw line through chain.
//    myBall[(i + 1) % ballAmount].x, myBall[(i + 1) % ballAmount].y);
//    }
        
    noFill();
    stroke(0);
    
//    beginShape();  // Curve(s).
//    for (int curv = 0; curv < ballAmount; curv++) {
//    curveVertex(myBall[curv].x, myBall[curv].y);
//    }
//    endShape();

    beginShape();  // Bezier Vertex.
    vertex(myBall[0].x, myBall[0].y);
    cp1X = myBall[0].x + randX[0] + driftX;
    cp1Y = myBall[0].y + randY[0] + driftY;
    
    noFill();  // Show control point.
    ellipse(cp1X, cp1Y, d/2, d/2);
    
    endX = myBall[1].x;
    endY = myBall[1].y; 
    cp2X = endX + randX[1] + driftX;
    cp2Y = endY + randY[1] + driftY;
        
    for (int bez = 1; bez < ballAmount; bez++) {
    distX = endX - cp2X;
    distY = endY - cp2Y;
    
    if (bez > 1) {                     
            
    cp1X = endX + (distX);
    cp1Y = endY + (distY);
    endX = myBall[bez].x;
    endY = myBall[bez].y; 
    cp2X = endX + randX[bez] + driftX;
    cp2Y = endY + randY[bez] + driftY;

    noFill();  // Show control points.
    ellipse(cp1X, cp1Y, d/2, d/2);

    }
    fill(0);
    ellipse(cp2X, cp2Y, d/2, d/2);
  
    noFill();
    strokeWeight(1);
    bezierVertex(cp1X, cp1Y, cp2X, cp2Y, endX, endY);
}
    endShape();
    
    freq += rate;  // Animate control points.
    amp = 50;
    driftX = (sin(freq) * amp);    
    driftY = (cos(freq) * amp);  
    
     for (int j = 0; j < i; j++) {  // Display proximity indicators.
       if (i != j) {
         distBalls = dist(myBall[i].x, myBall[i].y, myBall[j].x, myBall[j].y);
 
          if (distBalls <= distance) {  // Use this block for proximal lines.
           lineWeight = 50/distBalls;
           stroke(lineWeight * 5, lineWeight, lineWeight);
           strokeWeight(lineWeight);
           line(myBall[i].x, myBall[i].y, myBall[j].x, myBall[j].y);
         }
//         stroke(0, 10);    // Use this instead for global lines.
//         line(myBall[i].x, myBall[i].y, myBall[j].x, myBall[j].y);
//
//         if (distBalls <= d) {  // Simple collision reset.
//           myBall[i].setInc();  // If using, comment out collide().
//           myBall[j].setInc();
//         }
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
      }
    }
  }  
}

/*
Notes:
Exploration of a method for connecting an array of randomly distributed particles 
with lines and curves. Straight lines, curves, and smoothly-joined bezier vertex 
methods are examined.
*/

