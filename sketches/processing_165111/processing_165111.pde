
Firework fire;



void setup() {
  size(700, 700);
  fire = new Firework(5, 20, width/2, height/2);

}

void draw() {
  smooth();
  fill(225, 225, 225, 100); 
  rect(0, 0, width, height);
  fire.display();
  fire.move();
}
class Firework {
  float angle;
  float r;
  float d;
  float x;
  float y;
  float a;
  float b;
  float c;

  Firework(float tempR, float diameter, float mya, float myb) {
    r=tempR;
    d=diameter;
    a=mya;
    b=myb;
  }

  void display() {
    translate(a, b);
    for (int j=0; j<9; j++) {
      for (int i=0; i<50; i++) {
        x=(r-20*j*frameCount*0.0001)*cos(angle+map(cos(frameCount*0.0007), -1, 1, -50, 50));
        y=(r+20*j/frameCount*0.0001)*cos(angle-map(cos(frameCount*0.0001), -1, 1, -50, 50));
        // y=y-(r/20/j)*-cos(angle/cos(angle/map(cos(frameCount*0.05), -1, 1, -50, 50)));
        stroke(50);
        fill(110, height, 180);
        ellipse(x, y, d+10, d+10);
        stroke(70);
        fill(height, 130, 90);
        ellipse(x, -y, d+10, d+10);
        fill(255);
        d=d-cos(angle+map(tan(frameCount*0.001), -1, 1, -10, 10));
        angle=(2*PI/50)*i;
        angle=angle-map(cos(frameCount*0.005), -1, 1, -10, 10);
      }
    }
  }

  void move() {
    for (int n=0; n<5; n++) {
      if (d>0) {
        if (r<(180-2*5)) {
          r=r+.5+frameCount*0.01;
        } else {
          b=b+cos(0.025*2);
          d=d-cos(0.003*2);
        }
      }
    }
  }
}


