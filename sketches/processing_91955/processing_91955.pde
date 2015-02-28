
//Project: Wrinkles Creation
//Assignment: something that looks organic
//class: AVSYS Spring 2013

Organic[] Organic = new Organic[100];

void setup() {
  size(800, 600);
  noStroke();
  smooth();
  frameRate(10);

  for (int i=0; i<Organic.length; i++) {
    Organic[i] = new Organic(random(0, width), random(0, height));
  }
}

void draw() {
  for (int i=0; i<Organic.length; i++) {
    Organic[i].display();
  }
}


