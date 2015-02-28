
class ball {
  float x = width/2;
  float y = 0;
  float rad = 100;
  float speed = 1;
  float gravity = 0.1;
  
  int btn_x = 510;
  int btn_y = 10;
  int btn_w = 30;
  int btn_h = 30;
  boolean btn_state = false;
  
  ball(float x, float rad, float gravity) {
    this.x = x;
    this.rad = rad;
    this.speed = speed;
    this.gravity = gravity;
  }
  
  void ball_display() {
    fill(100, 100);
    ellipse(x, y, rad, rad);    
  }
  
  void ball_bounce() {
    y = y + speed;
    speed = speed + gravity;
    if (y > height) {
      speed = speed * -0.95;
    }
    if (btn_state == true) {
      speed = 0;
    }
  }
  
  void button_display() {
    fill(143, 147, 245, 200);
    rect(btn_x, btn_y, btn_w, btn_h);
  }
  
  void button_click() {
    if (mouseX > btn_x && mouseX < btn_x + btn_w && mouseY 
    > btn_y && mouseY < btn_y + btn_h) {
      btn_state = !btn_state;
    }
  }
}

