
float xPos = 0;
float yPos = 0;

void setup () {
  size(800, 800);
  background(255);
}
void draw() {

  
    xPos = mouseX;
    yPos = mouseY;

    if (mousePressed) {
      noStroke();
      fill(0);
      ellipse(xPos, yPos, 50, 50);
    }

    if (keyPressed && key == 'r') {
      background(255);
    }  
  }
