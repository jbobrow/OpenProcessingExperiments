
void setup() {
  size(300, 300);
}

void draw() {
  background(255);
  line(width/2, 0, width/2, height);
  line(0, height/2, width, height/2);
  if ((mouseX < width/2) && (mouseY < height/2)) {  //top left
    fill(0);
    rect(0, 0, width/2, height/2);
  }
  if ((mouseX > width/2) && (mouseY < height/2)) {  //top right
    fill(0);
    rect(width/2, 0, width/2, height/2);
  }
  if ((mouseX < width/2) && (mouseY > height/2)){  //bottom left
    fill(0);
    rect(0, height/2, width/2, height/2);
  }
  if ((mouseX > width/2) && (mouseY > height/2)){  //bottom right
    fill(0);
    rect(width/2, height/2, width/2, height/2);
  }
  
  
}
