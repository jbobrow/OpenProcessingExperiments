
void setup() {
  background (255);
  size(600, 600);
  noCursor();
   
}
  
void draw() {
noStroke();
fill (random(255), random(255),random(255),random(255));
ellipse (pmouseX, pmouseY, 70, 70);
}

