
void setup() {
  size (400, 400);
  background(255);
}

void draw(){
  background(255);
  {
    ellipse (mouseY, mouseX, 20, 20);
    fill (20, 80, 250, 255);
    {
       ellipse(mouseX, mouseY, 50, 50);
    fill (80, 90, 240, 255);
    }
  }
}

