
class Ball {  

  float x, y;
  float gravity = 0.2;
  float vel_x;
  float vel_y = 0;
  float eee = 0.8;
  int C;
      

  Ball(float xpos, float ypos ) {
    x = xpos;
    y = ypos;
    vel_x = random(-3,3);
    C = (int)random(0,5);
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
        
    switch(C){
      case 0:
        fill(0, 200, 0);
        break;
      case 1:
        fill(20, 20,  255);
        break;
      case 2:
        fill(255, 30, 60);
        break;
      case 3:
        fill(255, 90, 20);
        break;
      case 4:
        fill(255, 250, 20);
        break;
    }

    noStroke();
    ellipse(x, y, 20, 20);
  }
  
  boolean isDead(){
    return((x < -10)||(x > width+10));
  }
}


