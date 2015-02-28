
class Block {
  TColor c, c_target, c_prev;
  float change_rate, x, y, w, h, t;
  boolean changing = false;
  Vec2D speed;
  
  Block(TColor c_,float x_,float y_,float w_,float h_) {
    c = c_;
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    change_rate = 0.1;
    speed = new Vec2D(random(-2,2),random(-2,2));
  }
  
  // draw an ellipse to the screen
  void render() {
    pushMatrix();
    translate(x,y);
    fill(c.toARGB());
    ellipse(0,0,w,h);
    popMatrix();
  }
  
  void update() {
    // simple motion with reflection from walls
    x += speed.x;
    y += speed.y;
    if (x > width || x < 0) {
      speed.x = -1*speed.x;
    }
    if (y > height || y < 0) {
      speed.y = -1*speed.y;
    }
    // if we need to blend to a new colour
    if(changing) {
      c = c_prev.blend(c_target,t);
      t += change_rate;
      float c_dist = c.distanceToHSV(c_target);
      if(c_dist<0.01){
        changing = false;
      }
    }
  }
  
  // change colour
  void change(TColor c_target_) {
    c_target = c_target_;
    c_prev = c;
    t = 0;
    changing = true;
  }
}

