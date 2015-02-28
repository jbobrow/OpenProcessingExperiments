
void setup() {
  size(200, 200);
}

void draw() {
  background(0, 70, 100, 10);
  
  noStroke();
  
  if (mouseX < width/2 && mouseY < height/2) {
    fill(90, 20, 150);
    rect(0, 0, width/2, height/2);
}   else if (mouseX > width/2 && mouseY < height/2) {
    rect(100, 0, width/2, height/2);
}   else if (mouseX < height/2 && mouseY > height/2) {
    rect(0, 100, width/2, height/2);
}   else {
    rect(100, 100, width/2, height/2);
}

  stroke(0, 140, 200);
  strokeWeight(3);
  line(0, 100, 200, 100);
  line(100, 0, 100, 200);

}

