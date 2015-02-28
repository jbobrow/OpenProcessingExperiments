
//QUESTION 8

float mass = 0.1;
float thickness;
int value = 0;

void setup() {
  size(640, 200);
  background(102);
  thickness = 0.1;
}

void draw() {
  stroke(255);
  if(mousePressed){
    thickness += mass; //the thickness increases 
    strokeWeight(thickness);
    line(mouseX, mouseY, pmouseX, pmouseY);
   }
  else{
    thickness = 0.1; //when the mouse is let go, the thickness returns to 0.1
  }
}



