
void setup() {  
  size(400, 250);
  background(#7FFFD4); 
}

void draw() {  

  if(mousePressed) { 
    Snowman(mouseX, mouseY);
  }
  if (keyPressed) {
      tree(key);
  }
  stroke(255);
  point(random(400), random(250));
}

void Snowman(int x, int y) {
    fill(255);
    stroke(0);
    ellipse(mouseX, mouseY, 30, 30);
    ellipse(mouseX, mouseY + 35, 40, 40);
    ellipse(mouseX, mouseY + 80, 50, 50);
    fill(0);
    ellipse(mouseX - 5, mouseY, 5, 5);
    ellipse(mouseX + 5, mouseY, 5, 5);
    noFill();
    line(mouseX - 20, mouseY + 30, mouseX - 30, mouseY + 10);
    line(mouseX + 20, mouseY + 30, mouseX + 35, mouseY + 10);
}

void tree(char key) {
    noStroke();
    fill(34,139,34);
    triangle(mouseX, mouseY, mouseX + 40, mouseY - 105, mouseX + 80, mouseY);
    fill(184,134,11);
    rect(mouseX + 30, mouseY, 20, 20);
}
