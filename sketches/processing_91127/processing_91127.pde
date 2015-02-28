
void setup() {
  smooth(); 
  size(200, 200);
}
void draw() {
  background(0);
  for (int i = 0; i <= 200; i += 25) { 
    for (int j = 0; j <= 200; j += 25) { 
      stroke(255, 255, 0 ); 
      strokeWeight(2); 
      line(mouseY, mouseX, i, j);
    } 
    for (int j = 10; j <= 200; j += 30) { 
      stroke(0, 255, 255); 
      strokeWeight(1); 
      line(i, j, mouseX, mouseY);
    }
  }
}
