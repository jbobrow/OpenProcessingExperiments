
class Guy {
  float x;
  float x_speed;
  
  float y;
  float y_speed;
  boolean dead;
  
  
  Guy(float xpos) {
    x = xpos;
    y = 0;
    dead = false;
  }
  
  void forward() {
    if (dead) return;
    x_speed += 0.2;
    if (x_speed > 4.2) x_speed = 4.2;
    return;
  }
  
  void jump() {
    if (dead) return;
    if (y == board.find_floor(x,20)) {
      y_speed = -8;
    }
  }
  
  float doguy() {
    float startx=x;
    float thefloor = board.find_floor(x,20);
    
    
    //see if we need to do some gravity  
    if (y < thefloor) y_speed += .2;
    
    //slow down due to friction and air resistance
    if (x_speed > 0) {
      x_speed -= .1; //0.05 (it's like ice)
      if (x_speed < 0) x_speed = 0;
    }
    
    //x += x_speed;
    y += y_speed;

    
    
    
    
    if (y > thefloor) {
      //println("Below the floor!");
      if (y_speed > 0) y_speed = 0;
      y=thefloor;
    }
    
    //Make sure we're not going to run into a wall
    if (x_speed > 0) {
      if (y > board.find_floor(int(x+x_speed),20)) {
        //key_forward = false;
        x_speed = 0;
      }
    }
    //println(y);
    if (dead == false) {
      if (y >= height) {
        dead = true;
        x_speed = 0;
        y_speed = -12;
        stop_time = millis();
      }
    }
    
    //y = min(thefloor,y);
    //println("doguy, x_speed: " + x_speed);
    return x_speed;
  }
  
  void drawguy() {
    buffer.stroke(255,0,0);
    buffer.fill(240,0,0);
    buffer.rect(x,y-20,20,20);
  }
  
}

