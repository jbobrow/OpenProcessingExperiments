

class Ball{
  float x=width/2;
  float y=height/2;
  
  float vx=0;
  float vy=0;
  
  float scalingFactor = 1000;
  
  
  void draw(MSAFluidSolver2D fluidSolver) {
    pushStyle();
    fill(150,100,150,150);
    stroke(0);
    strokeWeight(3);
    int index = fluidSolver.getIndexForNormalizedPosition(x/width,y/height);
    float vy = fluidSolver.v[index]*scalingFactor;
    float vx = fluidSolver.u[index]*scalingFactor;
    ellipse(x,y,30,30);
    popStyle();
    
    x = x+vx;
    y = y+vy;
    checkBounds();
  }
  void checkBounds() {
    if (x < 0) {
      x=0;
      vx = -vx;
    }
    if (y < 0) {
      y=0;
      vy = -vy;
    }
    if (y > height) {
      y=height;
      vy = -vy;
    }
    if (x > width) {
      x=width;
      vx = -vx;
    }
  }
}

