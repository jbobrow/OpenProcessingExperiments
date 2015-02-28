
//  R.A. Robertson 2011, "Particle Chain."
//  Credit to Kim Asendorf http://openprocessing.org/visuals/?visualID=3520
//  Credit "bouncy_bubbles" (http://processing.org/learning/topics/bouncybubbles.html)

/* This is a submission for bus-tops contest on OpenProcessing.org.
*  Bus-Tops (http://bus-tops.com) is a public art project
*  in London where we have placed 30 monochromatic red LED screens
*  on the roofs of bus shelters across the city. Sketches from
*  OpenProcessing Collections will be selected to be exhibited
*  on these screens.
*  For contest information and example sketches and submission:
*  http://www.openprocessing.org/collections/?collectionID=1337
*/
 
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
int d = 10;  // Diameter.


 
public void setup() {
  size(512, 160);
  frameRate(8);
  background(0); //keep background black (LEDs are brightness based)
  stroke(255,0,0); //LEDs are on the scale of red
  fill(255,0,0);   //LEDs are on the scale of red
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
  fill(0, 10);
//  noStroke();
  rect(0, 0, width, height);
   
  for (int i = 0; i < ballAmount; i++) {
    myBall[i].collide();  // Physics collision.
    myBall[i].step();
     
    if (i % 3 == 0) {  // Color endpoints.
    fill(255, 0, 0, 200);}
    else if (i % 3 == 1) {fill(255, 0, 0, 125);}
    else {fill(255, 0, 0, 75);}
        
    myBall[i].drawBall();  // Show nodes.
         
    noFill();
    stroke(75, 0, 0);
 
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
    fill(255, 0, 0);
    noStroke();
    ellipse(cp2X, cp2Y, d/2, d/2);
   
    noFill();
    stroke(100,0 ,0);
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
           stroke(lineWeight * 500, 0, 0);
           strokeWeight(lineWeight);
           line(myBall[i].x, myBall[i].y, myBall[j].x, myBall[j].y);
         }
       }
     }
 
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
   
  // Collision Physics a la "Bouncy Bubbles."
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
 
                
                                                                
