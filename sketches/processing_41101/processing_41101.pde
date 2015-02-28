


void setup(){
  size (200,200);
  smooth();
  frameRate(30);
}
void draw(){
  background(255);
  
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  //BODY
  stroke(0);
  fill(175);
  rect(mouseX,mouseY,20,100);
  
  //HEAD
  stroke (0);
  fill(255);
  ellipse(mouseX,mouseY-30,60,60);
  
  //EYES
  fill(mouseX,0,mouseY);
  ellipse(mouseX-19,mouseY-30,16,32);
  ellipse (mouseX+19, mouseY-30,16,32);
  
  //LEGS
  stroke(0);
  line(mouseX-10, mouseY+50,pmouseX-10,pmouseY+60);
  line(mouseX+10,mouseY+50,pmouseX+10, pmouseY+60);
}
void mousePressed(){
  println("take me to your leader");
}

