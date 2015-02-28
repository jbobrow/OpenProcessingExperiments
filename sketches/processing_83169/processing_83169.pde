

float circleLocationX;
float circleLocationY;
float circleRadius = 30;

float rectangleLocationX = 10;
float rectangleLocationY = 10;
float rectangleWidth = 30;
float rectangleHeight = 30;

int numForme = 100;
Forme [] p = new Forme [numForme];

//Wiggler w;

float taille=0;
//------------------------------------------------------------------------------
void setup() {
  size(1500, 900,P2D);
  ellipseMode(CENTER);

  for (int i=0; i<p.length; i++) {
    p[i] = new Forme(random(0.5, 5), random(0.5, 5), (int)random(2));
  }
  smooth();
//  w = new Wiggler();
}
//------------------------------------------------------------------------------
void draw() {
  background(255);
  
//   w.display();
//   w.wiggle();

  for (int i=0; i<p.length; i++) {
    p[i].bouge();
    p[i].decision();
  }



  circleLocationX = width/2;
  circleLocationY = height/2;

  // determine whether collision detected for our new location
  boolean collisionDetected = isCollidingCircleRectangle(circleLocationX, circleLocationY, 
  circleRadius, rectangleLocationX, rectangleLocationY, rectangleWidth, rectangleHeight);

  boolean collisionDetected2 = isCollidingCircleRectangle(circleLocationX, circleLocationY, 
  circleRadius, 430, 75, rectangleWidth, rectangleHeight);

  // draw circle
  if ((collisionDetected == true) || (collisionDetected2 == true)) {
    taille=taille+10;
    //    fill(255, 0, 0);
  }
  else {
    taille=taille+0;
    //    fill(0);
  }
  noStroke();
  fill(0);
  ellipse(circleLocationX, circleLocationY, circleRadius*2.0+taille, circleRadius*2.0+taille);
}

/********************************************************
 isCollidingCircleRectangle()
 
 params:
 circleX - center x coordinate for circle
 circleY - center y coordinate for circle
 radius  - radius of circle
 rectangleX - top left corner X coordinate
 rectangleY - top left corner Y coordinate
 rectangleWidth - width of rectangle
 rectangleHeight - and the height
 
 returns boolean - whether the two shapes are colliding
 
 code adapted from:
 http://stackoverflow.com/questions/401847/circle-rectangle-collision-detection-intersection
 adapted by: Jonathan Cecil
 ********************************************************/
boolean isCollidingCircleRectangle(
float circleX, 
float circleY, 
float radius, 
float rectangleX, 
float rectangleY, 
float rectangleWidth, 
float rectangleHeight)
{
  float circleDistanceX = abs(circleX - rectangleX - rectangleWidth/2);
  float circleDistanceY = abs(circleY - rectangleY - rectangleHeight/2);

  if (circleDistanceX > (rectangleWidth/2 + radius)) { 
    return false;
  }
  if (circleDistanceY > (rectangleHeight/2 + radius)) { 
    return false;
  }

  if (circleDistanceX <= (rectangleWidth/2)) { 
    return true;
  }
  if (circleDistanceY <= (rectangleHeight/2)) { 
    return true;
  }

  float cornerDistance_sq = pow(circleDistanceX - rectangleWidth/2, 2) +
    pow(circleDistanceY - rectangleHeight/2, 2);

  return (cornerDistance_sq <= pow(radius, 2));
}

class Forme {
  float centreX;
  float centreY;
  float directionX = 1;
  float directionY = 1;
  float zoom;
  float speed;
  int choix;
  float r =0;
  float diameter = 30;  
//----------------------------------------------------------
  Forme(float _zoom, float _speed, int _choix) {
    zoom = _zoom;
    speed = _speed;
    choix = _choix;
    centreX = random(width);
    centreY = random(height);
  }
//----------------------------------------------------------
  void decision() {
    if (choix == 0) {
      forme1();
    }
  }
//----------------------------------------------------------
  void bouge() {
  if (centreX > width) { 
    centreX = width;
    directionX *= -1;
  }
  if (centreX < 0) {
    centreX = 0;
    directionX *= -1;
  }
  else {
    centreX += speed * directionX;
  }
  if (centreY > height) { 
    centreY = height;
    directionY *= -1;
  }
  if (centreY < 0) {
    centreY = 0;
    directionY *= -1;
  }
  else {
    centreY += speed * directionY;
  }
  }
  
  void forme1() {
    pushMatrix();

    translate(centreX, centreY);
    

    fill (0);
    noStroke();                
    ellipse(rectangleLocationX, rectangleLocationY, rectangleWidth, rectangleHeight);
   // rect(rectangleLocationX, rectangleLocationY, rectangleWidth, rectangleHeight);

    popMatrix();
  }
}


//// An object that wraps the PShape
//
//class Wiggler {
//  
//  // The PShape to be "wiggled"
//  PShape s;
//  // Its location
//  float x, y;
//  
//  // For 2D Perlin noise
//  float yoff = 0;
//  
//  // We are using an ArrayList to keep a duplicate copy
//  // of vertices original locations.
//  ArrayList<PVector> original;
//
//  Wiggler() {
//    x = width/2;
//    y = height/2; 
//
//    // The "original" locations of the vertices make up a circle
//    original = new ArrayList<PVector>();
//    for (float a = 0; a < TWO_PI; a+=0.2) {
//      PVector v = PVector.fromAngle(a);
//      v.mult(100);
//      original.add(v);
//    }
//    
//    // Now make the PShape with those vertices
//    s = createShape();
//    s.fill(0);
//    s.noStroke();
//    for (PVector v : original) {
//      s.vertex(v.x, v.y);
//    }
//    s.end(CLOSE);
//  }
//
//  void wiggle() {
//    float xoff = 0;
//    // Apply an offset to each vertex
//    for (int i = 0; i < s.getVertexCount(); i++) {
//      // Calculate a new vertex location based on noise around "original" location
//      PVector pos = original.get(i);
//      float a = TWO_PI*noise(xoff,yoff);
//      PVector r = PVector.fromAngle(a);
//      r.mult(4);
//      r.add(pos);
//      // Set the location of each vertex to the new one
//      s.setVertex(i, r.x, r.y);
//      // increment perlin noise x value
//      xoff+= 0.5;
//    }
//    // Increment perlin noise y value
//    yoff += 0.02;
//  }
//
//  void display() {
//    pushMatrix();
//    translate(x, y);
//    shape(s);
//    popMatrix();
//  }
//}



