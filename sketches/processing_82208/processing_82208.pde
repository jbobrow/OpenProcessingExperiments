
//Victoria H, BounceTheBall CP1 mods 16/17

ball bob;
void setup() {
  size(200, 200);
  bob = new ball();
}
void draw() {
  background(183, 35, 35);
  bob.move();
  bob.bounce();
  bob.show();
}
class ball {
  int x, y;
  boolean up, right;
  ball() {
    x=int(random(200));
    y=int(random(200));
    up=true;
    right=true;
  }
  void move() {
    if (right==true) {
      x++;
    } 
    else {
      x--;
    }
    if (up==true) {
      y--;
    } 
    else {
      y++;
    }
  }
  void bounce() {
    if (x<0) {
      right=true;
    } 
    else if (x>200) {
      right=false;
    }
    if (y<0) {
      up=false;
    } 
    else if (y>200) {
      up=true;
    }
  }
  void show() {
    fill(255);
    noStroke();
    ellipse(x, y, 20, 20);
  }
}
