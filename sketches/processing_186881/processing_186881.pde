
float x, y;
float angle;
float a, b;
int count;
float all;
float d, fora;
void setup() {
  size(1000, 600);
  background(0);
  x=0;
  y=0;
  angle=0;
  a=0.5;
  b=10;
  count=0;
  all=0;
  // d=5;
}
  void draw() {
    translate(width/2, height/2);
    stroke(255);
    strokeWeight(2);
    rotate(angle);
    for (fora=d; fora<=5; fora++) {
      point(random(x-b-10, x+b), y);
      point(random(-x-b-10, -x+b), y);
    }
   // y=y+1;
    x=x+a;
    angle=angle+(PI/180);
    a=a+0.0005;
    b=b+0.15;
    count++;
    if (count>=300) {
      a=a+0.05;
      b=b+1;
    }
    if (count<=50) {
      d=5;
    }
    if (count>=51) {
      d=1;
    }
  }
