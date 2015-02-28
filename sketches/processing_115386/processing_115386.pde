

void setup() {
  size(350, 400);
 
}

void draw() {
  background(0, 139, 191);
  stroke(255);
  strokeWeight(2);
  line(width/2, 0, width/2, height);
  line(0, height/2, width, height/2);

  if (mousePressed == true) {
    if (mouseX < width/2 && mouseY < height/2) {
      fill(255);
      rect(0, 0, width/2, height/2);
    }
    else{
      background(0);
  }
}
}



