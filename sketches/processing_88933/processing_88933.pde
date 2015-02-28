
void setup(){
  size(400, 400); //size of applet
}

void draw(){
  background(0, 0, 0); //background colour
  noFill(); //command for no fill
  strokeWeight(5); //value for stroke - 5 pixels
  stroke(255, 0, 0); //stroke colour - red
  bezier(70, 70, 200, 70, 200, 200, 70, 200);
  //position and coordinates for bezier curve
  noFill(); //command for no fill
  strokeWeight(10); //value for stroke - 10 pixels
  stroke(0, 255, 0); //stroke colour - green
  bezier(175, 175, 225, 250, 300, 360, 350, 175);
  //position and coordinates for bezier curve
}


