
void setup() {
  size(400, 400);
  smooth();
  background(250, 250, 250);
  noCursor();
  rectMode(CENTER);
}

void draw() {
  if (mousePressed) {
    fill(255, 0, 255, 40); 
    rect(200, 200, 400, 400);
    fill(0, 255, 255, 50);
    noStroke();

    rectMode(CENTER);
    rect(200, 200, mouseX, 150);
    stroke(20, 255, 10, 110);
    noStroke();
    rect(200, 200, 150, mouseY);
    stroke(20, 255, 10, 110);
    line(mouseX, mouseY, 200, 200);
    stroke(250, 245, 40);
    line(mouseX, mouseY, 0, 200);
    stroke(250, 245, 40);
    line(mouseX, mouseY, 400, 200);
  }
  else {
    noStroke();
    fill(255, 255, 255, 40); 
    rect(200, 200, 400, 400);

    fill(250, 250, 150, 10);
    ellipse(200, 200, mouseX -20, mouseY -20);

    fill(50, 255, 240, 40);
    ellipse(200, 200, mouseX -40, mouseY -40);

    fill(255, 255, 255, 80);
    ellipse(200, 200, mouseX -60, mouseY -60);

    fill(255, 55, 245, 50);
    ellipse(200, 200, mouseX -100, mouseY -100);
  }
}


