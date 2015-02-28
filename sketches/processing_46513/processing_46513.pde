
class Bullet {

  int speedX, speedY, x, y;
  int r = 8;
  boolean shot = false;
  boolean resetState = true;

  Bullet(int tempX, int tempY) {
    x = tempX;
    y = tempY;
  }


  void display() {
    fill(255,237,51);
    ellipse(x, y, r, r);

    if (shot == true) {

      x+=speedX;
      y+=speedY;
    }
    else {
      x = x;
      y = y;
    }
    
    if (x < -r || x > width+r || y < 0-r || y > height+r){
      shot = false;
    }
    
    
  }
}
  


