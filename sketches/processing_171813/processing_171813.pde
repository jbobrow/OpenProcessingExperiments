
Circle[] circles_ = {};

final int minRadius = 1;
final int maxRadius = 500;

void setup() {
  size(600, 400);
  colorMode(HSB, 255);
  background(120, 0, 100);
  strokeWeight(1);
  fill(150, 50);
  createCircles();
  frameRate(60);
}

void createCircles() {
  for(int i=0; i<3; i++) {
    Circle c = new Circle();
    circles_ = (Circle[])append(circles_, c);
  }
}

void draw() {
  background(255, 0, 0, 0);
  for(Circle c : circles_) {
    c.draw();
  }
}

void mouseReleased() {
  createCircles();
}

class Circle {
  float x,y,vx,vy,ax,ay;
  float radius;
  color linecol, fillcol;
  float alpha;
  boolean isOnWindow;
  final float lineWidth = 10;
  
  Circle() {
    radius = random(maxRadius - minRadius) + minRadius;
    linecol = color(random(255), random(255), random(255));
    fillcol = color(random(50) + 130, 100, 255);
    initParam();
  }
  
  void initParam() {
    x = random(displayWidth);
    y = random(-50);
    vx = 0;
    vy = 0;
    ax = 0;
    ay = radius * 9.8 * 0.001;
    alpha = random(255);
    
    isOnWindow = random(10) > 9; // random select
    if(isOnWindow) {
      ay = 0.01;
      y = random(displayHeight);
    }
  }
  
  void draw() {
    updateParam();
    fill(fillcol, alpha);
    ellipse(x, y, radius*2, radius*2 + vy);
  }
  
  void updateParam() {
    ax = (noise(frameCount) - 0.5) * (isOnWindow ? 0.001 : 0.1);
    vy += ay;
    vx += ax;
    y += vy;
    x += vx;
    
    //reset position
    if(y > displayHeight + radius) {
      initParam();
    }
  }
}
