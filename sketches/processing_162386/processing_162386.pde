
int xPos = 35;
int yPos = 60;
int bSize = 30;


void setup() {
  size(600, 600);
  background(240);

 fill(255);
  noStroke();
  rect(100, 50, 470, 510);
  //1
  fill(149,205,139);
  rect(xPos, yPos, bSize, bSize);
  //2
  fill(255,243,122);
  rect(xPos, yPos+bSize, bSize, bSize);
  //3
  fill(246,150,125);
  rect(xPos, yPos+bSize*2, bSize, bSize);
//4
  fill(252,221,124);
  rect(xPos, yPos+bSize*3, bSize, bSize);
   //5
  fill(231,104,93);
  rect(xPos,yPos+bSize*4, bSize, bSize);
   //6
  fill(130,202,156);
  rect(xPos,yPos+bSize*5, bSize, bSize);
   //7
  fill(252,216,209);
  rect(xPos,yPos+bSize*6, bSize, bSize);
   //8
  fill(143,108,86);
  rect(xPos,yPos+bSize*7, bSize, bSize);
  //9
  fill(255);
  rect(xPos,yPos+bSize*9, bSize, bSize);


   


}

void draw() {
 if (mousePressed){
    if (mouseX > 100 && mouseX < 570 && mouseY > 50 && mouseY < 570) {
      line (pmouseX, pmouseY, mouseX, mouseY);
    }
//1
if (mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos && mouseY < yPos+bSize) {
      stroke(149,205,139);
      strokeWeight(0.5);
    }
    //2
if (mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize && mouseY < yPos+bSize*2) {
      stroke(255,243,122);
      strokeWeight(1);
    }
    //3
    if (mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize*2 && mouseY < yPos+bSize*3) {
      stroke(246,150,125);
      strokeWeight(2);
    }
    //4
    if (mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize*3 && mouseY < yPos+bSize*4) {
      stroke(252,221,124);
      strokeWeight(3);
    }
    //5
    if (mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize*4 && mouseY < yPos+bSize*5) {
      stroke(231,104,93);
      strokeWeight(4);
    }
    //6
    if (mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize*5 && mouseY < yPos+bSize*6) {
      stroke(130,202,156);
      strokeWeight(5);
    }
    //7
    if (mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize*6 && mouseY < yPos+bSize*7) {
      stroke(252,216,209);
      strokeWeight(8);
    }
    //8
    if (mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize*7 && mouseY < yPos+bSize*8) {
      stroke(143,108,86);
      strokeWeight(12);
    }
      if(mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize*9 && mouseY < yPos+bSize*10){
      stroke(255);
      strokeWeight(20);
      }
  }

 }
 
 
