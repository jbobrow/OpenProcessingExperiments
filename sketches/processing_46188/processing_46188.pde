
class Pm {

  float rad=PI/180;
  float dx=pas/2, dy=0;
  int sact;
  int sant;

  void draw() {
    frameRate(20);
    int s=second();
    int m=millis();


    noStroke();
    fill(250, 240, 60);
    pushMatrix();
 
    ellipse(0, 0, pas-pas/8, pas-pas/8);
    fill(0);
    rotate(ang*rad);
    triangle(0, 0, dx, dy, dx, -dy);
    popMatrix();

    if (int(m*0.01)%2 == 0) {
      dy=pas/2;
    }
    else {
      dy=0;
    }
  }
}


