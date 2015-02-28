
void setup() {
  smooth();
  size(500, 400);
  background(100,75,75);
  
}
void draw() {
  background(100,60,80);
  
 

  for (int i = 0; i <= 500; i += 50) {
    for (int j = 15; j <= 100; j += 15) {
      stroke(40,200,40);
      strokeWeight(5);
      rect(i+10, i+20, mouseY, mouseX);
      fill (100);
      
 

    }
    for (int j = 15; j <= 100; j += 15) {
      stroke(20,24,144);
      strokeWeight(3);
      quad(i, j, mouseX, mouseY, i+30, j+10, i+10, j+30);
      }
      
      }
  }
