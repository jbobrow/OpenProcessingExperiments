
int xPos = 260;
int yPos = 530;
int bSize = 35;
 
 float r = random(255);
 float rrr = random(255);
 float rr = random(255);
void setup() {
  
 
  stroke(rrr,rr,r);
  strokeWeight(20);
  size(800, 600);
  background(r, rrr, rr);

 
  //drawing board
  fill(255);
  rect(0, 0, 800, 500);
 
  //buttons
  stroke(255);
  noStroke();
  fill(255);
  rect(xPos-bSize*2, yPos, bSize, bSize);
  fill(rr+20);
  rect(xPos, yPos, bSize, bSize);
  fill(rr*0.3);
  rect(xPos+bSize, yPos, bSize, bSize);
  fill(rr+100);
  rect(xPos+bSize*2, yPos, bSize, bSize);
  fill(rr+30);
  rect(xPos+bSize*3, yPos, bSize, bSize);
  fill(rr-100);
  rect(xPos+bSize*4, yPos, bSize, bSize);
  fill(rr-20);
  rect(xPos+bSize*5, yPos, bSize, bSize);
  fill(rr*0.5);
  rect(xPos+bSize*6, yPos, bSize, bSize);
  fill(rr+50);
  rect(xPos+bSize*7, yPos, bSize, bSize);
  fill(0);
  rect(xPos+bSize*9, yPos, bSize, bSize);
  stroke(0);
  
}
 
void draw() {
 
  if (mousePressed) {
    
    float r = random(255);
    float rr = random(255);
    
 
    //brush
    if (790 > pmouseX && 790 > mouseX && pmouseX > 10 && mouseX > 10 &&
      490 > pmouseY && 490 > mouseY && pmouseY> 10 && mouseY> 10) {
      line(pmouseX, pmouseY, mouseX, mouseY);
    }
 
 
   if ( mouseX > xPos-bSize*2 && mouseX < xPos-bSize && mouseY > yPos && mouseY <yPos+bSize) {
      stroke(255);
      strokeWeight(7);
        
    }
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos && mouseY <yPos+bSize) {
      strokeWeight(3);
      stroke(r, r*10, r*3);
      fill(r, r*10, r*3);
      rect(xPos, yPos, bSize, bSize);
     
      
    }
    //yellow
    if ( mouseX > xPos+bSize && mouseX < xPos+bSize+bSize && mouseY > yPos && mouseY <yPos+bSize) {
      stroke(r+10, r*0.5, r*5);
      strokeWeight(3);
      fill(r+10, r*0.5, r*5);
      rect(xPos+bSize, yPos, bSize, bSize);
    }
 
    //grey -  you can use this as an eraser.
    if ( mouseX > xPos+bSize+bSize && mouseX < xPos+bSize+bSize+bSize && mouseY > yPos && mouseY < yPos+bSize) {
      stroke(rr, r, 0);
      strokeWeight(3);
      fill(rr, r, 0);
      rect(xPos+bSize*2, yPos, bSize, bSize);
    }
 
    if ( mouseX > xPos+bSize*3 && mouseX < xPos+bSize*4 && mouseY > yPos && mouseY < yPos+bSize) {
      stroke(r, 0, r*0.5);
      strokeWeight(3);
      fill(r, 0, r*0.5);
      rect(xPos+bSize*3, yPos, bSize, bSize);
    }
    if ( mouseX > xPos+bSize*4 && mouseX < xPos+bSize*5 && mouseY > yPos && mouseY < yPos+bSize) {
      stroke(50, r+20, r*0.8);
      strokeWeight(3);
      fill(50, r+20, r*0.8);
      rect(xPos+bSize*4, yPos, bSize, bSize);
    }
    if ( mouseX > xPos+bSize*5 && mouseX < xPos+bSize*6 && mouseY > yPos && mouseY < yPos+bSize) {
      stroke(0, r+10, 120+r*0.2);
      strokeWeight(3);
      fill(0, r+10, 120+r*0.2);
      rect(xPos+bSize*5, yPos, bSize, bSize);
    }
    if ( mouseX > xPos+bSize*6 && mouseX < xPos+bSize*7 && mouseY > yPos && mouseY < yPos+bSize) {
      stroke(255 ,30+r,r*0.1);
      strokeWeight(3);
      fill(255 ,30+r,r*0.1);
      rect(xPos+bSize*6, yPos, bSize, bSize);
    }
    if ( mouseX > xPos+bSize*7 && mouseX < xPos+bSize*8 && mouseY > yPos && mouseY < yPos+bSize) {
      stroke(255 ,r-70,r*0.95);
      strokeWeight(3);
      fill(255 ,r-70,r*0.95);
      rect(xPos+bSize*7, yPos, bSize, bSize);
    }
      if ( mouseX > xPos+bSize*9 && mouseX < xPos+bSize*20 && mouseY > yPos && mouseY < yPos+bSize) {
      stroke(0);
      strokeWeight(7);
    }
  }
}

