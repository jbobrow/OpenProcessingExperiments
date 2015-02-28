
void setup () {
  
  //size of the window
  size(500,500);
  smooth();
  frameRate (20);
  
}


void draw () {
  
  //background
  background (225,mouseX,mouseY);
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  //zoog's body
  stroke(0);
  fill(152);
  rect(mouseX,mouseY,50,100);
  
  //zoog's ears
  stroke(0);
  fill(152);
  rect(mouseX-50,mouseY-50,30,20);
  rect(mouseX+50,mouseY-50,30,20);
  
  //zoog's head
  stroke(0);
  fill(90);
  rect(mouseX,mouseY-50,90,60);
  
  //zoog's eyes
  fill(mouseX,0,mouseY);
  ellipse(mouseX-19,mouseY-55,abs(mouseX-pmouseX),20);
  ellipse(mouseX+19,mouseY-55,abs(mouseX-pmouseX),20);
  
  //zoog's mouth
  fill(mouseX,mouseY,0);
  rect(mouseX,mouseY-32,abs(mouseX-pmouseX),10);
  
  //zoog's hands
  stroke(0);
  line(mouseX+30,mouseY-10,pmouseX+55,pmouseY+30);
  line(mouseX-30,mouseY-10,pmouseX-55,pmouseY+30);
  
  //zoog's legs
  stroke(0);
  line(mouseX-20,mouseY+50,pmouseX-50,pmouseY+100);
  line(mouseX+20,mouseY+50,pmouseX+50,pmouseY+100);
  
}


void mousePressed() {
    
  frameRate (5);
  background (0);
  
  stroke(0,0,100);
  fill(224,0,0);
  ellipse(mouseX,mouseY+10,50,50);
  
  println("Oops!");
 
}


