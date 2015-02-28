
//03/6/2011  |  Molly Morin  |  mollymorin.com
 
//created for Emerging Formats for Digital Art, University of Notre Dame
//Examples to support Daniel Shiffman's Learning Processing, www.learningprocessing.com
//A small modification of Shiffman's modulo example

////variables////////////////////////////////////////////////////////////////////

int diameter = 0;//diameter of a circle
void setup(){
  size (400, 400);  
}

void draw(){
  background(100, 200, 200);
  stroke(255, 0, 100);
  strokeWeight(3);
  noFill();
  ellipse (width/2, height/2, diameter, diameter);
  
  //this modulo function returns the diameter size to 0 when it reaches the width
  diameter = (diameter+8) % width;

}

//void mousePressed(){
 // saveFrame("screenshot.jpg");
//}

