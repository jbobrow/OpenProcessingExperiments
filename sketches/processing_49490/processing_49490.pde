
// create an empty array for 100 MovingCircle objects
MovingCircle[] myCircleArray = new MovingCircle[50];
 
void setup() {
  size(400, 400);
  smooth();
   
  // and actually create the objects and populate the
  // array with them
  for(int i=0; i<myCircleArray.length; i++) {
    myCircleArray[i] = new MovingCircle(20,20,10);  
  }
   
   
}
 
void draw() {
   
  background(300,0,0);
   
  // iterate through every moving circle
  for(int i=0; i<myCircleArray.length; i++) {
     
    myCircleArray[i].update();
    myCircleArray[i].checkCollisions();
    myCircleArray[i].drawCircle();
 
     
  }
   
   
}
 
 
 
 
class MovingCircle {
 
  float x;
  float y;
  float xSpeed;
  float ySpeed;
   
  float circleSize;
 
  MovingCircle(float xpos, float ypos, float csize) {
    x = xpos;
    y = ypos;
    circleSize = csize;
     
    xSpeed = random(-10, 10);
    ySpeed = random(-10, 10);
     
  }
 
  void update() {
    x += xSpeed;
    y += ySpeed; 
  }
   
  void checkCollisions() {
     
    float r = circleSize/2;
     
    if ( (x<r) || (x>width-r)){
      xSpeed = -xSpeed;
    } 
     
    if( (y<r) || (y>height-r)) {
      ySpeed = -ySpeed; 
    }
     
  }
   
  void drawCircle() {
     
    fill(255);
    ellipse(x, y, circleSize, circleSize);
     
  }
   
   
}


