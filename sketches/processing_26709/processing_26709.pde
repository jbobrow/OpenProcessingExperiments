
class Circles {
  int x;
  int y;
  int nx;
  int ny;
  color colour; 
  int r;

  Circles() {
    x = int(random(0,width));
    y = int(random(0,height));
    nx = int(random(0,width));
    ny = int(random(0,height));
    colour = color(251,255,194);
    r = int(random(2,10));
  }


  void display() {
    noStroke();    
    fill(colour);
    ellipse(x,y,r*2,r*2);
  }


  void animate() {
    nx = int(random(0,width));
    ny = int(random(0,height));
    x = nx;
    y = ny;
  }
}


