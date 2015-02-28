
void setup () {
  size(300,300);
  stroke(0,125);
  smooth();
}

void draw(){
  float speed= dist(pmouseX, pmouseY, mouseX, mouseY);
  speed= constrain (speed,0,200);
  speed=map(speed,0,200,0,50);
  strokeWeight(speed);
  stroke(mouseX,mouseY,200);
  println(speed);
  line(pmouseX, pmouseY,mouseX,mouseY);
 
 
}
