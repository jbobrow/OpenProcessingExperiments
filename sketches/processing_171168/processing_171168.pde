
class Rectangle {
  int x, y, w, h;

  Rectangle(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
}

Rectangle r1, r2;

void setup() {
  size(520, 320);
  rectMode(CENTER);
  noFill();
  strokeWeight(1);

  r1 = new Rectangle(width/2, height/2, 60, 50);
  r2 = new Rectangle(0, 0, 60, 50);
}

void draw() {
  background(255);
  
  // border
  noFill();
  stroke(0);
  strokeWeight(2);
  rect(width/2,height/2, width-2, height-2);

  r2.x = mouseX;
  r2.y = mouseY;

  strokeWeight(1);
  if (intersection(r1, r2)) {
    stroke(255, 0, 0);
    fill(255, 128, 64, 32);
  }
  else {
    stroke(0);
    noFill();
  }


  rect(r1.x, r1.y, r1.w, r1.h);
  rect(r2.x, r2.y, r2.w, r2.h);
}

boolean intersection(Rectangle r1, Rectangle r2) {
  // This can be simplified to 1 line if you want....
  // return !(r1.x >= r2.x + r2.w || r1.x + r1.w < r2.x || r1.y > r2.y + r2.h || r1.y + r1.h < r2.y);

  if (r1.x > r2.x + r2.w ||
      r1.x + r1.w < r2.x ||
      r1.y > r2.y + r2.h ||
      r1.y + r1.h < r2.y) {
    return false;
  }
  return true;
}

