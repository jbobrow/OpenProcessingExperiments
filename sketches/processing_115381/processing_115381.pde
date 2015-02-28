

void setup() {
  size(400, 400);
  background(227, 209, 185);
}

void draw() {

  noStroke();
  line(width/2, 0, width/2, height);
  line(0, height/2, width, height/2);

  if (mousePressed == true) {
    if (mouseX < width/2 && mouseY < height/2) {
      fill(165, 106, 115);
      rect(0, 0, width/2, height/2);
    }
    else if (mouseX > width/2 && mouseY > height/2) {
      fill(211, 223, 79);
      rect(width/2, height/2, width/2, height/2);
    }
    else if (mouseX > width/2 && mouseY < height/2) {
      fill(171, 193, 43);
      rect(width/2, 0, width/2, height/2);
    }
    else if (mouseX < width/2 && mouseY > height/2) {
      fill(214, 183, 188);
      rect(0, width/2, width/2, height/2);
    }
  }
  else {
    background(227, 209, 185);
  }
}



