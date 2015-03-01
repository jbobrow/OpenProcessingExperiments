
int xPos = 100;
int yPos = 30;
int bSize = 30;

int zPos = 200;

void setup() {

  size(800, 600);
  background(120);
  // drawing space
  fill(240);
  rect(0, 120, 800, 600);
//
  fill(0, 0, 0);
  rect(xPos, yPos, 30, 30);

  fill(255, 0, 0);
  rect(xPos*2, yPos, bSize, bSize);

  fill(0, 0, 255);
  rect(xPos+xPos*2, yPos, bSize, bSize);
//  
  fill(255, 255, 255);
  rect(xPos, yPos+yPos+5, 30, 30);

  fill(255, 255, 0);
  rect(xPos*2, yPos+yPos+5, bSize, bSize);

  fill(100, 200, 50);
  rect(xPos+xPos*2, yPos+yPos+5, bSize, bSize);
//
   fill(0);
  ellipse(xPos*4+55, yPos+32, bSize-25, bSize-20);
  
  fill(0);
  ellipse(xPos*5, yPos+31, bSize-20, bSize-15);

  fill(0);
  ellipse(xPos*5+50, yPos+30, bSize-15, bSize-10);
  
    fill(0);
  ellipse(xPos*5+110, yPos+28, bSize-8, bSize-4);


  noFill();
}


void draw() {


  if (mousePressed) {
    if ( mouseX > 0 && mouseX < 800 && mouseY > 122  && mouseY < 600  == true) {
      
      line(pmouseX, pmouseY, mouseX, mouseY);
    }
    
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos  && mouseY < yPos+bSize) {
      stroke(0, 0, 0);
  }
  
     if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+yPos+5  && mouseY < yPos+yPos+bSize) {
      stroke(255, 255, 255);
  }
       if ( mouseX > xPos*2 && mouseX < xPos*2+bSize && mouseY > yPos  && mouseY < yPos+yPos+bSize) {
      stroke(255, 0, 0);
  }  
     if ( mouseX > xPos*2 && mouseX < xPos*2+bSize && mouseY > yPos+yPos+5  && mouseY < yPos+yPos+5+bSize) {
      stroke(255, 255, 0);
  }  
  if ( mouseX > xPos+xPos*2 && mouseX < xPos+xPos*2+bSize && mouseY > yPos  && mouseY < yPos+bSize) {
      stroke(0, 0, 255);
  }  
  if ( mouseX > xPos+xPos*2 && mouseX < xPos+xPos*2+bSize && mouseY > yPos  && mouseY < yPos+bSize) {
      stroke(0, 0, 255);
  }  if ( mouseX > xPos+xPos*2 && mouseX < xPos+xPos*2+bSize && mouseY > yPos+yPos+5  && mouseY < yPos+yPos+5+bSize) {
      stroke(100, 200, 50);
  }  
  
    
   if ( mouseX > xPos*4+55 && mouseX < xPos*4+55+bSize-25 && mouseY >yPos+32  && mouseY < yPos+32+bSize-20) {
    strokeWeight(4);
   }
   if ( mouseX > xPos*5 && mouseX < xPos*5+bSize-20 && mouseY >yPos+31  && mouseY < yPos+31+bSize-15) {
    strokeWeight(8);
  }  
     if ( mouseX > xPos*5+50 && mouseX < xPos*5+50+bSize-15 && mouseY >yPos+30  && mouseY < yPos+30+bSize-10) {
    strokeWeight(15);
  }  
}
}

