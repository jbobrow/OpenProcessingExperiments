
//01/24/2011  |  Molly Morin  |  mollymorin.com
//example, bezier curve, adapted from processing.org reference
//created for Emerging Formats for Digital Art, University of Notre Dame

void setup(){
  size (500,500);//the size of your sketch in pixels
  smooth();//turns on anti-ailiasing, witch smooths out some rough edges
}
 
 
void draw(){

background(255);
noFill();
stroke(255, 102, 0);
line(400, 20, mouseX-10, mouseY-10);
line(mouseX+10, mouseY+10, 15, 400);
stroke(0, 0, 0);
bezier(400, 20, mouseX-10, mouseY-10, mouseX+10, mouseY+10, 15, 400);
}

