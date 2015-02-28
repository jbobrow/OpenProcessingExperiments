
float posX=50, posY=100;
float squareSize=100;
boolean isInside = false;
void setup() {
  size(500, 500);
  background(255);
}
void draw() {
  //background(255);
  fill(0, 0, 255,10);
  //if(isInside==true){ is the same as
  if(isInside){//since by default we test for "true"
    posX=mouseX-squareSize/2;
    posY=mouseY-squareSize/2;
  }
  rect(posX, posY, squareSize, squareSize);
}

void mousePressed() {
  //track if mouse has been pressed inside the square
  //we need to check if mouse is between left and right of square
  //we need to check if mouse is between top and bottom of square
  //if(mouseX>left && mouseX<right && mouseY>top && mouseY <bottom)
  if (mouseX>posX && mouseX<posX+squareSize &&
    mouseY>posY && mouseY<posY+squareSize) {
    isInside = true;
    println("click");
  }
}

void mouseReleased(){
  isInside = false;
}



