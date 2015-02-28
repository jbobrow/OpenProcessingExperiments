
//Project: Neon Squares
//Assignment: something that looks inorganic
//class: AVSYS Spring 2013

InOrganic[] InOrganic = new InOrganic[100];
float c = 255;

void setup() {
  size(800, 600);
  noStroke();
  smooth();
  frameRate(10);

  for (int i=0; i<InOrganic.length; i++) {
    InOrganic[i] = new InOrganic(100*i, height/2-100, 200, 200);
  }
}

void draw() {
  c = random(255);
  stroke(c);
  noFill();

  for (int i=0; i<InOrganic.length; i++) {
    InOrganic[i].display();
  }
}


