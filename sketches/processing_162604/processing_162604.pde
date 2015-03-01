
int xPos = 60;
int yPos = 60;
int s = 40;
 
 
void setup() {
  noStroke();
  size(800, 600);
  background(220,220,220);
  
  
  fill(250);
  stroke(20,0,0,0);
  rect(150, 20, 630, 560);
 
  fill(250, 0, 0);
  rect(xPos, yPos, s, s);
 
  fill(242, 101, 34);
  rect(xPos, yPos+s, s, s);
 
  fill(253, 198, 137);
  rect(xPos, yPos+2*s, s, s);
 
  fill(255, 247, 153);
  rect(xPos, yPos+3*s, s, s);
 
  fill(255, 242, 0);
  rect(xPos, yPos+4*s, s, s);
 
  fill(141, 198, 63);
  rect(xPos, yPos+5*s, s, s);
 
  fill(57, 181, 74);
  rect(xPos, yPos+6*s, s, s);
 
  fill(0, 169, 157);
  rect(xPos, yPos+7*s, s, s);
   
    fill(0,74,128);
  rect(xPos, yPos+8*s, s, s);
   
      fill(68,14,98);
  rect(xPos, yPos+9*s, s, s);
  
  fill(122,0,38);
  rect(xPos, yPos+10*s, s, s);
  
  fill(237,20,91);
  rect(xPos, yPos+11*s, s, s);
  
 
  
}
 
void draw() {
 
  if (mousePressed) {
    if (mouseX > 220 && mouseX < 780 && mouseY > 20 && mouseY < 580) {
      line (pmouseX, pmouseY, mouseX, mouseY);
    }
    if (mouseX > xPos && mouseX < xPos+s && mouseY > yPos && mouseY < yPos+s) {
      stroke(250, 0, 0);
      strokeWeight(8);
    }
    if (mouseX > xPos && mouseX < xPos+s && mouseY > yPos+s && mouseY < yPos+s+s) {
      stroke(242, 101, 34);
      strokeWeight(8);
    }
    if (mouseX > xPos && mouseX < xPos+s && mouseY > yPos+s+s && mouseY < yPos+s+s+s) {
      stroke(253, 198, 137);
      strokeWeight(8);
    }
    if (mouseX > xPos && mouseX < xPos+s && mouseY > yPos+s+s+s && mouseY < yPos+s+s+s+s) {
      stroke(255, 247, 153);
      strokeWeight(8);
    }
    if (mouseX > xPos && mouseX < xPos+s && mouseY > yPos+4*s && mouseY < yPos+5*s) {
      stroke(255, 242, 0);
      strokeWeight(8);
    }
    if (mouseX > xPos && mouseX < xPos+s && mouseY > yPos+5*s && mouseY < yPos+6*s) {
      stroke(141, 198, 63);
      strokeWeight(8);
    }
    if (mouseX > xPos && mouseX < xPos+s && mouseY > yPos+6*s && mouseY < yPos+7*s) {
      stroke(57, 181, 74);
      strokeWeight(8);
    }
    if (mouseX > xPos && mouseX < xPos+s && mouseY > yPos+7*s && mouseY < yPos+8*s) {
      stroke(0, 169, 157);
      strokeWeight(8);
    }
        if (mouseX > xPos && mouseX < xPos+s && mouseY > yPos+8*s && mouseY < yPos+9*s) {
      stroke(0,74,128);
      strokeWeight(8);
    }
            if (mouseX > xPos && mouseX < xPos+s && mouseY > yPos+9*s && mouseY < yPos+10*s) {
      stroke(68,14,98);
      strokeWeight(8);
    }
       
            if (mouseX > xPos && mouseX < xPos+s && mouseY > yPos+10*s && mouseY < yPos+11*s) {
      stroke(122,0,38);
      strokeWeight(8);
    }
     }
       
            if (mouseX > xPos && mouseX < xPos+s && mouseY > yPos+11*s && mouseY < yPos+12*s) {
      stroke(237,20,91);
      strokeWeight(8);
    }
                
    }


