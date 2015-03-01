
void setup() {
  size(900, 500); 
  noFill();
}

void draw() {
  background(0);
  for (int i = 0; i < 300; i += 20) {
    stroke(#03A9FA);
    bezier(mouseX-(i/2.0), 60+i, 410, 20, 600, 300, 240-(i/16.0), 400+(i/8.0));
    stroke(#E003FA);
    bezier(mouseY-(i/2.0), 60+i, 410, 20, 600, 300, 240-(i/16.0), 400+(i/8.0));
  }
}




