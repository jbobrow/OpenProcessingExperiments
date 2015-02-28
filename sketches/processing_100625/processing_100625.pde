
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  counter = 0;
}
void draw() {
counter++;
if(mousePressed == true) {
ellipse(mouseX, mouseY, 20, 50);
}


// Click within the image and press
// the left and right mouse buttons to 
// change the value of the rectangle
void draw() {
  if (mousePressed && (mouseButton == LEFT)) {
    fill(0);
  } else if (mousePressed && (mouseButton == RIGHT)) {
    fill(255);
  } else {
    fill(126);
  }
  rect(25, 25, 50, 50);
}
