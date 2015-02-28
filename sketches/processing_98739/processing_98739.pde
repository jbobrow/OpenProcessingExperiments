
void setup(){
  size(200,200);
  smooth();
}

void draw(){
  background(255);
  
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  //zoog's body
  stroke(0);
  fill(175);
  rect(mouseX,mouseY,20,100);
  
  //zoog's head
  stroke(0);
  fill(255);
  ellipse(mouseX,mouseY-30,60,60);
  
  //zoog's eyes
  fill(0);
  ellipse(mouseX-19,mouseY-30,16,32);
  ellipse(mouseX+19,mouseY-30,16,32);
  
  //zoog's legs
  stroke(0);
  line(mouseX-10,mouseY+50,mouseX-20,mouseY+60);
  line(mouseX+10,mouseY+50,mouseX+20,mouseY+60);
}


