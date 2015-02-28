
// Peter 09/03/11

void setup(){
  size(200, 200);
  smooth();
  frameRate(30);
}

void draw() {
  background(255);
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  //body
  stroke(0);
  fill(150);
  rect(mouseX, mouseY, 20, 100);
  
  //head
  stroke(0);
  fill(255);
  ellipse(mouseX, mouseY-30, 60, 60);
  
  //eyes
  fill(pmouseX, pmouseX-50, pmouseX-10);
  ellipse(mouseX-19, mouseY-30, 16, 32);
  fill(pmouseY, pmouseY+20, pmouseY+30);
  ellipse(mouseX+19, mouseY-30, 16, 32);
  
  //legs
  stroke(0); 
  line(mouseX-10, mouseY+50, pmouseX-10, pmouseY+60); 
  line(mouseX+10, mouseY+50, pmouseX+10, pmouseY+60);

  
}

void mousePressed() {
  println("Take me to your leader!");

}

