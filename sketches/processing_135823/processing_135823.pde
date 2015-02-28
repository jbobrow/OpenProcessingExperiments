
void setup() {
  size(400,400);
  smooth();
}
void draw() {
  background(255);
  float a=random(200);
  float b=random(400);
  stroke(0,255,100+mouseY,100);
  if (mouseY>200) {
  strokeWeight(mouseX);
  }
  else {
    strokeWeight(mouseY);
  }
  line(mouseX+20, mouseY+10,400-mouseX,400-mouseY);
  noStroke();
  fill(150-mouseX, 0+mouseY, 255,100);
  //rect(0+mouseY,0,400-mouseX,400);
  rotate(PI/mouseX);
  triangle(mouseX+50,mouseY+pmouseY,100+mouseX,200,300,400-mouseY);
  noFill();
  if (mouseX>200) {
    fill(255-mouseY, 0+mouseX,100,30+mouseY);
    ellipse(mouseX+20,400-mouseY,1+mouseY, 1+mouseY);
  }
  else {
    noFill();
  stroke(255-mouseX,0,mouseY,100);
  //strokeWeight(1+mouseY);
  ellipse(mouseX+20,400-mouseY,1+mouseY,1+mouseY);
  }
  
}
