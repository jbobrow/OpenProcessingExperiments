
void setup() {
  size(300, 300);
  fill(50);
 background(0);
}

void draw( ) {
   rect(100, 80, 100, 100);
      if (mouseX > 100 && mouseX < 200 && 
      mouseY > 80 && mouseY < 180) {
        fill(0, 215, 0);
      }
      else {
        fill(255);  
}
}

