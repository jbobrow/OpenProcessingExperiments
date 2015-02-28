
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
}


