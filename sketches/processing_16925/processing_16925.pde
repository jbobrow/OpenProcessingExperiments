
public class Bullet {
  int x, y;
  
  Bullet(int x, int y) {
    this.x = x;
    this.y = y;
  }
  
  void show() {
    y -= 5;
    ellipse(x, y, 2, 2);
  }
}

