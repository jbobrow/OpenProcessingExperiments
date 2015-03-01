
int xPos=35;
int yPos=35;
int s=35;



void setup() {

  size(600, 600);
  background(255);

  //drawingboard
  noStroke();
  fill(193, 193, 193);
  rect(0, 0, 100, 600);


  //black
  fill(0);
  rect(xPos, yPos, s, s);
  //white
  fill(255);
  rect(xPos, yPos+yPos, s, s);
  //pink
  fill(245, 161, 214);
  rect(xPos, yPos+(yPos*2), s, s);
  //blue
  fill(161, 238, 245);
  rect(xPos, yPos*4, s, s);
  //green
  fill(178, 219, 75);
  rect(xPos, yPos*5, s, s);
  //yellow
  fill(255, 235, 82);
  rect(xPos, yPos*6, s, s);
  //orange
  fill(255, 160, 82);
  rect(xPos, yPos*7, s, s);
  //aqua
  fill(82, 255, 164);
  rect(xPos, yPos*8, s, s);
  //brown
  fill(157, 124, 71);
  rect(xPos, yPos*9, s, s);
  

}

void draw() {

  if (mousePressed) {
    if (mouseX>120 && mouseX<600 && mouseY>0 && 600>mouseY) {
      strokeWeight(4);
      line(pmouseX, pmouseY, mouseX, mouseY);
    }
    //black
    if (mouseX>xPos && mouseX<xPos+s && mouseY>yPos && mouseY<yPos+s) {
      stroke(0);
    }
    //white    
    if (mouseX>xPos && mouseX<xPos+s && mouseY>yPos*2 && mouseY<yPos*3) {
      stroke(255);
    }
    //pink
    if (mouseX>xPos && mouseX<xPos+s && mouseY>yPos*3 && mouseY<yPos*4) {
      stroke(245, 161, 214);
    }
    //blue
    if (mouseX>xPos && mouseX<xPos+s && mouseY>yPos*4 && mouseY<yPos*5) {
      stroke(161, 238, 245);
    }
    //green
    if (mouseX>xPos && mouseX<xPos+s && mouseY>yPos*5 && mouseY<yPos*6) {
      stroke(178, 219, 75);
    }
    //yellow
    if (mouseX>xPos && mouseX<xPos+s && mouseY>yPos*6 && mouseY<yPos*7) {
      stroke(255, 235, 82);
    }
    //orange
    if (mouseX>xPos && mouseX<xPos+s && mouseY>yPos*7 && mouseY<yPos*8) {
      stroke(255, 160, 82);
    }
    //aqua
    if (mouseX>xPos && mouseX<xPos+s && mouseY>yPos*8 && mouseY<yPos*9){
      stroke(82, 255, 164);
    }
    //brown
    if(mouseX>xPos && mouseX<xPos+s && mouseY>yPos*9 && mouseY<yPos*10){
      stroke(157, 124, 71);
    }
  }
}

