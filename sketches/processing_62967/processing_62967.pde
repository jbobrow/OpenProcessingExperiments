
class Aim {

  float x, y;

  Aim(float nx, float ny) {
    x = nx;
    y = ny;
  }

  void display() {
    stroke(0);
    fill(255, 0, 0, 100);

    ellipse(mouseX, mouseY, 75, 75);
    line(mouseX, mouseY-45, mouseX, mouseY+45);
    line(mouseX+45, mouseY, mouseX-45, mouseY);
    line(mouseX, mouseY-5, mouseX-5, mouseY-5);
    line(mouseX, mouseY-10, mouseX-5, mouseY-10);
    line(mouseX, mouseY-15, mouseX-5, mouseY-15);
    line(mouseX, mouseY-20, mouseX-10, mouseY-20);
    line(mouseX, mouseY-25, mouseX-5, mouseY-25);
    line(mouseX, mouseY-30, mouseX-5, mouseY-30);
    line(mouseX, mouseY-35, mouseX-5, mouseY-35);
    line(mouseX, mouseY+5, mouseX+5, mouseY+5);
    line(mouseX, mouseY+10, mouseX+5, mouseY+10);
    line(mouseX, mouseY+15, mouseX+5, mouseY+15);
    line(mouseX, mouseY+20, mouseX+10, mouseY+20);
    line(mouseX, mouseY+25, mouseX+5, mouseY+25);
    line(mouseX, mouseY+30, mouseX+5, mouseY+30);
    line(mouseX, mouseY+35, mouseX+5, mouseY+35);
  }
}


