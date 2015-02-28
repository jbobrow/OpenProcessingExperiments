
Tree tree = new Tree();
 
void setup() {
  size(600, 300);
  colorMode(RGB, 255);
  background(240,240,255);
  smooth();
}
 
void draw() {
}
 
void keyReleased() {
  background(120,240,130);
}
 
void mouseReleased() {
  tree = new Tree(mouseX, height, height-mouseY, 6);
  tree.render();
}

