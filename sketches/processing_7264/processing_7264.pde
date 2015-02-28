
void setup() {
  size(400, 400);
}


void draw() {

  background(230, 9, 234);

  stroke(0, 0,200);
  strokeWeight(6);


  // for the body
  fill(55, 250, 3); //set the fill color to an ugly green
  rectMode(CORNERS);
  rect(100, 200, 300, 350);//draw the body of the house
  
  // for the roof
  strokeWeight(4);
  fill(220, 100, 20); //make the roof orange
  triangle(100, 200, mouseX+ 10, mouseY+10, 300, 200);// draw the roof of the house

  //for the portholes
  strokeWeight(4);
  fill(254, 255, 8);
  ellipse(150, 250, 30, 30);
  ellipse(250, 250, 30, 30);
  fill(0);
  ellipse(200,250, 30, 30);
  
  //for the door
  rectMode(CORNER);
  fill(72, 32, 7);
  rect(187, 302, 30, 42);
  
  
  //for the coordinate pointer
  stroke(255);
  strokeWeight(6);
  point(mouseX, mouseY);
  
  println("mouse at " + mouseX + "," + mouseY);
  

}





