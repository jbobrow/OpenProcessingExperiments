
//2014.09.17
/*Create a drawing board with at least 8 buttons. 
 Design an intuitive interface for the users, 
 and before you start think how pleasurable the activity of drawing can be, 
 and what kind of results you expect from the users.*/


int xPos = 100;
int yPos = 60;
int bSize = 60;

void setup() {
  size(760, 600);
  background(201);

  //drawing board
  fill(255);
  stroke(255);
  strokeWeight(2);
  rect(160, 0, 600, 600);

  //buttons 
  fill(255, 0, 0);
  rect(xPos, yPos, bSize, bSize);
  fill(255, 255, 0);
  rect(xPos, yPos+bSize, bSize, bSize);
  fill(132,29,229);
  rect(xPos, yPos+bSize*2, bSize, bSize);
  fill(255);
  rect(25, yPos+bSize*3, bSize, bSize);
   fill(248,192,207);
  rect(xPos, yPos+bSize*4, bSize, bSize);
    fill(35,134,240);
  rect(xPos, yPos+bSize*5, bSize, bSize);
    fill(255,163,24);
  rect(xPos, yPos+bSize*6, bSize, bSize);
   fill(54,203,0);
  rect(xPos, yPos+bSize*7, bSize, bSize);
  
}

void draw() {

  if (mousePressed) {

    //brush 
    if (790 > pmouseX && 790 > mouseX && pmouseX > 210 && mouseX > 210 && 
      590 > pmouseY && 590 > mouseY && pmouseY> 10 && mouseY> 10) {
      line(pmouseX, pmouseY, mouseX, mouseY);
            strokeWeight(10);

    }


    //red, 
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos && mouseY <yPos+bSize) {
      stroke(255, 0, 0);
      strokeWeight(10);
    }
    //yellow
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize && mouseY <yPos+bSize+bSize) {
      stroke(255, 255, 0);
      strokeWeight(10);
    }


    //purple -  you can use this as an eraser.
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize+bSize && mouseY < yPos+bSize+bSize+bSize) {
      stroke(132,29,229);
      strokeWeight(10);
      
    }
  //white
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize+bSize+bSize && mouseY <yPos+bSize+bSize+bSize+bSize) {
      stroke(255);
      strokeWeight(20);
    }

  //pink
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize+bSize+bSize+bSize && mouseY <yPos+bSize+bSize+bSize+bSize+bSize) {
      stroke(248,192,207);
      strokeWeight(20);
    }
  //blue
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize+bSize+bSize+bSize+bSize && mouseY <yPos+bSize+bSize+bSize+bSize+bSize+bSize) {
      stroke(35,134,240);
      strokeWeight(20);
    }
  //orange
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize+bSize+bSize+bSize+bSize+bSize && mouseY <yPos+bSize+bSize+bSize+bSize+bSize+bSize+bSize) {
      stroke(255,163,24);
      strokeWeight(20);
    }
    
     //green
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize+bSize+bSize+bSize+bSize+bSize+bSize && mouseY <yPos+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize) {
      stroke(54,203,0);
      strokeWeight(20);
    }
    
    

  }
}

