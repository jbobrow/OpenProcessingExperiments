
int maxDepth=11;
int len=22;
void setup() {
  size(600, 600);
  stroke(255);
  smooth();
}
void draw() {
  background(0);
  pushMatrix();
  translate(width/2, height/2);
  tree(0);
  popMatrix();
  fill(255);
  text("Pentagram", 100, 500-10);
  ellipse(100, 500, 10, 10);
  //println("X:"+mouseX+" Y:"+mouseY);
}
void tree(int nDepth) {
  if (nDepth < maxDepth) {
    
    strokeWeight(maxDepth-nDepth);
    stroke(nDepth*10, 255-nDepth*10, 255);
    line (0, 0, 0, mouseX-width/2);
    translate(0, mouseX-width/2);

    //..
    pushMatrix();
    rotate(radians(mouseX));
    tree(nDepth+1);
    popMatrix();
    //..
    pushMatrix();
    rotate(radians(-mouseY));
    tree(nDepth+1);
    popMatrix();
  }
}


