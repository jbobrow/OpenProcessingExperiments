
class SnakeFood {

  int x, y;

  SnakeFood() {
    x = int(random(width/20))*20;
    y = int(random(height/20))*20;
  }

  void display() {
    fill(255, 100, 100);
    pushMatrix();
    translate(x, y, 0);
    box(20);
    popMatrix();
  }
}


