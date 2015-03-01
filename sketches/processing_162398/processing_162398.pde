
int xPos = 35;
int yPos = 50;
int xPos2 = 100;
int bSize = 30;
 
void setup() {
  size(600, 600);
  background(#ebebeb);
 
  //drawing board
  fill(255,255,255);
  noStroke();
  rect(100, 10, 490, 580);
 
  //buttons
   
  
  fill(#fffae4);
  rect(xPos, yPos, bSize, bSize);
   
  
  fill(#fff3c5);
  rect(xPos, yPos+bSize, bSize, bSize);
   
  
  fill(#ffe788);
  rect(xPos, yPos+bSize*2, bSize, bSize);
   
  
  fill(#ffdd54);
  rect(xPos, yPos+bSize*3, bSize, bSize);
   
  
  fill(#ffd21f);
  rect(xPos, yPos+bSize*4, bSize, bSize);
   
  
  fill(#ebbc00);
  rect(xPos, yPos+bSize*5, bSize, bSize);
   
  
  fill(#d8ad00);
  rect(xPos, yPos+bSize*6, bSize, bSize);
   
 
  fill(#b28e00);
  rect(xPos, yPos+bSize*7, bSize, bSize);
   
  
  fill(#876c00);
  rect(xPos, yPos+bSize*8, bSize, bSize);
   

 
   
   
}
 
void draw() {
 if(mouseButton == RIGHT){
background(255);
 }
  if (mousePressed) {
 
    //brush
    if (590 > pmouseX && 590 > mouseX && pmouseX > 100 && mouseX > 110 &&
      590 > pmouseY && 590 > mouseY && pmouseY> 10 && mouseY> 10) {
      line(pmouseX, pmouseY, mouseX, mouseY);
    }
 
 
    
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos && mouseY <yPos+bSize) {
      stroke(#fffae4);
      strokeWeight(10);
    }
     
   
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize && mouseY <yPos+bSize+bSize) {
      stroke(#fff3c5);
      strokeWeight(10);
    }
     
    
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize+bSize && mouseY <yPos+bSize+bSize+bSize) {
      stroke(#ffe788);
      strokeWeight(10);
    }
     
    
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize+bSize+bSize && mouseY <yPos+bSize+bSize+bSize+bSize) {
      stroke(#ffdd54);
      strokeWeight(10);
    }
 
  
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize+bSize+bSize+bSize && mouseY <yPos+bSize+bSize+bSize+bSize+bSize) {
      stroke(#ffd21f);
      strokeWeight(10);
    }
     
 
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize+bSize+bSize+bSize+bSize && mouseY <yPos+bSize+bSize+bSize+bSize+bSize+bSize) {
      stroke(#ebbc00);
      strokeWeight(10);
    }
     
     
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize+bSize+bSize+bSize+bSize+bSize && mouseY <yPos+bSize+bSize+bSize+bSize+bSize+bSize+bSize) {
      stroke(#d8ad00);
      strokeWeight(10);
    }
     
     
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize+bSize+bSize+bSize+bSize+bSize+bSize && mouseY <yPos+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize) {
      stroke(#b28e00);
      strokeWeight(10);
    }
     
      
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize && mouseY <yPos+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize) {
      stroke(#876c00);
      strokeWeight(10);
    }
     
   
     

  }
}

