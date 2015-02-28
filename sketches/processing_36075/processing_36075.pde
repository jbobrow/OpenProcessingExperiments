


void setup()  {
  noCursor();
  size (400,400);
  background(255);
  smooth();
  frameRate(30);
 // strokeWeight(1);
  
  
  
  
}

void draw() {
  background(255);
  
  fill(mouseX,0,mouseY);
  ellipse(mouseX,mouseY,60,60);
  fill(255);
  ellipse(mouseX-10,mouseY-10,20,20);
  ellipse(mouseX+10,mouseY-10,20,20);
  
  fill(0);
  ellipse(mouseX-10,mouseY-10,5,5);
  ellipse(mouseX+10,mouseY-10,5,5);
  
  noFill();
  stroke(0);
  line(mouseX,mouseY+30,pmouseX,pmouseY+100);
  line(mouseX-5,mouseY+30,pmouseX-5,pmouseY+100);
  line(mouseX-10,mouseY+30,pmouseX-10,pmouseY+100);
  line(mouseX+5,mouseY+30,pmouseX+5,pmouseY+100);
  line(mouseX+10,mouseY+30,pmouseX+10,pmouseY+100);
  
  line(mouseX-10,mouseY+10,mouseX+10,mouseY+10);
  
  
  
}

