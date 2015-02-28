

public class MyBoid {
  public int index;
  public Position position;
  public Speed speed;
  
  MyBoid(int idx) {
    this.index = idx;
    this.position = new Position(0, 0);
    this.speed = new Speed(0, 0);
  }
  
  public void move() {
    this.position.x += this.speed.x;
    this.position.y += this.speed.y;
  }
}

