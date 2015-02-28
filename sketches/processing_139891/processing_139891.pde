
void setup() {
  //'setup' is like the 'head' function of html.
  size(480, 480);
  /*This 'size' function lets you change the size of the 
  viewer box where the monster resides.*/
}

void draw() {
  if (mousePressed) {
    fill(0);
  } else {
    fill(255);
  rect(mouseX-32, mouseY-25, 65, 50);
  rect(mouseX-11, mouseY+25, 22, 40);
  rect(mouseX-23, mouseY+35, 12, 7);
  rect(mouseX+11, mouseY+35, 12, 7);
  rect(mouseX-8, mouseY+65, 7, 7);
  rect(mouseX+1, mouseY+65, 7, 7);
  }
  ellipse(mouseX+15, mouseY, 15, 20);
  ellipse(mouseX-15, mouseY, 15, 20);
  /*The lines above tell processing that if (for mouse 
  pressed scenario) make the shapes given below a white color 
  for fill(0), and 'if else' (aka the mouse is pressed) make 
  the shapes given below a black color.*/
}


