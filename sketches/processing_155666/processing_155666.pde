
void setup() {
  size (600, 400);
 
}

void draw () {
  background (20, 255, 100);
  rectMode (CENTER);
  noStroke ();
  fill (20, 50, 190);
  rect (mouseX, mouseY, 80, 80);
  
  //feet
  stroke (0);
  strokeWeight (2);
  line (mouseX-20, mouseY+40, mouseX-pmouseX, mouseY-pmouseY);
  line (mouseX+20, mouseY+40, mouseX+pmouseX, mouseY+pmouseY);
  
  //body
  strokeWeight(1);
  fill (mouseX, mouseY, 255);
  ellipse (mouseX-20, mouseY-20, 20, 20);
  ellipse (mouseX+20, mouseY-20, 20, 20);
  fill(0);
  ellipse (mouseX-20, mouseY-20, 4, 4);
  ellipse (mouseX+20, mouseY-20, 4, 4);
  
  //eyebrows
  line (mouseX-10, mouseY-30, mouseX-20, mouseY-50);
  line (mouseX+10, mouseY-30, mouseX+20, mouseY-50);  
  
 
}


