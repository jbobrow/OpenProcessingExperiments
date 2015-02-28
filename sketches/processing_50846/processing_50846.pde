
void setup() {
  //Set the size of the window
  size(400, 400);
}
void draw() {
  smooth();
  //Draw a light gray background
  background(150);
  //Draw Creature's RIGHT arm
  stroke(0);
  fill(203, 154, 92);
  rect(mouseX-50, mouseY-20,10,50);
  //Draw Creature's LEFT arm
  rect(mouseX+40, mouseY-20,10,50);
  //Draw Creature's RIGHT hand
  fill(242,186,113);
  ellipse(mouseX-46,mouseY+30,20,20);
  //Draw Creature's LEFT hand
  ellipse(mouseX+46,mouseY+30,20,20);
  //Draw Creature's RIGHT shoulders
  fill(203,154,92);
  ellipse(mouseX+42, mouseY-30,27,27);
  //Draw Creature's LEFT shoulders
  ellipse(mouseX-42, mouseY-30,27,27);
  //Draw Creature's RIGHT leg
  stroke(0);
  fill(203,154,92);
  rect(mouseX-23,mouseY+40,15,100);
  //Draw Creature's LEFT leg
  rect(mouseX+8,mouseY+40,15,100);
  //Draw Creature's RIGHT foot
  fill(242,186,113);
  ellipse(mouseX-23,mouseY+140,30,15);
  //Draw Creature's LEFT foot
  ellipse(mouseX+23,mouseY+140,30,15);
  //Draw Creatures's body
  stroke(0);
  fill(203,154,92);
  ellipse(mouseX+.5, mouseY+10,70,130);
  //Draw Creature's head
  fill(242,186,113);
  ellipse(mouseX, mouseY-70,80,60);
  //Draw Creature's RIGHT ear
  fill(203,154,92);
  ellipse(mouseX+46, mouseY-90,25,25);
  //Draw Creature's LEFT ear
  ellipse(mouseX-46, mouseY-90,25,25);
  //Draw Creature's RIGHT eye
  fill(mouseX,mouseY);
  ellipse(mouseX-22, mouseY-70,10,10);
  //Draw Creature's LEFT eye
  fill(mouseX,mouseY);
  ellipse(mouseX+22, mouseY-70,10,10);
  //Draw Creature's nose
  fill(203,154,92);
  ellipse(mouseX, mouseY-62,20,10);
  //Draw Creature's mouth
  fill(0);
  ellipse(mouseX, mouseY-47,15,7);
  //Draw Creature's tongue
  noStroke();
  fill(232,87,87);
  ellipse(mouseX, mouseY-44,15,3);
  //Draw Creature's stomach
  fill(242,186,113);
  ellipse(mouseX, mouseY+9,50,80);
}


