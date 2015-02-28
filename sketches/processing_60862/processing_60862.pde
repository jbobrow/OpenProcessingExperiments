
class Planet {
  float r/*radius*/, d/*distance*/, s/*speed*/, sIncrement;
  color C= color(random(50, 255), random(50, 255), random(50, 255));
  Planet(float r, float d) {
    this.r=r;
    this.d=d;
    s=0;
    sIncrement=PI/(d/(r/20));
  }
  void display() {

    s+=sIncrement;
    pushMatrix();
    rotate(s);
    noStroke();
    fill(C);
    ellipse(0, d, r, r);
    popMatrix();
  }
}


