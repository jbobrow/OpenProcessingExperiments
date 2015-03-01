
ArrayList<Firework> fire =new ArrayList<Firework>();
boolean m=false;

void setup() {
  size(1000, 800, P2D);
  smooth();
}

void draw() {
  background(0);
  if (m) {
    fire.add(new Firework(random(10, 40), 3, random(100, 900), random(100, 700)));
  }
  for (int i=0; i<fire.size (); i++) {
    Firework myfire=fire.get(i);
    myfire.display();
    myfire.move();
  }
  if (fire.size()>30) {
    fire.remove(0);
  }
}

void mousePressed() {
  m=true;
}
void mouseReleased() {
  background(0);
  fire.add(new Firework(random(10, 40), 3, random(200, 800), random(200, 600)));
}
class Firework {
  float angle;
  float r;
  float d;
  float x;
  float y;
  float a;
  float b;

  Firework(float tempR, float diameter, float mya, float myb) {
    r=tempR;
    d=diameter;
    a=mya;
    b=myb;
  }

  void display() {
    translate(a, b);

    for (int j=0; j<5; j++) {
      for (int i=0; i<200; i++) {
        noStroke();
        x=(r-25*j)*cos(angle);
        y=(r-25*j)*sin(angle);
        fill(0, random(10, 200), 230);
        ellipse(x, y, d, d);
        angle=(2*PI/200)*i;
      }
    }
    translate(-a, -b);
  }
  void move() {
    for (int n=0; n<5; n++) {
      if (d>0) {
        if (r<(random(80, 100)-n*2)) {
          r=r+1;
          d=d-0.02;
        } else {
          //b=b+0.025*n;
          d=d-0.035*n;
        }
      }
    }
  }
}


