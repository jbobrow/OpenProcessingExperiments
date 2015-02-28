
void setup(){
  size(300,300);
  background(255,255,255);
  smooth();
  frameRate(10000);
}
void draw(){
}
void mouseDragged(){
  noStroke();
  fill(140,200,50);
  ellipse(mouseX,mouseY,5,5);
}
void mousePressed(){
  stroke(250,70,120);
  strokeWeight(5);
  line(mouseX,mouseY,mouseX+5,mouseY+5);
  line(mouseX,mouseY,mouseX-5,mouseY-5);
  line(mouseX,mouseY,mouseX+5,mouseY-5);
  line(mouseX,mouseY,mouseX-5,mouseY+5);
}

