

void setup() {
  background (0);
  size(600, 600);
  noCursor();  
}
 
void draw() {
line (pmouseX, pmouseY, 5, 5);
ellipse (pmouseX, pmouseY, 10, 10)
noStroke();

}
