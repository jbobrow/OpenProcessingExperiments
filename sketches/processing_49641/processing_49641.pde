
int _num = 100;
Circle[] _circleArr = {};    // an array of circles

void setup() {
  size(900,450);
  background(255);
  smooth();
  // default line/fill
  strokeWeight(1);
  fill(150, 50);
  // draw some circles
  _num = int(30 + random(100));
  drawCircles(_num);
}

void draw() {
  noStroke();
  fill(random(255), 0);
  rect(0,0,width, height);
  // loop through every circle in the array and call updateMe() on it
  for (int i=0; i<_circleArr.length; i++) {
    Circle thisCirc = _circleArr[i];
    thisCirc.updateMe();
  }
}

void mouseReleased() {
  // on pressing mouse, clear and randomise
  _num = int(30 + random(100));
  _circleArr = (Circle[])expand(_circleArr, 0);
  drawCircles(_num);
  //println(_circleArr.length);
}

void drawCircles(int num) {
  // draw _num number of circles at random points
  for (int i=0; i<num; i++) {
    // create an object of type "Circle"
    Circle thisCirc = new Circle();
    thisCirc.drawMe();
    // expand our circle array by adding our new circle to the end
    _circleArr = (Circle[])append(_circleArr, thisCirc);
  }
}


//================================= objects

class Circle {
  // our object’s properties
  float x, y;
  float radius;
  color linecol, fillcol; 
  float alph;
  float xmove, ymove;
  
  // our object’s "constructor"
  Circle () {
    x = random(width);
    y = random(height);
    radius = random(50) + 10;
    linecol = int(random(255));  // just the greys
    fillcol = int(random(255));
    alph = random(255);
    xmove = random(6) - 3;  // gives random number between -5 and 5
    ymove = random(6) - 3;
  }
  
  // method - render me to creen
  void drawMe() {
    noStroke(); 
    fill(fillcol, 2);
    ellipse(x, y, radius*2, radius*2);
  }
  
  // method - called on the frameloop
  void updateMe() {
    x += xmove;
    y += ymove;
    // wrap it if if goes offscreen
    if (x > (width+radius)) { x = 0 - radius; }
    if (x < (0-radius)) { x = width+radius; }
    if (y > (height+radius)) { y = 0 - radius; }
    if (y < (0-radius)) { y = height+radius; }
    
    // basic collision detection
    // loop through all other circles and see if they are intersecting
    // boolean touching = false;
    
    for (int i=0; i<_circleArr.length; i++) {
      Circle otherCirc = _circleArr[i];
      if (otherCirc != this) {    // don't test against ourself
        // calculate the distance between them
        float dis = dist(x, y, otherCirc.x, otherCirc.y);
        float overlap = dis - radius - otherCirc.radius;
        if (overlap < 0) {   
          // draw a circle of the intersect
          // first work out the central point between our two touching circs
          float intx, inty;
          if (x < otherCirc.x) {
            intx = x + (otherCirc.x - x)/2;
          } else {
            intx = otherCirc.x + (x - otherCirc.x)/2;
          }
          if (y < otherCirc.y) {
            inty = y + (otherCirc.y - y)/2;
          } else {
            inty = otherCirc.y + (y - otherCirc.y)/2;
          }
          stroke(0, 5);
          noFill();
          overlap *= -3;  // make it into a positive number
          ellipse(intx, inty, overlap, overlap);
        }
      }
    }
    
    drawMe();
  }
}
    
  

