

int xPos = 35;
int yPos = 50;
int xPos2 = 100;
int bSize = 30;

void setup() {
  size(800, 600);
  background(240);

  //drawing board
  fill(255);
  noStroke();
  rect(100, 10, 690, 580);

  //buttons 
  
  //red
  fill(255, 102, 102);
  rect(xPos, yPos, bSize, bSize);
  
  //orange
  fill(255, 178, 102);
  rect(xPos, yPos+bSize, bSize, bSize);
  
  //yellow
  fill(255, 255, 102);
  rect(xPos, yPos+bSize*2, bSize, bSize);
  
  //lightgreen
  fill(178, 255, 102);
  rect(xPos, yPos+bSize*3, bSize, bSize);
  
  //green
  fill(102, 255, 102);
  rect(xPos, yPos+bSize*4, bSize, bSize);
  
  //blue
  fill(102, 178, 255);
  rect(xPos, yPos+bSize*5, bSize, bSize);
  
  //purble
  fill(178, 102, 255);
  rect(xPos, yPos+bSize*6, bSize, bSize);
  
  //pink
  fill(255, 102, 178);
  rect(xPos, yPos+bSize*7, bSize, bSize);
  
  //lightpink
  fill(255, 190, 205);
  rect(xPos, yPos+bSize*8, bSize, bSize);
  
  //grey colors
  
  //black
  fill(0);
  rect(xPos, yPos+bSize*10, bSize, bSize);
  
  //darkgrey
  fill(100);
  rect(xPos, yPos+bSize*11, bSize, bSize);
  
  //lightgrey
  fill(200);
  rect(xPos, yPos+bSize*12, bSize, bSize);
  
  //white
  fill(255);
  rect(xPos, yPos+bSize*13, bSize, bSize);


  
  
}

void draw() {

  if (mousePressed) {

    //brush 
    if (790 > pmouseX && 790 > mouseX && pmouseX > 110 && mouseX > 110 && 
      590 > pmouseY && 590 > mouseY && pmouseY> 10 && mouseY> 10) {
      line(pmouseX, pmouseY, mouseX, mouseY);
    }


    //red, 
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos && mouseY <yPos+bSize) {
      stroke(255, 102, 102);
      strokeWeight(5);
    }
    
    //orange
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize && mouseY <yPos+bSize+bSize) {
      stroke(255, 178, 102);
      strokeWeight(5);
    }
    
    //yellow
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize+bSize && mouseY <yPos+bSize+bSize+bSize) {
      stroke(255, 255, 102);
      strokeWeight(5);
    }
    
    //lightgreen
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize+bSize+bSize && mouseY <yPos+bSize+bSize+bSize+bSize) {
      stroke(178, 255, 102);
      strokeWeight(5);
    }

  //green
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize+bSize+bSize+bSize && mouseY <yPos+bSize+bSize+bSize+bSize+bSize) {
      stroke(102, 255, 102);
      strokeWeight(5);
    }
    
   //blue
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize+bSize+bSize+bSize+bSize && mouseY <yPos+bSize+bSize+bSize+bSize+bSize+bSize) {
      stroke(102, 178, 255);
      strokeWeight(5);
    }
    
     //purple
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize+bSize+bSize+bSize+bSize+bSize && mouseY <yPos+bSize+bSize+bSize+bSize+bSize+bSize+bSize) {
      stroke(178, 102, 255);
      strokeWeight(5);
    }
    
      //pink
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize+bSize+bSize+bSize+bSize+bSize+bSize && mouseY <yPos+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize) {
      stroke(255, 102, 178);
      strokeWeight(5);
    }
    
      //lightpink
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize && mouseY <yPos+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize) {
      stroke(255, 190, 205);
      strokeWeight(5);
    }
    
        //black
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize*10 && mouseY <yPos+bSize*11) {
      stroke(0);
      strokeWeight(5);
    }
    
        //darkgrey
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize*11 && mouseY <yPos+bSize*12) {
      stroke(100);
      strokeWeight(5);
    }
    
       //lightgrey
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize*12 && mouseY <yPos+bSize*13) {
      stroke(200);
      strokeWeight(5);
    }
    
        //white
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize*13 && mouseY <yPos+bSize*14) {
      stroke(255);
      strokeWeight(15);
    }

  }
}

