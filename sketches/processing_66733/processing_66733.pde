
void setup() {
  size(500, 500);
  background(0);
  smooth();
}
void draw() {

  for (int i=0; i<150; i+=1) {
    squarefunction (i, i);
  }
}

void squarefunction (int aa, int bb) {
rect(mouseX, mouseY, aa, bb);
  rectMode(CENTER);
  stroke(1,random(255), random(255), random(255));
  noFill();

  if (mouseY>width/2) {
   stroke(random(255),random(255), random(255), random(255));
  noFill();
}

  
  
}


