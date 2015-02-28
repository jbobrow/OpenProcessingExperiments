
void setup() {
  
  size(200,200);
  smooth();
  frameRate(30);
}

void draw() {
  //backgorund color
  background(120,160,170,50);
  
  // Set ellipses and rects to CENTAR mode
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  // zoogs body
  stroke(0);
  fill(mouseX,0,mouseY);
  rect(mouseX,mouseY,20,100);
  
  // zoogs head
  stroke(0);
  fill(255);
  ellipse(mouseX,mouseY-30,60,60);
  
  // zoogs eyes
  fill(mouseX,0,mouseY);
  ellipse(mouseX-19,mouseY-30,16,32);
  ellipse(mouseX+19,mouseY-30,16,32);
  
  // zoogs legs
  stroke(0);
  line(mouseX-10,mouseY+50,pmouseX-10,pmouseY+60);
  line(mouseX+10,mouseY+50,pmouseX+10,pmouseY+60);
  
}



