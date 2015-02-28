
float x;
float y;
void setup() {
  background(0);
  size(800, 800);
  smooth();
}

void draw() {
  pushMatrix();
  translate(mouseX, mouseY);  //arrows possition defines the location of rectangle
  strokeWeight(3);
  noFill();
  if (mousePressed == true) {  //If the left button is pressed color turns red 
    x=x+2;
  }
 if (mousePressed == false) {   //If the left button released then the color turns black
    x=x-2;
  }
  
 
  stroke(x,0,0);
  rect(0, 0, 50, 50);
 rect(-25,0,25,25);
 rect(50,0,18,18);
 rect(0,50,10,10);
  rect(0,-30,30,30);
  popMatrix();
}
