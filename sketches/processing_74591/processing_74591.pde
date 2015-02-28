
class Circle {
  int xLoc, yLoc;
  float Rotate, initRotate, Size, life;
  color Fill; 
  Circle(float c, color f, int xloc, int yloc, float rotSpeed, float initA) {
    Size = c;
    Fill = f;
    xLoc = xloc;
    yLoc = yloc;
    Rotate = random(-.08, .08);
    initRotate = initA;
    life = 20 * frameRate;
  }
  void draw() {
    pushMatrix();
    translate(xLoc, yLoc);
    rotate(initRotate+=Rotate);
    
    if (life > 5*frameRate) {
      dropShadow();
      colored();
    }
    else outline();
    popMatrix();
  }
  void colored() {
    noStroke();
    fill(Fill);
    ellipseMode(CENTER);
    ellipse(0, 0, Size, Size);
    fill(bgColor);
    ellipse(-(Size/2 - Size/5), 0, Size/5, Size/5);
  }
  void outline() {
    noFill();
    stroke(Fill);
    ellipseMode(CENTER);
    ellipse(0, 0, Size, Size);
    noFill();
    stroke(Fill);
    ellipse(-(Size/2 - Size/5), 0, Size/5, Size/5);
  }
  boolean finished() {
    life--;
    if (life < 0) {
      return true;
    }
    else return false;
  }
  void dropShadow() {
    for (int i = 0; i<30; i++) {
      noStroke();
      fill(0, map(i, 0, 30, 15, 0));
      ellipse(0, 0, Size + i, Size + i);
      ellipse(-(Size/2 - Size/5), 0, Size/5 - i, Size/5 - i);
    }
  }
}


