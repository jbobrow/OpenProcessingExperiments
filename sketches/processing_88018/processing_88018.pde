
int RED = 80; //value for red
int GREEN = 160; //value for green
int BLUE = 50; //value for blue
int ellipseSize = 80; //value for ellipse

void setup(){
  size (450, 650); //size of applet
  background (RED, GREEN, BLUE); //background colour
} 
void draw(){
  ellipse (220, 150, ellipseSize, ellipseSize); //circle for head
  strokeWeight(5); //value for stroke - 5 pixels
  stroke(0); //colour value - black
  line(220, 190, 220, 400); //line for body
  line(350, 250, 100, 250); //line for arms
}


