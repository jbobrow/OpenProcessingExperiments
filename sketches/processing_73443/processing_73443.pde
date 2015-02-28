
void setup() {
  size(900, 400);
}

void draw() {
  stroke(random(100), random(0), random(100), random(80) );
  
  for (int y=0; y<=height; y+=50) {
    
    line(0, y, mouseX, mouseY);
  }
  
  stroke(255, random(80) );
  for (int y=0; y<=height; y+=50) {
    
    line(width, y, mouseX, mouseY);
  }


}
void mousePressed() {
  redraw();
}

