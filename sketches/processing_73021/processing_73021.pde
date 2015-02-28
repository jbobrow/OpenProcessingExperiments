
class Fly {
  float d;
  float a;
  float b;
  float c;
  float e;

  Fly(float tempD, float tempA, float tempB, float tempC,float tempE) {
    d=tempD;
    a=tempA;
    b=tempB;
    c=tempC;
    e=tempE;
  }

  void display() {
    fill(random(255));
    ellipse(a, b, c, c);
    fill(0);
    line(b, a, e, e);
    a=a+d;
    b=b+d;

    if (a>width) {
      a=0;
    } 

    if (b>height) {
      b=0;
    }
  }

  void lib() {
    Ani.to(this, 2.5, "a", mouseX-a);
    Ani.to(this, 2.5, "b", mouseY-b);
  }
}



