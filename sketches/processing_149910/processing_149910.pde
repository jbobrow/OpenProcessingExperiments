
int num=25, steps = 30;
float theta, angle;
Stripe[] stripes = new Stripe[steps];
color palette[] = {#4CE32B, #FFEE74, #FF1532} ; 

void setup() {
  size(500, 500);
  noStroke();
  rectMode(CENTER);
  createStuff();
}

void draw() {
  background(20);
  translate(width/2, height/2);
  angle=0;
  for (int i=0; i<stripes.length; i++) {
    pushMatrix();
    rotate(angle);
    stripes[i].display();
    angle += (TWO_PI/steps);
    popMatrix();
  }
  theta += .0523*2;

  //if (frameCount%1==0 && frameCount<61) saveFrame("image-###.gif");
}

void mouseReleased() {
  createStuff();
}

void createStuff() {
  for (int i=0; i<steps; i++) {
    int c = (int) 255.0/steps*i;
    float offSet = TWO_PI/steps*i;
    stripes[i] = new Stripe(c, offSet);
  }
}

class Stripe {
  int c;
  float offSet;

  Stripe(int _c, float _offSet) {
    c = _c;
    offSet = _offSet;
  }

  void display() {
    colorMode(HSB, 255, 100, 100);
    int n = (int) map(sin(theta+offSet*2), -1, 1, 3, num);
    if (n>19) n = 19;
    fill(c, 90, 100);
    for (int i=0; i<n; i++) {
      ellipse(50+i*8, 0, 4+i, 4+i);
    }

    colorMode(RGB);
  }
}


