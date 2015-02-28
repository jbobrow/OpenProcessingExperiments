
class Bomb {
  int sz = 30;
  int x;
  int y;
  int area = 100;
  ArrayList <Fuse> fuses = new ArrayList <Fuse> ();
  
  public Bomb (int x, int y) {
    this.x = x;
    this.y = y;
  }
  
  void drawBomb() {
    fill(0);
    ellipse(x,y,sz,sz);
    fill(255);
    ellipse(x+5,y-5,sz/4,sz/4);
  }
  
  void detonate() {
    stroke(random(55),100,100);
    fill(random(55),100,100);
    for (int i =0;i < area; i++) {
      ellipse(x,y,i,i);
    }
    noStroke();
  }
}

