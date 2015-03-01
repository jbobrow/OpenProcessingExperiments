
int xPos = 12;
int yPos = 40;
int bSize = 26;
 
 
void setup() {
  size(600, 600);
  background(60);
 
 fill(20);
  noStroke();
  rect(50, 0, 600, 600);
  
  fill(255, 54, 54);
  rect(xPos, yPos, bSize, bSize);
  
  fill(255, 116, 100);
  rect(xPos, yPos+bSize, bSize, bSize);
  
  fill(255, 165, 155);
  rect(xPos, yPos+bSize*2, bSize, bSize);


  fill(52, 93, 255);
  rect(xPos, yPos+bSize*7, bSize, bSize);
  
  fill(90, 124, 255);
  rect(xPos, yPos+bSize*8, bSize, bSize);
  
  fill(131, 157, 255);
  rect(xPos, yPos+bSize*9, bSize, bSize);

  
  fill(136, 211, 26);
  rect(xPos, yPos+bSize*14, bSize, bSize);
  
  fill(176, 240, 82);
  rect(xPos, yPos+bSize*15, bSize, bSize);
  
  fill(213, 255, 152);
  rect(xPos, yPos+bSize*16, bSize, bSize);
 
 
  fill(20);
  rect(xPos, yPos+bSize*20, bSize, bSize);

 
 
 
    
 
 
}
 
void draw() {
 if (mousePressed){
    if (mouseX > 55 && mouseX < 600 && mouseY > 0 && mouseY < 600) {
      line (pmouseX, pmouseY, mouseX, mouseY);
    }

if (mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos && mouseY < yPos+bSize) {
      stroke(255, 54, 54);
      strokeWeight(10);
    }
    
if (mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize && mouseY < yPos+bSize*2) {
      stroke(255, 116, 100);
      strokeWeight(7);
    }
    
    if (mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize*2 && mouseY < yPos+bSize*3) {
      stroke(255, 165, 155);
      strokeWeight(4);
    }
    
    
    
    if (mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize*7 && mouseY < yPos+bSize*8) {
      stroke(52, 93, 255);
      strokeWeight(10);
    }
    
    if (mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize*8 && mouseY < yPos+bSize*9) {
      stroke(90 ,124, 255);
      strokeWeight(7);
    }
    
    if (mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize*9 && mouseY < yPos+bSize*10) {
      stroke(131, 157, 255);
      strokeWeight(4);
    }
    
    
    
    if (mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize*14 && mouseY < yPos+bSize*15) {
      stroke(136, 211, 26);
      strokeWeight(10);
    }
    
    if (mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize*15 && mouseY < yPos+bSize*16) {
      stroke(176, 240, 82);
      strokeWeight(7);
    }
      if(mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize*16 && mouseY < yPos+bSize*17){
      stroke(213, 255, 152);
      strokeWeight(4);
    }
      if (mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize*20 && mouseY < yPos+bSize*21) {
      stroke(20);
      strokeWeight(50);
    }
  }
 
 }

