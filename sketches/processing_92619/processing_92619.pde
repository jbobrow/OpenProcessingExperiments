
//original sketch from Learning Processing. I added arms and adjusted the torso.
//I later changed the background color, made his eyes change color, and made him say 'STOP IT' when clicked
void setup() {
  size(500,500);
  smooth();
  frameRate(30);
}

void draw() {
  background(5, 200, 300);
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  stroke(0);
  fill(100);
  rect(mouseX,mouseY,20,70);
  
  stroke(0);
  fill(255);
  ellipse(mouseX,mouseY-30,60,60);
  
  fill(mouseX,0,mouseY);
  ellipse(mouseX-19,mouseY-30,16,32);
  ellipse(mouseX+19,mouseY-30,16,32);
  
  stroke(0);
  line(mouseX-10, mouseY+35,pmouseX-10,pmouseY+60);
  line(mouseX+10,mouseY+35,pmouseX+10, pmouseY+60);
  
  stroke(0);
  line(mouseX-10, mouseY+5,pmouseX-10,pmouseY+40);
  line(mouseX+10,mouseY+5,pmouseX+10, pmouseY+40);
}

void mousePressed() {
  println("STOP IT!");
}
