
Branch b;

void setup() {
  size(400,400);
  smooth();
  
  b = new Branch(width/2, height, random(-PI/4, PI/4), 100, 6);
  noLoop();
}
 
void draw() {
  color bc = color(255, 255, 220);
  background(bc);  
  b. reset();
}

void keyPressed() {
  if ( key == 'n') {
    redraw();
    b.yoffset(random(1000));
    b.seed(millis());
  }
}


//----------------------------------------------------------
class Branch {
  float x, y;
  float theta;
  float angle;
  float yoffset, xoffset;
  int high;
  int seed;
  float maxLevel;
  int depth;
  
  color trunk = color(50, 60, 40);
  color leaves = color(255, 100, 120);
  
  Branch(float x_, float y_, float angle_, int high_, int d_) {
    x = x_;
    y = y_;
    angle = angle_;
    high = high_;
    depth = d_;
    yoffset = 0;
    xoffset = 0;
    seed = 5;
    maxLevel = 6.0;
  }
  
  void reset() {
    translate(x, y);
    yoffset += 0.005;
    randomSeed(seed);
    stroke(lerpColor(leaves, trunk, depth/maxLevel));
    branches(high, depth);
  }
  
  void branches(int high, int depth) {
    stroke(lerpColor(leaves, trunk, depth/maxLevel));    // 0.0 - 1.0
    strokeWeight(map(high, 0, 120, 1, 10));
    line(0, 0, 0, -high);
    translate(0, -high);
    high *= 0.7f;
    xoffset += 0.1;
    
    if(depth > 0) {
      int n = int (random (1, 4));
      for( int i = 0; i < n; i++) {
        float theta = map( noise( xoffset + i, yoffset), 0, 1, -PI/4, PI/4);
        if (n % 2 == 0) theta += 1;
        
        pushMatrix();
        rotate(theta);
        branches(high, depth - 1);
        popMatrix();
        
        pushMatrix();
        rotate(theta);
        branches(high, depth - 1);
        popMatrix();
      }
    }
  }
  
  int high() {
    return high;
  }
  float yoffset(float y) {
    return yoffset;
  }
  int seed(int s) {
    return seed;
  }
  float getX() {
    return int(x + high * cos(theta/57.3));
  }
  float getY() {
    return int(y + high * sin(theta/57.3));
  }
}

