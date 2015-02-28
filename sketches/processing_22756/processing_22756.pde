
//03/6/2011  |  Molly Morin  |  mollymorin.com
 
//created for Emerging Formats for Digital Art, University of Notre Dame
//Examples to support Daniel Shiffman's Learning Processing, www.learningprocessing.com
//Schiffman Oscillation example with numerical readout


float theta = 0; //angles in radains


void setup() {
  size(500,500);
  smooth(); 
}

void draw() {
 
  //this formula will oscillate between -1 and 1
  float c = (sin(theta) +1)*120;
  
  background(c);
 
  //text goodies
  PFont font;
  font = loadFont("Serif-36.vlw");
  textFont (font, 48);
  text("theta = " + theta, 25, 200);
  text("sin(theta) = " + sin(theta), 25, 270);
  
  //change theta to create oscillation, higher numbers will move faster
  theta += 0.02;

}

//void mousePressed(){
//  saveFrame("screenshot.jpg");
//}

