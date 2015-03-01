
void setup() {
  size(400, 400);
  background(#B891D3);
}

void draw() {  
      if (keyPressed) {
        frameRate(45);
        noStroke();
        fill(#fffdaa, 20);
        rect(mouseX-20, mouseY-20, 40, 40, 19);
      }
      else if (mousePressed) {
        frameRate(75);
        noStroke();
        fill(#ffffff, 16);
        ellipse(mouseX - 5, mouseY - 5, 10, 10);
        fill(#9C9DA0, 16);
        ellipse(mouseX - 3, mouseY - 3, 10, 10);
        fill(#0A3DFF, 16);
        ellipse(mouseX, mouseY, 10, 10);
      }
  }


