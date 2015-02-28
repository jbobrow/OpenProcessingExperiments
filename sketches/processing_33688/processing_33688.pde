
void setup() {
  size(600, 400);
  background(0);
  noStroke();
}

void draw() {

    noStroke();
    fill(random(255));
    ellipse(mouseX, mouseY, 20, 20);
    stroke(random(255));
    strokeWeight(20);
    line(pmouseX, pmouseY, mouseX, mouseY);
 
}


