
void setup() {
     size(650, 630);
     smooth();
     stroke(0, 102);
     background(252, 242, 222);
}
   void draw() {
     if (mousePressed) {
     float weight 
     = 0.05*dist(mouseX, mouseY, pmouseX, pmouseY);
     strokeWeight(1/weight);
     line(mouseX, mouseY, pmouseX, pmouseY);
     }
}
  void mouseClicked() {
       fill(250, 131, 191);
       ellipse(mouseX, mouseY, 10, 10);
     }
