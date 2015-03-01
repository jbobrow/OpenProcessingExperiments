
void setup() {
  size(464, 600);
  background(#07F59B);
}

void draw() {
  if (keyPressed == true) {
    background(#07f59b);
  }
  else {
    noFill();
    strokeWeight(0.1);
    bezier(0, 0, mouseX - 200, mouseY + 120, mouseX, mouseY + 200, mouseX, mouseY);
    bezier(0, 0, mouseX + 200, mouseY - 120, mouseX, mouseY - 200, mouseX, mouseY);
    strokeWeight(2);
    fill(#CE132F, 10);
    rect(232, 300, mouseX, mouseY, 500);
    fill(#Ce132f, 20);
    rect(132, 200, mouseX, mouseY, 500);
    fill(#ce132f, 40);
    rect(32, 100, mouseX, mouseY, 500);
    fill(#ce132f, 60);
    rect(-68, 0, mouseX, mouseY, 500);
  }
}


