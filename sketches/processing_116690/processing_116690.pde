
void setup(){
  size(700, 400);
  smooth();
  background(25);
}

void draw(){

  noStroke();
  rect(width/3, height/2, 20, 20);
  rect(width/1.5, height/2, 20, 20);
  
  if (mousePressed == true) {
  stroke(255,255,0, 50);
  strokeWeight(1);
  line(width/3+10, height/2+10, pmouseX, pmouseY);
  line(width/1.5+10, height/2+10, pmouseX, pmouseY);
  }
}
