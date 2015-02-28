
void setup(){
  size(480,480);
  smooth();
  stroke(0,102);
}

void draw (){
  float weight= dist(mouseX, mouseY, pmouseX, pmouseY);
  strokeWeight(weight);
  line(mouseX, mouseY, pmouseX, pmouseY);
}

//(the faster your mouse moves, the thicker the line is)

