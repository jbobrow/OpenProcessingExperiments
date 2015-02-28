
void setup(){
size(400,400);
smooth();
noStroke();
}
void draw(){
background(255);
noStroke();
  fill(0,mouseX/2,mouseY,mouseX);
  rect(mouseX+10,mouseX+10,mouseX+5,mouseX+5);
  noStroke();
  fill(255,236,139);
  ellipse(150,mouseY,150,150);
  noFill();
  strokeWeight(3);
  stroke(mouseX*2,30,30,100);
  ellipse(mouseX/4,mouseY/4,100,100);
 
}
