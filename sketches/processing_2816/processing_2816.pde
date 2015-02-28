
void setup(){
  background(0,40);
  size(500,500);
}

void draw(){
  frameRate(10);
  smooth();
  //background(0,40);
  if(mousePressed) {
    stroke(0,255,0);
    noFill();
    //translate(mouseX,mouseY);
    //rotate(PI/12.0);
    ellipse(pmouseX,pmouseY,random(20),random(70));
    line(pmouseX,pmouseY,mouseX,mouseY);
  }
}

