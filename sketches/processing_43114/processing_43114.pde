

Ball[] balls = new Ball[100];
boolean hasAtLeastOneBall = false;

int lastIndex;
int curIndex = 0;

void setup() {
  size (500, 500);
  ellipseMode(CENTER);
  noStroke();
  smooth();
  colorMode(HSB);

}

void draw() {
  background(255);
  
  for (int i = 0; i < curIndex; i++) {
    Ball b = balls[i];
    b.update();
    b.draw();
  }
}

void mouseDragged() {
  if (hasAtLeastOneBall) {
    balls[lastIndex].setLocation(mouseX, mouseY);
  }
}

void mouseReleased() {
  if (hasAtLeastOneBall) {
    Ball b = balls[lastIndex];
    b.isDragged = false;
    
    float xdiff = mouseX - pmouseX;
    float ydiff = mouseY - pmouseY;
    
    b.setSpeed(xdiff, ydiff);
  }
}

void mousePressed() {

  balls[curIndex] = new Ball (mouseX, mouseY, color(0));
  
  lastIndex = curIndex;
  curIndex += 1;
  
  hasAtLeastOneBall = true;
  
  if (curIndex > balls.length) {
    curIndex = 0;
  }
}

class Ball {
  color c;
  float x, y;
  float diam = 10;
  float xspeed, yspeed;
  
  boolean isDragged;
  
  Ball(float inX, float inY, color inC) {
    x = inX; 
    y = inY;

    c = inC;
    
    isDragged = true;
  }
  
  void setSpeed(float inXspeed, float inYspeed) {
    xspeed = inXspeed;
    yspeed = inYspeed;
  }
  
  void setLocation(float inX, float inY) {
    x = inX; 
    y = inY;
  }
  
  void update() {
    // Here we update our positions and speeds
    
    // If we're being dragged, 
    if (isDragged)
      return;
      
    // We want to gradually reduce the internal speed (momentum) of our ball
    float decay = 0.98;
    xspeed *= decay;
    yspeed *= decay;
    
    yspeed += 0.2;
    x += xspeed;
    y += yspeed;
    
    checkBoundaries();
  }
  
  void checkBoundaries() {
    float radius = diam / 2;
    
    if (x - radius < 0) {
     x = radius;
     xspeed = -xspeed;
    }
    
    if (x + radius > width) {
      x = width - radius;
      xspeed = -xspeed;
    }
    
    if (y - radius < 0) {
     y = radius;
     yspeed = -yspeed;
    }
    
    if (y + radius > height) {
      y = height - radius;
      yspeed = -yspeed;
    }
    
  }
  
  void draw() {
    // Here we draw our circle
    fill(c);
    ellipse(x, y, diam, diam);
  }
}
