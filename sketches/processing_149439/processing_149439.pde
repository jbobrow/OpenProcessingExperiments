
int num=20, steps = 20;
float theta, angle;
Stripe[] stripes = new Stripe[steps];

void setup() {
  size(400, 400);
  background(20);
  noStroke();
  rectMode(CENTER);
  createStuff();
}

void draw() {

  translate(width/2, height/2);
  fill(20,20);
  noStroke();
  rect(0,0,width, height);
  angle=0;
  for (int i=0; i<stripes.length; i++) {
    pushMatrix();
    rotate(angle);
    stripes[i].display();
    angle += (TWO_PI/steps);
    popMatrix();
  }
  theta += .0523;

}

void createStuff() {
  for (int i=0; i<steps; i++) {
    //int num = (int) random(5, 20);
    int c = (int) 255.0/steps*i;
    //float offSet = random(TWO_PI);
    //float offSet = noise(i/2.0)*TWO_PI;    
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
    fill(c, 80, 80);
    int n = (int) map(sin(theta+offSet), -1, 1, 2, num);
    if (n>19) n = 19;
    for (int i=0; i<n; i++) {
      rect(30+i*8, 0, 4, 6+i*2);
    }
    colorMode(RGB);
  }
}

