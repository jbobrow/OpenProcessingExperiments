
class Bullet {

  //physcial properties
  float x = gizmo.x+gizmo.w;
  float y = gizmo.y + gizmo.h/2 ;
  int bullet_width = 10;
  int bullet_height = 10;
  int length = 10;
  color bullet_c = color (20, 20, 20);
  boolean visible = true;
  float vel = 6;

  void draw() {
    if (visible) {
      x = x+vel;
      fill(bullet_c);
      ellipse(x, y, bullet_width, bullet_height);
    }
  }
  
   boolean collide(Human thing) {
    if (!visible || x + bullet_width < thing.x || x > thing.x + thing.w || y + bullet_height < thing.y || y > thing.y + thing.h) {
      return false;
    } 
    else return true;
  }
}


