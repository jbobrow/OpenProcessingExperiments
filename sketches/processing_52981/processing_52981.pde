
class Insane{
  
  PVector pos;
  PVector speed;
  float accel;
  int angle;
  int w, h;
  
  Insane(PVector pos, PVector speed){
    this.pos = pos;
    this.speed = speed;
    this.accel = accel;
    
    w = 10;
    h = 10;
    angle = 0;
  }

  void update(){
    
    angle++;
    if(angle > 360) angle = 0;
    
    accel = 0.5 * cos(radians(angle));
    
    speed.x += accel;
    speed.y += accel;
    pos.x += speed.x;
    pos.y += speed.y;

    
    ellipse(pos.x, pos.y, w, h);
    
    if((width < pos.x) || (pos.x < 0)){
      speed.x *= -1;
    }
    
    if((height < pos.y) || (pos.y < 0)){
      speed.y *= -1;
    }
  }


}

