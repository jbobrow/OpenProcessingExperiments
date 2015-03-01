
int xPos = 30;
int yPos = 50;
int bSize = 30;


void setup(){
  size(800,600);
  background(255);
  
  noStroke();
  fill(255);
  rect(100,0,800,600);
  
  
  fill(246,150,121);
  rect(xPos, yPos, bSize, bSize);
  
  fill(249,173,129);
  rect(xPos, yPos+bSize, bSize, bSize);
  
  fill(253,198,137);
  rect(xPos, yPos+bSize+bSize, bSize, bSize);
  
  fill(255,247,153);
  rect(xPos, yPos+bSize+bSize+bSize, bSize, bSize);
  
  fill(196,223,155);
  rect(xPos,yPos+bSize+bSize+bSize+bSize, bSize, bSize);
  
  fill(130,202,156);
  rect(xPos,yPos+bSize+bSize+bSize+bSize+bSize, bSize, bSize);
  
  fill(122,204,200);
  rect(xPos,yPos+bSize+bSize+bSize+bSize+bSize+bSize, bSize, bSize);
  
  fill(109,207,246);
  rect(xPos,yPos+bSize+bSize+bSize+bSize+bSize+bSize+bSize, bSize, bSize);
  
  
  stroke(1);
  fill(255);
  rect(xPos,yPos+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize, bSize, bSize);
  
  
}


void draw(){
  if (mousePressed){
    if (mouseX > 100 && mouseX < 800 && mouseY > 0 && mouseY < 600) {
      line (pmouseX, pmouseY, mouseX, mouseY);
    }
      if (mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos && mouseY < yPos+bSize) {
      stroke(246,150,121);
      strokeWeight(3);
    }
    if (mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize && mouseY < yPos+bSize+bSize) {
      stroke(249,173,129);
      strokeWeight(3);
    }
    if (mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize+bSize && mouseY < yPos+bSize+bSize+bSize) {
      stroke(253,198,137);
      strokeWeight(3);
    }
    if (mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize+bSize+bSize && mouseY < yPos+bSize+bSize+bSize+bSize) {
      stroke(255,247,153);
      strokeWeight(3);
    }
    if (mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize+bSize+bSize+bSize && mouseY < yPos+bSize+bSize+bSize+bSize+bSize) {
      stroke(196,223,155);
      strokeWeight(3);
    }
    if (mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize+bSize+bSize+bSize+bSize && mouseY < yPos+bSize+bSize+bSize+bSize+bSize+bSize) {
      stroke(130,202,156);
      strokeWeight(3);
    }
    if (mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize+bSize+bSize+bSize+bSize+bSize && mouseY < yPos+bSize+bSize+bSize+bSize+bSize+bSize+bSize) {
      stroke(122,204,200);
      strokeWeight(3);
    }
    if (mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize+bSize+bSize+bSize+bSize+bSize+bSize && mouseY < yPos+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize) {
      stroke(109,207,246);
      strokeWeight(3);
    }
      if(mouseX < xPos+bSize && mouseX >xPos && mouseY <yPos+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize && mouseY >yPos+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize+bSize){
      stroke(255); 
      }

  }
}
