
void setup(){
  // Set window size
  size(800,800);
  smooth();

}

void draw(){
  
  // Draw white background
  background(255);
  
  // Set Modes
  rectMode(CORNER);
  ellipseMode(CENTER);
  
  // Draw Bob's body
  stroke(0);
  fill(155,111,14);
  rect(mouseX,mouseY,60,120);
  
  //Draw Bob's eyes
  stroke(0);
  fill(50);
  ellipse(mouseX+15,mouseY+40,15,15);
  fill(100);
  ellipse(mouseX+45,mouseY+40,5,5);
  
  //Draw Bob's smile
  stroke(0);
  line(mouseX+15,mouseY+70,mouseX+45,mouseY+60);
  
  //Draw Bob's eyebrows
  stroke(0);
  line(mouseX+0,mouseY+45,mouseX+10,mouseY+40);
  line(mouseX+20,mouseY+40,mouseX+60,mouseY+20);
  
  //Draw Bob's legs
  stroke(0);
  strokeWeight(2);
  line(mouseX+20,mouseY+120,mouseX+15,mouseY+160);
  line(mouseX+40,mouseY+120,mouseX+40,mouseY+160);
  
  //Draw Bob's skateboard
  stroke(0);
  strokeWeight(1);
  fill(255,0,0);
  rect(mouseX,mouseY+160,110,7);
  fill(0);
  ellipse(mouseX+20,mouseY+177,10,10);
  ellipse(mouseX+90,mouseY+177,10,10);
  noFill();
  ellipse(mouseX+20,mouseY+177,20,20);
  ellipse(mouseX+90,mouseY+177,20,20);
  
  //Draw Bob's trajectory
  stroke(155);
}


