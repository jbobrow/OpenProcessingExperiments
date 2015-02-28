



void setup() {
  size(500, 500);
  background(200, 200, 200);
  fill(0, 0, 0); 
  println("l=rect, r=mousepaint, click=erase");
}



void draw() {

  if (keyPressed==true) {
    if (key=='l')
      ellipse(50, 50, 50, 50);
  }

  if (keyPressed==true) {
    if (key=='r')
      rect(mouseX, mouseY, 50, 50);
  }

  if (mousePressed==true) {
    background(200, 200, 200);
  }
}


