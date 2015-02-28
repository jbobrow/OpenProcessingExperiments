
boolean xPrint_NW = true;
boolean xPrint_NE = true;
boolean xPrint_SW = true;
boolean xPrint_SE = true;
void setup() {
  size(600, 600);
  smooth();
}
void draw() {
  float m = millis();
  background(#FFFFFF);
  if (pmouseX !=0 && pmouseY !=0 && m != 0) {
    if (mouseX < width/2 && mouseY < height/2) {
      fill (#000000);
      rect(0, 0, width/2, height/2);
      if (xPrint_NW) {
        println("You are in the NW corner. :)");
        xPrint_NW = false;
      }
    }
    if ((mouseX > width/2 || mouseY > height/2) && !xPrint_NW) {
      xPrint_NW = true;
    }
    if (mouseX > width/2 && mouseY < height/2) {
      fill (#000000);
      rect(width/2, 0, width, height/2);
      if (xPrint_NE) {
        println("You are in the NE corner. :)");
        xPrint_NE = false;
      }
    }
    if ((mouseX < width/2 || mouseY > height/2) && !xPrint_NE) {
      xPrint_NE = true;
    }
    if (mouseX < width/2 && mouseY > height/2) {
      fill (#000000);
      rect(0, height/2, width/2, height);
      if (xPrint_SW) {
        println("You are in the SW corner. :)");
        xPrint_SW = false;
      }
    }
    if ((mouseX > width/2 || mouseY < height/2) && !xPrint_SW) {
      xPrint_SW = true;
    }
    if (mouseX > width/2 && mouseY > height/2) {
      fill (#000000);
      rect(width/2, height/2, width, height);
      if (xPrint_SE) {
        println("You are in the SE corner. :)");
        xPrint_SE =false;
      }
    }
    if ((mouseX < width/2 || mouseY < height/2) && !xPrint_SE) {
      xPrint_SE = true;
    }
  }
}


