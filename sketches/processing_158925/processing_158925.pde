
//Interaction Challenge 1
//Problem 2 (Challenge)
void setup(){
  size(600,600); //sets screen size
}

void draw(){
  background(255-mouseY,255-mouseY,255);
  //the above code makes the background color
  //change from white to blue as the mouse moves
  //from the top of the screen to the bottom.
  fill(255,0,255); //sets circle color to purple
  ellipse(width/2, height/2, 2*sqrt(sq((mouseX-width/2))+sq((mouseY-height/2))), 2*sqrt(sq((mouseX-width/2))+sq((mouseY-height/2))));
  //the above command creates a circle
  //that has a radius equal to the distance 
  //that the mouse is from the center of the 
  //circle
}

