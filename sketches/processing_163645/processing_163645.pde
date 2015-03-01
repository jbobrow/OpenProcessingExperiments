
//emancdf
//fall 2013
//L2: dynamic

void setup() {
  size(600, 300);
  noStroke();
}

void draw() {
  if (mousePressed) {
    fill(0, 0, mouseX);
  } else {
    fill(mouseX,0,0);
  }
  ellipse(mouseX, mouseY, 100, 100);
  
   // save your drawing when you press keyboard 'm'
  if (keyPressed == true && key=='m') {
    saveFrame("mycircles.jpg");
  }

  // clear your drawing when you press keyboard 'd'
  if (keyPressed == true && key == 'd') {
     background(255);
  }
  
}



