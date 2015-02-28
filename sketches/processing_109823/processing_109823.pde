
Button controller;
Ball circle;

float locX;
float locY;

void setup() {
  locX = width/2;
  locY = height/2;
  size(800, 800);
  background(255);
  controller = new Button(110, 110, 200, color(200, 200, 200, 60), color(160, 160, 160, 60));
}

void draw() {
  background(255);
  
  circle = new Ball(locX, locY);
  
  circle.draw();

  controller.setup();
  controller.draw();
  
  if (controller.hover()) {
    locX = (map(mouseX, 10, 210, 5, 795));
    locY = (map(mouseY, 10, 210, 5, 795));
    
    fill(100);
    text("ball location: " + locX + "X" + locY, 550, 25);

  }
  else {
  }
    
  fill(0, 0, 0, 50);
  triangle(110, 20, 120, 30, 100, 30); // top arrow
  triangle(110, 200, 120, 190, 100, 190); // bottom arrow
  triangle(200, 110, 190, 100, 190, 120); // right arrow
  triangle(20, 110, 30, 100, 30, 120); // left arrow
   
}
class Ball {
  float locationX = width/2;
  float locationY = height/2;

  Ball(float x, float y) {
    locationX = x;
    locationY = y;
  }
  
  void draw() {
    fill(255, 0, 0);
    ellipse(locationX, locationY, 25, 25); 
  }
}
class Button {
  
  int circleX, circleY; //x and y coordinates
  int circleSize; // width, diameter
  boolean circleOver = false;
  color circleColor, circleHighlight;

  Button(int x, int y, int w, color c, color hc) {
    circleX = x;
    circleY = y;
    circleSize = w;
    circleColor = c;
    circleHighlight = hc;
  }
  
  void setup() {
    ellipseMode(CENTER);
    noStroke();
  }
  
  void draw() {
    update(mouseX, mouseY);
  
    if (circleOver) {
      fill(circleHighlight);
    } 
    else {
      fill(circleColor);
    }
    ellipse(circleX, circleY, circleSize, circleSize);
  }
  
  void update(int x, int y) {
    if ( overCircle(circleX, circleY, circleSize) ) {
      circleOver = true;
    } 
    else {
      circleOver = false;
    }
  }

  boolean overCircle(int x, int y, int diameter) {
    float disX = x - mouseX;
    float disY = y - mouseY;
    if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
      return true;
    }
    else {
      return false;
    }
  }
  
  boolean hover() {
    if (circleOver == true) {
      return true;
    }
    else {
      return false;
    }
  }
}


