

class Hidey {
  float x;
  float y;
  float ang;
  
  Hidey(float x, float y, float ang) {
    this.x = x;
    this.y = y;
    this.ang = ang;
  }
  
  void draw() {
    pushMatrix();
    translate(x,y);
    rotate(radians(ang));
    fill(100,100,120);
    stroke(80,80,100);
    beginShape();
    vertex(0,0);
    vertex(0,30);
    vertex(80,30);
    vertex(80,25);
    vertex(5,25);
    vertex(5,-25);
    vertex(80,-25);
    vertex(80,-30);
    vertex(0,-30);
    vertex(0,0);
    endShape(CLOSE);
    popMatrix();
  }
}

