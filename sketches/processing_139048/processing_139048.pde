
float x = 0;
float t1 = 0;
float t2= 0;
float t3 = 0;
float r1 = 0;
float g1 = 0;
float b1 = 0;

void setup() {
  size(700, 700);
}

void draw() {
  float r1 = map(noise(t1), 0., 1., 0., 255.);
  float g1 = map(noise(t2), 0., 1., 0., 255.);
  float b1 = map(noise(t3), 0., 1., 0., 255.);
  t1 += 0.03;
  t2 += 0.022;
  t3 += 0.025;
  noStroke();
  fill(0, 150);
  rect(0, 0, 700, 700);
  float xx = map(sin(x), -1., 1., 0., 700.);
  noFill();
  stroke(255);
  

  for (int i=0; i<=width+700; i+=10) {
    stroke(r1, g1-240, b1-240);
    strokeWeight(1);
    line(xx+i-700, 0, xx+i+10-700, 15);
    x = x+0.0001;
  }
  for (int i=0; i<=width+700; i+=12) {
    stroke(r1, g1-210, b1-210);
    strokeWeight(1.3);
    line(xx/2+i-700, 15, xx/2+i-10-700, 35);
    x = x+0.0001;
  }
  for (int i=0; i<=width+700; i+=15) {
    stroke(r1, g1-180, b1-180);
    strokeWeight(1.6);
    line(xx/3+i-700, 35, xx/3+i+15-700, 70);
    x = x+0.0001;
  }
  for (int i=0; i<=width+700; i+=20) {
    stroke(r1, g1-150, b1-150);
    strokeWeight(1.9);
    line(xx/4+i-700, 70, xx/4+i-25-700, 120);
    x = x+0.0001;
  }
  for (int i=0; i<=width+700; i+=25) {
    stroke(r1, g1-110, b1-110);
    strokeWeight(2.2);
    line(xx/5+i-700, 120, xx/5+i+30-700, 180);
    x = x+0.0001;
  }
  for (int i=0; i<=width+700; i+=30) {
    stroke(r1, g1-80, b1-80);
    strokeWeight(2.5);
    line(xx/7+i-700, 180, xx/7+i-38-700, 260);
    x = x+0.0001;
  }
  for (int i=0; i<=width+700; i+=38) {
    stroke(r1, g1-50, b1-50);
    strokeWeight(3);
    line(xx/10+i-700, 260, xx/10+i+40-700, 350);
    x = x+0.0001;
  }
  for (int i=0; i<=width+800; i+=38) {
    line(xx/10+i-700+2, 350, xx/10+i-40-700+2, 440);
    x = x+0.0001;
  }
  for (int i=0; i<=width+700; i+=30) {
    stroke(r1, g1-80, b1-80);
    strokeWeight(2.5);
    line(xx/7+i-700, 440, xx/7+i+38-700, 520);
    x = x+0.0001;
  }
  for (int i=0; i<=width+700; i+=25) {
    stroke(r1, g1-110, b1-110);
    strokeWeight(2.2);
    line(xx/5+i-700, 520, xx/5+i-30-700, 580);
    x = x+0.0001;
  }
  for (int i=0; i<=width+700; i+=20) {
    stroke(r1, g1-150, b1-150);
    strokeWeight(1.9);
    line(xx/4+i-700, 580, xx/4+i+25-700, 630);
    x = x+0.0001;
  }
  for (int i=0; i<=width+700; i+=15) {
    stroke(r1, g1-180, b1-180);
    strokeWeight(1.6);
    line(xx/3+i-700, 630, xx/3+i-15-700, 665);
    x = x+0.0001;
  }
  for (int i=0; i<=width+700; i+=12) {
    stroke(r1, g1-210, b1-210);
    strokeWeight(1.3);
    line(xx/2+i-700, 665, xx/2+i+10-700, 685);
    x = x+0.0001;
  }
  for (int i=0; i<=width+700; i+=10) {
    stroke(r1, g1-240, b1-240);
    strokeWeight(1);
    line(xx+i-700, 685, xx+i-10-700, 700);
    x = x+0.0001;
  }
  
}

