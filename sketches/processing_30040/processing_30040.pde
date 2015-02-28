
float distance=0;

void setup() {
  size(640, 200);
  background(102); 
}

void draw() {
  stroke(255);
  if(mousePressed) {
    distance+=dist(pmouseX,pmouseY,mouseX,mouseY);
    strokeWeight(distance/20);
    line(mouseX, mouseY, pmouseX, pmouseY); 
  }
  else{
    distance=0;
  }
}


