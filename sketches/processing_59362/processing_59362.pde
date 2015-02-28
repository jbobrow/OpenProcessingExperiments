
class Body {
  int bx=30;
  int by=180;
  float easing = 0.02;

  //constructor
  Body (int bx, int by) {
    bx=bx;
    by=by;
  }

  void display () {
   shape(body, bx+10, by+75); 
  }
  
  void move () {
   float targetX = mouseX; 
   bx += (targetX - bx) * easing; 
  }
  
  //determines speed for umbrella
  float getSpeed(){
     float targetX = mouseX; 
    float speed = (targetX - bx) * easing;
    return speed;
  }
}


