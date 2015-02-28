
// 6) a composition that evokes symmetry
void setup() {
  size(500,500);
  smooth();
  noStroke();
  background(255, 247, 3);
}
void draw() {
  for (int i=0; i< 1; i+=1) {
  stroke(11, 175, 23);
  line(mouseX+i, mouseY, pmouseX+i, pmouseY);
  line(mouseX+i, height-mouseY, pmouseX+i, height-pmouseY);
  }
}
void mousePressed() {
  fill(255, 5, 139);
  noStroke();
  rect(0,0,width, height);
}


