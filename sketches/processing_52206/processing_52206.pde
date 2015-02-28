
class Bug {

  float x, y;

  Bug(float nx, float ny) {
    x = nx;
    y = ny;
  }

  void move() {
  }

  void display() {
    beginShape();
    vertex(x, y);
    vertex(x-500, y+1000);
    vertex(x+500, y+1000);
    endShape();
    fill(155, 0, 204, 128);
    ellipse(x, y, 100, 100);
    fill(232, 247, 35, 128);
    ellipse(x, y+70, 100, 100);
    fill(0);
    ellipse(x, y+35, 500, 100);
    fill(232, 247, 35, 128);
    ellipse(x, y+35, 10, 10);
    ellipse(x-30, y+35, 10, 10);
    ellipse(x-60, y+35, 10, 10);
    ellipse(x-90, y+35, 10, 10);
    ellipse(x-120, y+35, 10, 10);
    ellipse(x-150, y+35, 10, 10);
    ellipse(x-180, y+35, 10, 10);
    ellipse(x+30, y+35, 10, 10);
    ellipse(x+60, y+35, 10, 10);
    ellipse(x+90, y+35, 10, 10);
    ellipse(x+120, y+35, 10, 10);
    ellipse(x+150, y+35, 10, 10);
    ellipse(x+180, y+35, 10, 10);
  }
}


