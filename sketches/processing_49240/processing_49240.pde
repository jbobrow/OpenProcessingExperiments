
class Ball {

  float x;
  float y;
  int r;
  color col;
  boolean hit = false;
  
  Ball(int r_, float x_, float y_, color col_) {
    r = r_;
    x = x_;
    y = y_;
    col = col_;
  }
  
  void display(float x_, float y_) {
    x = x_;
    y = y_;
    
    noStroke();
    if (hit) {
      fill(col);
    } else {
      fill(255);
    }
    ellipse(x, y, r, r);
  }
  
  void hitTest(Ball ball) {
    
    // get larger radius
    float rad = (r > ball.r ? r : ball.r); 
    // "if expressions" are if statements that return a value
    
    if (dist(x, y, ball.x, ball.y) <= rad) {
      ball.hit = true;
      hit = true;
    } else {
      ball.hit = false;
      hit = false;
    }
  }
}

