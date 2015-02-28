
void setup() {
  size(1000, 1000); //made the background larger than usual because monster is long
  background(87);
}
void draw() {
  if(mousePressed){ /*when the monster is pressed, the color of the background 
  changes color*/ 
  background(255,0,0,255);//red color code
  }
  else { //grey background
   background(87);
  } 
  strokeWeight(5); //thickness of lines
  stroke(8); //line color black
  fill(225);//white fill for the following
  triangle(mouseX-400, mouseY+280, mouseX-50, mouseY+60, mouseX-30, mouseY+60); //left leg
  triangle(mouseX+400, mouseY+280, mouseX+50, mouseY+60, mouseX+30, mouseY+60); //right leg
  ellipse(mouseX-400, mouseY+280, 20, 20); //first ball left
  ellipse(mouseX-410, mouseY+300, 20, 20); //second ball left
  ellipse(mouseX+400, mouseY+280, 20, 20); //first ball right
  ellipse(mouseX+410, mouseY+300, 20, 20); //second ball right
  triangle(mouseX+400, mouseY+280, mouseX+240, mouseY+250, mouseX+200, mouseY+250); //claw right
  triangle(mouseX-400, mouseY+280, mouseX-240, mouseY+250, mouseX-200, mouseY+250); //claw left
  strokeWeight(5); //line thickness
  fill(255);//color for body white
  ellipse(mouseX, mouseY, 200, 200); //main circle for body
  fill(225); //color for eyes white
  if(mousePressed){ /*when mouse is clicked eyes change positions*/
  triangle(mouseX-25, mouseY-25, mouseX-30, mouseY-35, mouseX-60, mouseY-30); //left eye
  triangle(mouseX+25, mouseY-25, mouseX+30, mouseY-35, mouseX+60, mouseY-30); //right eye
  }
  else {
  triangle(mouseX-15, mouseY-15, mouseX-25, mouseY-30, mouseX-60, mouseY-30); //left eye
  triangle(mouseX+15, mouseY-15, mouseX+25, mouseY-30, mouseX+60, mouseY-30); //right eye
  }
  fill(0);//color black mouth
  stroke(0); //
  if(mousePressed){ /*mouth moves smaller when the monster is pressed*/
  ellipse(mouseX-10, mouseY+30, 30, 30); //mouth left
  ellipse(mouseX+10, mouseY+30, 30, 30); //mouth right
  }
  else {
  ellipse(mouseX-10, mouseY+30, 50, 50); //mouth left
  ellipse(mouseX+10, mouseY+30, 50, 50); //mouth right  
  }
  stroke(0); //line thickness
  fill(225); //white forehead triangle color
  triangle(mouseX+80, mouseY-105, mouseX-100, mouseY-100, mouseX-10, mouseY-50); //forehead triangle
  strokeWeight(5); //line thickness
  if(mousePressed) { /*arms shrink when monster is pressed*/
  line(mouseX-150, mouseY-5, mouseX-200, mouseY-5); //left arm
  line(mouseX+150, mouseY-5, mouseX+200, mouseY-5); //right arm
  }
  else {
  line(mouseX-100, mouseY-5, mouseX-250, mouseY-5); //left arm
  line(mouseX+100, mouseY-5, mouseX+250, mouseY-5); //right arm
  }
  ellipse(mouseX-150, mouseY+1, 40, 40); //hand ball left
  ellipse(mouseX+150, mouseY+1, 40, 40); //hand ball right
}




