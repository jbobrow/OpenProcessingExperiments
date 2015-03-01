
void setup () {
  size(500, 500);
  background(212, 239, 252);
  line(width/3, 0, width/3, height);
  line(width/3*2, 0, width/3*2, height);
  line(0, height/3, width, height/3);
  line(0, height/3*2, width, height/3*2);
}
void draw () {
  println(mousePressed);
  if (mousePressed) {
  }
}

void mousePressed() {
  if (mouseX < width/3 && mouseX > 0 && mouseY < height/3 && mouseY > 0) {
    fill(56, 152, 252);
    ellipse(width/6, height/6, 80, 80);
  }
  if (mouseX < width/3*2 && mouseX > width/3 && mouseY < height/3 && mouseY > 0) { 
    fill(129, 250, 204);
    ellipse(width/6*3, height/6, 80, 80);
  }
  if (mouseX < width && mouseX > width/3*2 && mouseY < height/3 && mouseY > 0) { 
    fill(135, 151, 247);
    ellipse(width/6*5, height/6, 80, 80);
  }
  if (mouseX < width/3 && mouseX > 0 && mouseY < height/3*2 && mouseY > height/3) { 
    fill(208, 135, 247);
    ellipse(width/6, height/6*3, 80, 80);
  }
  if (mouseX < width/3 && mouseX > 0 && mouseY < height && mouseY > height/3*2) { 
    fill(129, 250, 204);
    ellipse(width/6, height/6*5, 80, 80);
  }
  if (mouseX < width/3*2 && mouseX > width/3 && mouseY < height/3*2 && mouseY > height/3) { 
    fill(247, 135, 169);
    ellipse(width/6*3, height/6*3, 80, 80);
  }
  if (mouseX < width && mouseX > width/3*2 && mouseY < height/3*2 && mouseY > height/3 ) { 
    fill(135, 218, 247);
    ellipse(width/6*5, height/6*3, 80, 80);
  }
  if (mouseX < width/3*2 && mouseX > width/3 && mouseY < height && mouseY > height/3*2 ) { 
    fill(250, 103, 116);
    ellipse(width/6*3, height/6*5, 80, 80);
  }
  if (mouseX < width && mouseX > width/3*2 && mouseY < height && mouseY > height/3*2 ) { 
    fill(103, 250, 212);
    ellipse(width/6*5, height/6*5, 80, 80);
  }
}


