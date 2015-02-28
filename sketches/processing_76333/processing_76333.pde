
class Bullet {
  float x, y;
 
  Bullet(float x,float y) {
    this.x = x;
    this.y = y;
  }
 
 
   void move() {
    y = y - 10; 
    }
    
    
  void show() {

     image (ghostBullet, x, y);
    move(); 
    
  }
  

    
}


