
//2014.09.17
/*Create a drawing board with at least 8 buttons. 
 Design an intuitive interface for the users, 
 and before you start think how pleasurable the activity of drawing can be, 
 and what kind of results you expect from the users.*/


int xPos = 75;
int yPos = 75;
int bSize = 30;

void setup() {
  size(800, 600);
  background(238, 238, 238);

  //drawing board
  fill(192, 192, 192);
  rect(200, 0, 600, 600);

  //buttons 
  //1
  fill(15, 246, 138);
  rect(xPos, yPos, bSize, bSize);
 
  //2
  fill(255, 255, 0);
  rect(xPos, yPos+bSize, bSize, bSize);
  
  //3
  fill(90, 76, 218);
  rect(xPos, yPos+bSize*2, bSize, bSize);
 
  //4
  fill(119, 0, 255);
  rect(xPos, yPos+bSize*3, bSize, bSize);
  //5
  fill(102, 193, 255);
  rect(xPos, yPos+bSize*4, bSize, bSize);
 
  //6 
  fill(255, 0, 0);
  rect(xPos, yPos+bSize*5, bSize, bSize);
  

}

void draw() {

  if (mousePressed) {

    //brush 
    if (790 > pmouseX && 790 > mouseX && pmouseX > 210 && mouseX > 210 && 
      590 > pmouseY && 590 > mouseY && pmouseY> 10 && mouseY> 10) {
      line(pmouseX, pmouseY, mouseX, mouseY);
    }


    //1, 
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos && mouseY <yPos+bSize) {
      stroke(15, 246, 138);
      strokeWeight(50);
    }
    //2
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize && mouseY <yPos+bSize+bSize) {
      stroke(255, 255, 0);
      strokeWeight(10);
    }

    //3 -  you can use this as an eraser.
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize+bSize && mouseY < yPos+bSize+bSize+bSize) {
      stroke(90, 76, 218);
      strokeWeight(20);
    }
    
    //4
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize+bSize+bSize && mouseY < yPos+bSize+bSize+bSize+bSize) {
      stroke(119, 0, 255);
      strokeWeight(20);
    }
    
    //5
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize+bSize+bSize+bSize && mouseY < yPos+bSize+bSize+bSize+bSize+bSize) {
      stroke(102, 193, 255);
      strokeWeight(20);
    }
    
    //6
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize+bSize+bSize+bSize+bSize && mouseY < yPos+bSize+bSize+bSize+bSize+bSize+bSize) {
      stroke(255, 0, 0);
      strokeWeight(60);
    }
    
    
    
    
  }
}
