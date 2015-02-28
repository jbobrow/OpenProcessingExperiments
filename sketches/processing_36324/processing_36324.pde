
void setup() {
  size (300, 300);
  colorMode(HSB, 500, 300, 60, 90);
  background(width, height, 500, 200);
}
int x=0;

void draw() {
  stroke(0, mouseX, mouseY);
  line(100, 100, mouseX, mouseY);
  line(200, 200, mouseX, mouseY);
  line(150, 150, mouseX, mouseY);
  x++;
  fill(x);//Fill of ellipses gradients down from black to transparent
  ellipse(mouseX, mouseY, 100, 100);
}

int circleSize=10;

void mouseClicked() {

  background(800, 98, 788);
  fill(0);

  ellipse(width/2, height/2, 
  circleSize, circleSize);
  circleSize++;
}
void mouseReleased() {//Background color change if the following occurs:


  if (mouseX < width/2) {
    background(255);
  }
  else {
    background(x*2);
  }
}




