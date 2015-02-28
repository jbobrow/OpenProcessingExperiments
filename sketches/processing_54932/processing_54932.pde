
void setup() {
  size(480, 480);
}

void draw() {
  if (mousePressed) {
fill(255,0,0,63);
} else {
background(255);
}
  ellipse(mouseX, mouseY+25, 80, 100); // back body
  ellipse(mouseX, mouseY, 80, 80); //front body
  ellipse(mouseX, mouseY-70, 60, 60); // head
  ellipse(mouseX-10, mouseY-80, 6, 6); // eye 1
  ellipse(mouseX+10, mouseY-80, 6, 6); // eye 2
  rect(mouseX-20, mouseY+80, 15, 6); // foot 1
  rect(mouseX+10, mouseY+80, 15, 6); // foot 2
  rect(mouseX-15, mouseY+37, 6, 49); // leg 1
    rect(mouseX+13, mouseY+37, 6, 49); //leg 2
    line(mouseX-10, mouseY-40, 120, 120); // lead
  ellipse(mouseX, mouseY-60, 25, 25); //nozzle
  ellipse(mouseX, mouseY-60, 5, 5); //nose
  ellipse(mouseX-30, mouseY-60, 10, 50); //ear 1
  ellipse(mouseX+30, mouseY-60, 10, 50); //ear 2
  
  ellipse(mouseX-30, mouseY+70, 15, 15); //back foot 1
  ellipse(mouseX+30, mouseY+70, 15, 15); //back foot 2  
}

