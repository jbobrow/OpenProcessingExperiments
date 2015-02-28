
// And CURRENT POSITION is 
float x = 0.0;
float y = 0.0;
float easing = 0.2;
// So... Point1 is START POSITION right.
float Point1x = random (50.0, 450.0);
float Point1y = random (50.0, 450.0);
// And Point2 is END POSITION, right.
float Point2x = random (50.0, 450.0);
float Point2y = random (50.0, 450.0);
 
void setup() {
  smooth();
  frameRate(30);
  stroke(255);
  size(500, 500);
  
  // So to start with I put X and Y (Which I think of as CURRENT position) on the same position as Point1. So it starts at Point1 and is trying to go to Point2, right...
  x = Point1x;
  y = Point1y;
  
  // This is just your intro stuff each frame - does not change at all.
  background(180);
  fill(100);
  ellipse(Point1x, Point1y, 2, 2);
  ellipse(Point2x, Point2y, 2, 2);
  
}
 
void draw() {
  // This is now the REMAINDER. So what's LEFT to move - end position minus current position.
  float dx = Point2x - x;
  float dy = Point2y - y;
  
  // And this should be a test to see if it's NOT on final position, right? So we just test if...
  if (abs(x) != abs(Point2x) && abs(y) != abs(Point2y)) {
    // And here... if I remove the * easing it will move to the end in one frame.
    x += dx * easing;
    y += dy * easing;
    
    // And we draw from start until current position, every frame.
    line(Point1x, Point1y, x, y);
    
  } else {
    println("I'm at home!");
    // What does this even do - keep drawing the complete line every frame if we're on end position?
    //line(Point1x, Point1y, Point2x, Point2y);
  }
  
  // This part is added just for fun.
  if(mousePressed == true) { //add some interaction
    Point1x = x;
    Point1y = y;
    Point2x = mouseX;
    Point2y = mouseY;
  }
}
                                
