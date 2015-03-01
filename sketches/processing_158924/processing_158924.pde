
//Interaction Challenge 1
//Problem 2 (Basic)
void setup(){
  size(600,600); //sets screen size
}

void draw(){
  background(255-mouseY,255-mouseY,255);
  //the above code makes the background color
  //change from white to blue as the mouse moves
  //from the top of the screen to the bottom.
  fill(255,0,255); //sets circle color to purple
  ellipse(width/2, height/2, 2*mouseX, 2*mouseX);
  //the above command creates a circle
  //that has a radius equal to the x-value 
  //of the mouse.
}

