
void setup() {
  size(400, 400);
}

void draw() {
  background(8, 216, 255);
  fill(0);
  stroke(246, 255, 8);


  for (int x=10; x<=width; x=x+20) {
    strokeWeight (2);
    line (x, 0, width, height);
  }

  for (int y=10; y<=width; y=y+20) {
    strokeWeight (2);
    line (0,y, width, height);
  }




  if (mousePressed) {

    for (int b=0; b<=height; b=b+int (random(0, 20))) {
      strokeWeight (random (1, 3));

      for (int a=0; a<=width; a=a+20) {
        line (mouseX+a, mouseY+b, width, height);
      }
    }
  }
}
