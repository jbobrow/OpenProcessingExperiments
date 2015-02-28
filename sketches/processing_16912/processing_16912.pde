
public class Bullet {
  int x, y;

  Bullet(int x, int y) {
    this.x = x;
    this.y = y;
  }

  void show() {
    y -= 5;
    strokeWeight(3);
    line(x, y, x, y - 20);
  }
}


