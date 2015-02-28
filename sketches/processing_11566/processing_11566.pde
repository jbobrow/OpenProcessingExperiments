
void setup() {
  size(500,500);
  smooth();
  background(255);
  frameRate(2);
}

void draw() {
  rectMode(CENTER);
  stroke(0);
  fill(mouseX,0,mouseY);
  rect(mouseX,mouseY,20,100);
  
  stroke(0);
  fill(mouseX,0,mouseY);
  rect(mouseX+25,mouseY+10,30,80);
  
  stroke(0);
  fill(mouseX,0,mouseY);
  rect(mouseX-30,mouseY-5,40,110);
  
  stroke(0);
  fill(mouseX,0,mouseY);
  rect(mouseX-60,mouseY+25,20,50);
  
  stroke(0);
  fill(mouseX,0,mouseY);
  rect(mouseX-85,mouseY+20,30,60);
  
  stroke(0);
  fill(mouseX,0,mouseY);
  rect(mouseX+55,mouseY+25,30,50);
   println("City of Sydney");
  
}



