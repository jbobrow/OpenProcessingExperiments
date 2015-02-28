
// Click on the image to give it focus,
// and then press any key

int value = 0;


void setup() {
  size(300, 300);
  background(0,255,0); // always draw the background inside void setup
}

void draw() {
  fill(value);
  
}

void keyPressed() {
  if (key =='j') {
    value = 255;
  } else {
    value = 0;
  }  if (key =='i') {
  ellipse(mouseX, mouseY, 100, 50);
  
}
  
  /*void keyPressed() {
  if (key =='j') {
  ellipse(mouseX, mouseY, 100, 50);
  
}*/

  
}
  


