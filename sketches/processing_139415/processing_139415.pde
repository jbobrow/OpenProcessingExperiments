
PVector vA, vB, vMouse;

PFont f;

//////////////////////////////////////////////////////////////// SETUP
void setup() {
  size(280, 280);
  smooth();  
  //noLoop();
  
  
  vA = new PVector( random(width), 40+random(height-40) );
  vB = new PVector( random(width), 40+random(height-40) );
  vMouse = new PVector( 0.0, 0.0 );
  
  f = createFont("Courier", 72, true);
  
}


///////////////////////////////////////////////////////////////// DRAW
void draw() {
  
  vMouse.set(mouseX, mouseY);
  
  pushStyle();
  fill(0);
  textFont(f);
  textAlign(LEFT);
  textSize(12);
  if ( ccw(vA, vB, vMouse) == -1 ) {
    background(0, 255, 0, 60);
    text("COUNTERCLOCKWISE", 10, 20);
  } else if ( ccw(vA, vB, vMouse) == 1 ){
    background(255, 0, 0, 60);
    text("CLOCKWISE", 10, 20);
  } else {
    background(255, 255, 0, 60);
    text("COLLINEAR", 10, 20);
  }
  
  text("A", vA.x + 10 , vA.y + 10);
  text("B", vB.x + 10 , vB.y + 10 );
  text("mouse", vMouse.x + 10 ,vMouse.y + 10 );
  popStyle();

  pushStyle();
  stroke(0);
  fill(0);
  ellipse(vMouse.x, vMouse.y, 5, 5);
  noFill();
  ellipse(vA.x, vA.y, 5, 5);
  ellipse(vB.x, vB.y, 5, 5);
  popStyle();
}


//////////////////////////////////////////////////// COUNTER CLOCK WISE
int ccw(PVector a, PVector b, PVector c) {
  int area2 = int( (b.x - a.x)*(c.y-a.y) - (b.y - a.y)*(c.x - a.x) );
  if       (area2 < 0) return -1; // clockwise (ccw in Processing - y flipped)
  else if  (area2 > 0) return  1; // counter clock wise (cw in Processing - y flipped)
  else                 return  0; // collinear
}



