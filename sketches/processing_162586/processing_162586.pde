
int xPos = 50;
int yPos = 50;
int bSize = 30;
void setup() {

  size(800, 600);
  background(60);
  
// drawing space
noStroke();
  fill(150);
  rect(200, 0, 600, 600);


// color chart

//red
  fill(255, 0, 0);
  rect(xPos, yPos, bSize, bSize);

//green
  fill(0, 255, 0);
  rect(xPos, yPos*2, bSize, bSize);

//blue
  fill(0, 0, 255);
  rect(xPos, yPos+yPos*2, bSize, bSize);
  
//white
fill(0);
rect(xPos*2, yPos, bSize, bSize);

//black
fill(255);
rect(xPos*2, yPos*2, bSize,bSize);

//eraser
fill(255);
ellipse(xPos+15,yPos+yPos*4, bSize, bSize);


//strokeweight
  fill(150);
ellipse(xPos+15, yPos*7, bSize -15, bSize -15);
ellipse(xPos+15, yPos*7.45, bSize -10,bSize -10);
ellipse(xPos+15, yPos*8, bSize -5,bSize -5);
ellipse(xPos+15, yPos*8.65, bSize,bSize);


}


void draw() {


  if (mousePressed) {
    if ( mouseX > 210 && mouseX < 780 && mouseY > 0  && mouseY < 600  == true) {
      
      line(pmouseX, pmouseY, mouseX, mouseY);
    }
    
    if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos  && mouseY < yPos+bSize) {
      stroke(255, 0, 0);
      
  }
  
  
     if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos*2  && mouseY < yPos*2 +bSize) {
      stroke(0, 255, 0);
      
      
     }
     
     if ( mouseX > xPos && mouseX < xPos+15+bSize && mouseY > yPos+yPos*2  && mouseY < yPos+yPos*2 +bSize) {
      stroke(0, 0, 255);
      
  
  }
  
  if ( mouseX > xPos*2 && mouseX < xPos*2+bSize && mouseY > yPos  && mouseY < yPos+bSize) {
      stroke(0);
      
  }
  
   if ( mouseX > xPos*2 && mouseX < xPos*2+bSize && mouseY > yPos*2  && mouseY < yPos*2 +bSize) {
      stroke(255);
      
  }
  //stroke
  if ( mouseX > xPos+15 && mouseX < xPos+15+bSize-10 && mouseY > yPos*7  && mouseY < yPos*7 +bSize-10) {
      strokeWeight(3);
      
  }
   if ( mouseX > xPos+15 && mouseX < xPos+15+bSize-10 && mouseY > yPos*7.45  && mouseY < yPos*7.45 +bSize-10) {
      strokeWeight(5);
      
  }
     if ( mouseX > xPos+15 && mouseX < xPos+15+bSize-5 && mouseY > yPos*8  && mouseY < yPos*8 +bSize-5) {
      strokeWeight(7);
      
  }
  if ( mouseX > xPos+15 && mouseX < xPos+15+bSize && mouseY > yPos*8.65  && mouseY < yPos*8.65 +bSize) {
      strokeWeight(15);
      
  }
  
  
  
  //
  
  if ( mouseX > xPos  && mouseX < xPos  +bSize && mouseY > yPos+yPos*4  && mouseY < yPos+yPos*4 +bSize) {
      noStroke();
      fill(150);
      rect(200,0,600,600);
  
  }
  
  
  }
      
}
