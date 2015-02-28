
void setup(){
  size(400, 400); //size of applet
  frameRate(2); //command to set speed of frame rate
}

void draw(){
  background(200, 15, 220); //background colour
  strokeWeight(random(5,30));
  //stroke weight varies between 5 and 30 pixels a random setting
  rect(120, 120, 150, 150); // position and size for square
}
  


