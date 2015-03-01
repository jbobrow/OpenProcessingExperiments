
int xPos= 75;
int yPos=75;
int bSize = 30;
int a = 30;

void setup() {
  size(800, 600);
  background(300,255,255);
  fill(0);
  rect(200, 0, 600, 600);
  fill(255, 0, 0);
  rect(xPos, yPos, bSize, bSize);
  fill(0, 0, 255);
  rect(xPos, yPos+30, bSize, bSize);
  fill(255, 255, 0);
  rect(xPos, yPos+30+30, bSize, bSize);
  fill(150);
  rect(xPos, yPos+30+30+30, bSize, bSize);
   
  fill(107, 203, 122);
  rect(xPos, yPos+4*a, a, a);
 
  fill(194, 100, 229);
  rect(xPos, yPos+5*a, a, a);
 
  fill(226, 240, 123);
  rect(xPos, yPos+6*a, a, a);
 
  fill(118, 229, 226);
  rect(xPos, yPos+7*a, a, a);
   
    fill(315,112,3);
  rect(xPos, yPos+8*a, a, a);
   
      fill(255,52,154);
  rect(xPos, yPos+9*a, a, a);

}

void draw() {
  if (mousePressed) {
    if (800>mouseX && mouseX>220 && mouseY >0 ==true) {

      line(pmouseX, pmouseY, mouseX, mouseY);
    }
    if (mouseX>75 && mouseX < 105 && mouseY > 75 && mouseY < 105) {

      stroke(255, 0, 0);
      strokeWeight(5);
    }
    if (mouseX>75 && mouseX < 105 && mouseY > 105 && mouseY < 135) {

      stroke(0, 0, 255);
      strokeWeight(5+10);
    }
    if (mouseX>75 && mouseX < 105 && mouseY > 135 && mouseY < 165) {

      stroke(255, 255, 0);
      strokeWeight(5+10+10);
    }
    if (mouseX>75 && mouseX < 105 && mouseY > 165 && mouseY < 195) {

      stroke(150);
      strokeWeight(5+10+10);
    }
    if (mouseX > xPos && mouseX < xPos+a && mouseY > yPos+5*a && mouseY < yPos+6*a) {
      stroke(194, 100, 229);
      strokeWeight(5);
    }
    if (mouseX > xPos && mouseX < xPos+a && mouseY > yPos+6*a && mouseY < yPos+7*a) {
      stroke(206, 240, 123);
      strokeWeight(5);
    }
    if (mouseX > xPos && mouseX < xPos+a && mouseY > yPos+7*a && mouseY < yPos+8*a) {
      stroke(118, 229, 226);
      strokeWeight(5);
    }
    if (mouseX > xPos && mouseX < xPos+a && mouseY > yPos+8*a && mouseY < yPos+9*a) {
      stroke(255, 112, 3);
      strokeWeight(5);
    }
    if (mouseX > xPos && mouseX < xPos+a && mouseY > yPos+9*a && mouseY < yPos+10*a) {
      stroke(255, 52, 154);
      strokeWeight(5);
    }
    if (mouseX > 25 && mouseX < 105 && mouseY > 510 && mouseY < 550) {
      stroke(255, 255, 255);
      strokeWeight(10);
    }
  }
}

