
void setup() {
  background (0);
  size(600, 600);
  noCursor();
 
}

void draw() {
noStroke();
fill (random(255), random(255),random(255),random(255));
ellipse (pmouseX, pmouseY, 10, 10);
fill(255);
ellipse (random(600),random(600),10,10);
}

