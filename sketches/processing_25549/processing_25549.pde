
float black = 0;

void setup() {
  size(400,300);
  background(255);
  smooth();
}

void draw() {
  PImage img;
  img = loadImage("logo.png");
  cursor (HAND);
  
  if(mousePressed==true) {
    image(img,mouseX,mouseY);
  }
}
  
void keyPressed() {
  if (key == ' ') {
    background(black);
  } else {
  background(255);
  }
  if (key == CODED) {
    if (keyCode == UP) {
      black += 15;
    } else if (keyCode == DOWN) {
      black -= 15;
    }
  }
}

