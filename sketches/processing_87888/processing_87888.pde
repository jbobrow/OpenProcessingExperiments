
float d=0;
int rad=0;
float speed = 0.2;
void setup() {
frameRate(250);
  size(600, 600);
  strokeWeight(0.5);
}

void draw() {
stroke(sin(d)*100, 0, cos(d)*100);
line(300+cos(d)*500,300+ sin(d)*500, 300, 300);
stroke(255);
ellipse(300+cos((d-0.01))*d,300+ sin((d-0.01))*d,10,10);
d+=speed;
rad+=speed;
if (424.26 < d) {
 d=0;
}
}


