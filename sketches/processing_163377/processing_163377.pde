
int counter;

void setup() {  //setup function called initially, only once
  size(500, 500);
  background(100,205,100);  //set background white
  colorMode(RGB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {
  if (keyPressed == true) {
    fill(0);
  } else {
    fill(255);
  }
  rect(mouseX, mouseY, pmouseX,pmouseY);
}
