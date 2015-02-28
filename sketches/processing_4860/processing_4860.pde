
void setup() {
   size(400, 320);   
   noStroke();
   fill(255, 204, 0, 120);
   background(51);
}

void draw() {
  
  int x = constrain(mouseX, 200, 300);
  int y = constrain(mouseY, 100, 200);
  
  ellipse(x, y, 20, 20);


}

