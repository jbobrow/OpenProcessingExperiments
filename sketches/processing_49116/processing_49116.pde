
void setup() {
  
  size (640,480);
  smooth ();
  frameRate(30);
}

void draw () {
  //Draw a black background
  background (0);
  
  //Set ellipses and rects  to CENTER mode
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  //Draw Crit's body
  stroke (255);
  fill (mouseX, 0, mouseY);
  rect (mouseX, mouseY, 200, 85);
  
  //Draw Crit's head
  stroke (0);
  fill (255);
  ellipse (mouseX+100, mouseY, 100, 100);
  
  //Draw Crit's eyes
  fill(0);
  ellipse (mouseX+85, mouseY, 32, 50);
  ellipse (mouseX+115, mouseY, 32, 50);
  
  //Draw Crit's legs
  stroke (255);
  line(mouseX+20, mouseY+43, pmouseX+20, pmouseY+88);
  line(mouseX-40, mouseY+43, pmouseX-40, pmouseY+88);
  
  //Draw Crit's tail
  stroke (255);
  line(mouseX-100, mouseY, pmouseX-130, pmouseY+5);
  
  //Draw Crit's back
  stroke (255);
  fill (mouseX, 0, mouseY);
  smooth();
  triangle(mouseX-75, mouseY-80, mouseX-50, mouseY-43, mouseX-100, mouseY-43);
  triangle(mouseX-15, mouseY-80, mouseX-40, mouseY-43, mouseX+10, mouseY-43);
  triangle(mouseX+45, mouseY-80, mouseX+20, mouseY-43, mouseX+70, mouseY-43);
  
  //Draw Crit's mouth
  stroke(0);
  line(mouseX+92, mouseY+35, mouseX+108, mouseY+35);
}



