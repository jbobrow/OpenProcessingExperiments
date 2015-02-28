
void setup () {
  size (500,500);
  smooth ();
  frameRate (30);
}

void draw () {
  
  
  // draw white bg
  background (255);
  
 // ellipse and rect to center 
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  //Monster R Ear 
  fill(255,mouseX,mouseY);
  ellipse(mouseX+100,mouseY-150,100,100);
  
  //Inside Monster R Ear
  fill(mouseX,100,mouseY);
  ellipse(mouseX+100,mouseY-150,60,60);
  
  //Monster L Ear
  fill(255,mouseX,mouseY);
  ellipse (mouseX-100,mouseY-150,100,100);
  
  //Inside Monster L Ear
  fill(mouseX,100,mouseY);
  ellipse (mouseX-100,mouseY-150,60,60);
  
    // Right Arm
  fill(150,mouseY,mouseX);
  rect (mouseX+100,mouseY+50,100,10);
  
  // Right Hand
  fill(200,mouseX,mouseY);
  ellipse (mouseX+150,mouseY+50,30,30);
  
  
  // Left Arm
  fill(mouseX,150,mouseY);
  rect (mouseX-100, mouseY+50,100,10);
  
  // Left Hand
  fill(200,mouseX,mouseY);
  ellipse (mouseX-150,mouseY+50,30,30);
  
  // Monster body
  stroke(0);
  ellipse(mouseX,mouseY,200,400);
  
  // Monster L eye
  ellipse(mouseX-30,mouseY-50,50,150);
 
   // L Pupil
  ellipse(mouseX-30,mouseY-50,30,120);
  
  //Monster R eye
  ellipse(mouseX+30,mouseY-50,50,150);
  
  // R Pupil
  ellipse(mouseX+30, mouseY-50,30,120);
  
  //Monster Mouth
  ellipse(mouseX,mouseY+100,100,70);
  
}

void mousePressed() {
  println("My name is Monster 2");
}
  

