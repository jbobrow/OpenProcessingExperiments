
void setup() {
  size(640,480);
  noCursor();
  smooth();
  frameRate(30);
}

void draw() {
  
  //basics
  background(0,0,0);
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  //head
  fill(0,mouseX,mouseY);
  noStroke();
  arc(mouseX,mouseY-25,40,40,PI,PI+PI);
  
  //body
  fill(0,mouseX,mouseY);
  noStroke();
  rect(mouseX,mouseY-10,40,30);
  
  //eyes
  fill(255);
  ellipse(mouseX+8,mouseY-30,7,9);
  ellipse(mouseX-8,mouseY-30,7,9);
  fill(0);
  ellipse(mouseX+8,mouseY-27,7,7);
  ellipse(mouseX-8,mouseY-27,7,7);
  
  //feet
  fill(0,mouseX,mouseY);
  noStroke();
  arc(mouseX+20,mouseY+10,20,20,PI,PI+PI);
  arc(mouseX-20,mouseY+10,20,20,PI,PI+PI);
  
  //antenea
  stroke(0,mouseX,mouseY);
  line(mouseX+8,mouseY-43,pmouseX+12,pmouseY-55);
  line(mouseX-8,mouseY-43,pmouseX-12,pmouseY-55);
  ellipse(pmouseX+12,pmouseY-55,5,5);
  ellipse(pmouseX-12,pmouseY-55,5,5);
}


