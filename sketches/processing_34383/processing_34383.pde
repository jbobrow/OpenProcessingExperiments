
class Ball {  

  float x, y;
  float gravity = 0.2;
  float vel_x;
  float vel_y = 0;
  float eee = 0.8;

  Ball(float xpos, float ypos ) {
    x = xpos;
    y = ypos;
    vel_x = random(-3,3);
  }

  void update() {
    x += vel_x;
    y += vel_y;
    vel_y += gravity;    

    if ((y >= height-10)&&(vel_y > 0)) {
      vel_y *= -eee;
    }
  }

  void fall() {
    update();

    noStroke();
    fill(0, 200, 0);
    ellipse(x, y, 20, 20);
  }
  
  boolean isDead(){
    return((x < -10)||(x > width+10));
  }
}


