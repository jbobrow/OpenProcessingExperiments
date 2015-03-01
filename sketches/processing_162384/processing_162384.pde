
int xPos = 50;
int yPos = 100;
int s = 40;
 
void setup() {
  size(800, 600);
  background(200);
  
 
  //drawing board
  stroke(255);
  strokeWeight(2);
  noStroke();
 
  fill(255);
  rect(150, 0, 700, 550);
 
//1
  fill(202,196,145);
  rect(xPos, yPos, s, s);
//2
  fill(166,156,119);
  rect(xPos, yPos+s, s, s);
//3
  fill(139,124,94);
  rect(xPos, yPos+s*2, s, s);
//4
  fill(114,99,70);
  rect(xPos, yPos+s*3, s, s);
//5
  fill(86,70,49);
  rect(xPos, yPos+s*4, s, s);
//6
  fill(60,46,33);
  rect(xPos, yPos+s*5,s, s);
//7
  fill(46,34,23);
  rect(xPos, yPos+s*6, s, s);
//8
  fill(29,20,11);
  rect(xPos, yPos+s*7, s, s);
//9
  fill(67,63,59);
  rect(xPos, yPos+s*8, s, s);
//10
  fill(255);
  rect(xPos, yPos+s*10, s, s);
//11
  fill(0);
  rect(xPos, yPos+s*11, s, s);

   
}
 
void draw() {
 
 
  if (mousePressed) {
 
 
 
    if (790 > pmouseX && 790 > mouseX && pmouseX > 210 && mouseX > 210 &&
      590 > pmouseY && 590 > mouseY && pmouseY> 10 && mouseY> 10) {
      line(pmouseX, pmouseY, mouseX, mouseY);
    }
 
    //1
    if ( mouseX > xPos && mouseX < xPos+s && mouseY > yPos && mouseY <yPos+s) {
      stroke(202,196,145);
      strokeWeight(10);
    }
 
    //2
    if ( mouseX > xPos && mouseX < xPos+s && mouseY > yPos+s && mouseY <yPos+s*2) {
      stroke(166,156,119);
      strokeWeight(10);
    }
 
    //3
    if ( mouseX > xPos && mouseX < xPos+s && mouseY > yPos+s*2 && mouseY < yPos+s*3) {
      stroke(139,124,94);
      strokeWeight(10);
    }
    //4
    if ( mouseX > xPos && mouseX < xPos+s && mouseY > yPos+s*3 && mouseY < yPos+s*4) {
      stroke(114,99,70);
      strokeWeight(10);
    }
    //5
    if ( mouseX > xPos && mouseX < xPos+s && mouseY > yPos+s*4 && mouseY < yPos+s*5) {
      stroke(86,70,49);
      strokeWeight(10);
    }
    //6
    if ( mouseX > xPos && mouseX < xPos+s && mouseY > yPos+s*5 && mouseY < yPos+s*6) {
      stroke(60,46,33);
      strokeWeight(10);
    }
    //7
    if ( mouseX > xPos && mouseX < xPos+s && mouseY > yPos+s*6 && mouseY < yPos+s*7) {
      stroke(46,34,23);
      strokeWeight(10);
    }
    //8
    if ( mouseX > xPos && mouseX < xPos+s && mouseY > yPos+s*7 && mouseY < yPos+s*8) {
      stroke(29,20,11);
      strokeWeight(10);
    }
    //9
    if ( mouseX > xPos && mouseX < xPos+s && mouseY > yPos+s*8 && mouseY < yPos+s*9) {
      stroke(67,63,59);
      strokeWeight(10);
    }
    //10
    if ( mouseX > xPos && mouseX < xPos+s && mouseY > yPos+s*10 && mouseY < yPos+s*11) {
      stroke(255);
      strokeWeight(10);
    }
    //11
    if ( mouseX > xPos && mouseX < xPos+s && mouseY > yPos+s*11 && mouseY < yPos+s*12) {
      stroke(0);
      strokeWeight(10);
    }
  }
}

