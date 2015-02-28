
color[] c = new color[10];


void setup() {
  size(500, 500);
  smooth();
  for (int i = 0; i < 10; i++) {
    c [i]= color(random(256), random(100), random(200));
  }
}; //end setup


void draw() {
  frameRate(10);
  float x = random(-20, 40);
  //noStroke();
  strokeWeight(0.1);
  for (int i = 0; i < 10; i++) {
    c[i] = color(random(256), random(100), random(200), random(20));
    fill(c[i]);
  }
  float originx = 50 + random(x);
  float originy = 50 + random(x);

      beginShape();
  vertex(originx, originy);
  vertex(215+random(x), 50+random(x));
  vertex(215+random(x), 100+random(x));
  vertex(165+random(x), 100+random(x));
  vertex(165+random(x), 400+random(x));
  vertex(285+random(x), 400+random(x));
  vertex(285+random(x), 260+random(x));
  vertex(345+random(x), 260+random(x));
  vertex(345+random(x), 450+random(x));
  vertex(50+random(x), 450+random(x));
  vertex(50+random(x), 400+random(x));
  vertex(100+random(x), 400+random(x));
  vertex(100+random(x), 100+random(x));
  vertex(50+random(x), 100+random(x));
  vertex(50+random(x), 50+random(x));
  vertex(originx, originy);
  endShape();
}; //end draw


