
void setup() {
  size(400,400);
  smooth();
  frameRate(20);
}

void draw() {
  background(0);
  
  //set CENTER mode
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  //draw zoog's body
  noStroke();
  fill(#33CC33);
  rect(mouseX,mouseY,20,100);
  
  //draw zoog's head
  noStroke();
  fill(255);
  ellipse(mouseX,mouseY-30,60,60);
  
  //draw zoog's eyes
  noStroke();
  fill(mouseX,0,mouseY);
  ellipse(mouseX-19,mouseY-30,16,32);
  ellipse(mouseX+19,mouseY-30,16,32);
  
  //draw zoog's legs
  stroke(255);
  line(mouseX-10,mouseY+50,pmouseX-10,pmouseY+60);
  line(mouseX+10,mouseY+50,pmouseX+10,pmouseY+60);
  
  stroke(255);
  line(mouseX-10,mouseY+5,pmouseX-10,pmouseY+20);
  line(mouseX+10,mouseY+5,pmouseX+10,pmouseY+20);
}

  void mousePressed() {
    println("Cool!");
  }

