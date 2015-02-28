
void setup() {
  background(255);
  size(500, 500);
 
}

void draw() {
  for (int i=20; i<500; i+=10) {
    rectFunction(i, i);
  }

//rectFunction(200, 100);
}

void rectFunction(int circw, int circy) {
  noFill();
  stroke (1, random(255), random(255), random(255));
  ellipse(mouseX, mouseY, circw, circy) ;
}


