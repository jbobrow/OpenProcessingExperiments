

void setup() {
  size(300, 300);
  fill(255);
  background(10);
}

void draw() {
  if(mousePressed) {
    stroke(255);
    fill(150);
  } else {
    stroke(19);
    fill(random(255), random(255), random(255), random(255));
  }
  ellipse(mouseX, mouseY-10, mouseX, mouseY+10);
  line(mouseX-20, mouseY, mouseX+20, mouseY); 
  line(mouseX, mouseY-20, mouseX, mouseY+20); 
}



