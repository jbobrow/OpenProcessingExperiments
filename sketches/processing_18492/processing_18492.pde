
void setup(){
  size(400,400);
  background(255);
  colorMode(HSB,width);
}

void draw(){
}


void mousePressed(){
  stroke(0,360,360);
  strokeWeight(5);
  line(mouseX-5,mouseY-5,mouseX+5,mouseY+5);
  line(mouseX-5,mouseY+5,mouseX+5,mouseY-5);
  noStroke();
  fill(56,300,360);
  ellipse(mouseX,mouseY,6,6);
}
void mouseDragged(){
  stroke(0,120,360);
  strokeWeight(2);
  line(mouseX-3,mouseY-3,mouseX+3,mouseY+3);
  line(mouseX-3,mouseY+3,mouseX+3,mouseY-3);
  noStroke();
  fill(56,360,360);
  ellipse(mouseX,mouseY,4,4);
}

