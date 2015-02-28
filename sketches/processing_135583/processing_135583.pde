
void setup() {
  size (500, 400);  
  background (240, 180, 0);
}

  void draw() {

    stroke (random (200), random(255), 100, 120);
    fill (random(100), random (80), 100, 80);
       rect(mouseX, mouseY, mouseX/3, mouseY/3);
      
     }
     
     void mousePressed() {
       background(240, 180, 0);
     }




