
//3 ellipses on a timer

int savedTime;
int totalTime = 1000;
float x;
float y;

Circle circle;

void setup() {
  size(200,200);
  background(0);
  circle = new Circle(5000);
  circle.start();
    size(200,200);
  background(255);
  stroke(0);
   savedTime = millis();
  fill(175);
}

void draw() {
  if (circle.isFinished()) {
    background(random(255));
    circle.start();
    
    x = random(width);
  y = random(height);
   int passedTime = millis() - 8*savedTime;
  if (passedTime > totalTime){
 
    fill(175);
    ellipseMode(CENTER);
    ellipse(x,y,8,8);
    ellipse(x-8,y,8,8);
    ellipse(x+8,y,8,8);
  }
}
  
}

class Circle {
 
  int savedTime; // When Timer started
  int totalTime; // How long Timer should last
  
  Circle(int tempTotalTime) {
    totalTime = tempTotalTime;
  }
  
  // Starting the timer
  void start() {
    savedTime = millis(); 
  }
  

  boolean isFinished() { 

    int passedTime = millis()- savedTime;
    if (passedTime > totalTime) {
      return true;
    } else {
      return false;
    }
  }
}
  
