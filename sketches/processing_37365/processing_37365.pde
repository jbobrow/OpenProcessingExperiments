
void setup() {
  size(400, 400);
  colorMode(HSB, width, 180, width);// color of lines
}

void draw() {
  background(0);
  for (int x=0; x<400; x+=5) { //spacing of the bars and color controlled by mouseY
    stroke(mouseY, x, width);
    line(x, 20, x, 300);
  }
  for (int x=5; x<390; x+=10) { //repeated ellipse 
    ellipse(x, 10, x, 390);
  }
}


