
Tree tree = new Tree();
 
void setup() {
  size(600, 300);
  colorMode(RGB, 255);
  background(250,230,10);
  smooth();
}
 
void draw() {
}
 
void keyReleased() {
  background(220,130,30);
}
 
void mouseReleased() {
  tree = new Tree(mouseX, height, height-mouseY, 6);
  tree.render();
}

