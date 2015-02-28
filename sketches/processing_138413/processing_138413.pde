
boolean eraser = false;
int toolBarTop = 550;

void setup() {
 size(600, 600); 
 noStroke();
 ellipseMode(CENTER);
 background(255);
 frameRate(50);
}

void draw(){
  drawButtons();
  drawLine();
}

void mouseClicked(){
 if(mouseY > toolBarTop){ //see if the mouse is below the toolbar line
  if(mouseX < width/2){ // check to see if mouse is over the black button 
   eraser = false; // this means that the pencil tool is selected
  } 
  else if(mouseX > width/2){ //check to see if the mouse is over the white button
    eraser = true; //this means that the eraser tool is selected
  }
  else{}
 }
 else {
 }
}

void drawLine(){
  if(mouseY < toolBarTop){ //checks to see if the mouse is above the toolbar to avoid drawing in the toolbar
 if(eraser){
   fill(255); //set the fill to white (i.e. the eraser color)
 } 
 else {
  fill(0);  // set the fill to black (i.e. the pencil color)
 }
   noStroke();
  ellipse(mouseX, mouseY, 20, 20); 
}
}

void drawButtons(){

 fill(0);
 rect(0, toolBarTop, width/2, 50); //draw black button, the pencil tool
 fill(255);
 rect(width/2, toolBarTop, width/2, 50); //draw white button, the eraser tool
  stroke(128); 
 strokeWeight(5);
 line(0, toolBarTop, width, toolBarTop); // draw a line indicating where the toolbar starts
 line(width/2, toolBarTop, width/2, height); //draw a  line separating the two buttons
 noStroke();
}


