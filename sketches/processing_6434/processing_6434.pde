
class Fly {
  PImage fly;
  PImage fly2;
  float ypos;
  float xpos;
  float speed = 2.0;
  int flyNum;
  int fly_switch = 1;
    
  Fly(float x, float y, int fly_num) {
    fly2 = loadImage("fly2.png");
    fly = loadImage("fly.png");
    xpos = x;
    ypos = y;
    flyNum = fly_num;
  }

  void show() {
    if(fly_switch == 1) {
      image(fly, xpos, ypos);
      fly_switch = 2;
    } else {
      image(fly2, xpos, ypos+6);
      fly_switch = 1;
    }
    speed = random(1.5, 2.5);
    xpos = xpos + speed;
    if(xpos > width) {
      xpos = 0;
      ypos = random(100, 300);
    }
    flypos_tl_x[flyNum-1] = xpos;
    flypos_tl_y[flyNum-1] = ypos;    
  }
  
       
  
}


