
void setup() {
  size(300, 300);
}

void draw() {
  background(255);
  
  //draw creature's body
  smooth();
  strokeWeight(3);
  stroke(50, 190, 40);
  fill(70, 250, 55);
  rectMode(CENTER);
  rect(mouseX, mouseY, 150, 100);
  
  //draw mouth
  rectMode(CENTER);
  rect(mouseX, mouseY+50, 150, 30);
  
  //draw teeth
  fill(255);
  triangle(mouseX-40, mouseY+35, mouseX-60, mouseY+35, mouseX-50, mouseY+55); 
  triangle(mouseX+40, mouseY+35, mouseX+60, mouseY+35, mouseX+50, mouseY+55); 
  
  //draw eyes
  fill(255);
  //left eye
  ellipse(mouseX-25, mouseY, 40, 40);
  //right eye
  ellipse(mouseX+30, mouseY, 50, 50);
  
  //draw eyeballs
  noStroke();
  fill(255, mouseX, mouseY);
  ellipse(mouseX-20, mouseY+5, 25, 25);
  ellipse(mouseX+30, mouseY-7, 30, 30);
  
  //draw legs
  strokeWeight(5);
  stroke(50, 190, 40);
  
  //left leg
  line(mouseX-40, mouseY+66, mouseX-40, mouseY+100);
  line(mouseX-40, mouseY+100, mouseX-60, mouseY+100);
  
  //right leg
  line(mouseX+40, mouseY+66, mouseX+40, mouseY+100);
  line(mouseX+40, mouseY+100, mouseX+60, mouseY+100);
  
  //creature comment
  println("Hello World!");
}

