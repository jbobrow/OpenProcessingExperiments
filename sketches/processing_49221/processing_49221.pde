
void setup(){
  size(480,480);
  smooth();
  stroke(0,102);
}
 
void draw(){
  float weight = dist(mouseX, mouseY, pmouseX, pmouseY);
  strokeWeight(weight);
  stroke(200,mouseY,mouseX,102);
  line(mouseX,mouseY, pmouseX, pmouseY);
}
