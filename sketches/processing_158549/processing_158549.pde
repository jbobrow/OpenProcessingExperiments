
int interruptor = 0;
void setup () {
   size(600, 400);
  rectMode(CENTER);
}

void draw() {
  background(random(255),random(255),random(255));
  interruptor=pmouseY;
  if (interruptor>height/2) {
    ellipse((pmouseX), (pmouseY), 100, 100);
    fill(0);
  }
  else {
    rect((pmouseX), (pmouseY), 100, 100);
    fill(255);
  }
}

