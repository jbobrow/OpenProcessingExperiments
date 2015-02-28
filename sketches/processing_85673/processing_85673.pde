
void setup() {
  size(200,200);
  background(255,126,70);
  smooth();
  frameRate(30);
 }
  
void draw() {
  //set shapes to CENTER mode
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  //make head
  noStroke();
  fill(150,mouseX,mouseY);
  ellipse(mouseX,mouseY,mouseX,mouseY);
  
  //make face
  fill(0,255,40);
  rect(mouseX+20,mouseY,20,30);
  rect(mouseX-20,mouseY,20,30);
  stroke(0);
  line(mouseX+30,mouseY+30,mouseX-30,mouseY+30);
}

