
void setup() {
  size(600, 600);
  background(240);
  smooth(4);
}

void draw() {
  noStroke();
  
  if(mousePressed) {
     fill(0, 5);
   rect(0, 0, width, height);
    stroke(240);
    strokeWeight(5);
    line(random(width), random(height), random(width), random(height));
    fill(240);
    noStroke();
    ellipse(mouseX, mouseY, 30, 30);
  } else {
    fill(240, 40);
   rect(0, 0, width, height);
    fill(0);
    ellipse(mouseX, mouseY, 30, 30);
   fill(0);
   ellipse(mouseX, mouseY, 30, 30);
}
}
