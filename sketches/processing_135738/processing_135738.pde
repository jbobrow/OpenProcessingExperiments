
void setup(){
  background(30);
  size(400,400);
  smooth();
}

void draw(){
  frameRate(300);
  strokeWeight(40);
  stroke(30,mouseX/1.5,180);
  if(mousePressed == true) {
  if(mouseButton == LEFT) { 
    line(mouseX,mouseY,pmouseX,pmouseY);
  }
    if(mouseButton==RIGHT) {
      strokeWeight(50);
      stroke(30);
      line(mouseX,mouseY,pmouseX,pmouseY);
    }
    }
}


