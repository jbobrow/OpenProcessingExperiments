
class Circle {
  PApplet papplet;

  float x;
  float y;
  float w;
  float life;
  float c;

  Circle(PApplet tmpP, float tmpX, float tmpY, float tmpW) {
    papplet = tmpP;
    x = tmpX;
    y = tmpY;
    w = tmpW;
    life = 400;
    c = random(360);
  }

  void display() {
    papplet.pushMatrix();
    papplet.translate(x,y);
    papplet.stroke(c,80,100);
    papplet.noFill();
    papplet.strokeWeight(20);
    papplet.ellipse(0,0,w,w);
    papplet.popMatrix();
  }

  void plus(){
    w += 8;
  }

  boolean finished() {
    life--;
    if (life < 0) {
      return true;
    }
    else {
      return false;
    }
  }
}


