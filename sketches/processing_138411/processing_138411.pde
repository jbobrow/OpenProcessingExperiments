
//toggle button -- this is a single button that does two different things depending on whether it is "on" or "off"

boolean makeSquare = true; // this is switch that controls which shape is drawn
int buttonSize = 50;

void setup(){
  size(600, 600);
  background(255);
  noStroke();
}

void draw(){
  
  makeButton();
}

void mouseClicked(){
 if(mouseX < buttonSize && mouseY < buttonSize){ // did the mouse click the button?
   makeSquare = !makeSquare; //toggle between true and false -- if it is true make it false and if it is false make it true
 }  
 else{}
 makeShapes();
}


void makeButton(){
 fill(255);
 rectMode(CORNER);
 strokeWeight(5);
 stroke(255);
 rect(0, 0, buttonSize, buttonSize);
 
 stroke(0);
 fill(100);
 
  if(makeSquare){//if we are making squares make the button a square
   rectMode(CORNER);
     rect(0, 0, buttonSize, buttonSize);
 }
 else {
   ellipseMode(CORNER); //if we are making circles make the button a circle
   ellipse(0, 0, buttonSize, buttonSize);
 }
 
  noStroke();
}

void makeShapes(){
  noStroke();
  int theSize = int(random(20, 50));
  fill(0, 100);
  
  if(makeSquare){ // if the makeSquare switch is on then we make squares
      rectMode(CENTER);
      rect(mouseX, mouseY, theSize, theSize);
  }
  else{ //otherwise we make circles
      ellipseMode(CENTER);
      ellipse(mouseX, mouseY, theSize, theSize);
 }
  
}


