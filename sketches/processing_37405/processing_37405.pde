
//lesson one

void setup() {
  size(800, 500);
  frameRate(30);
}

void draw() {
  background(255);
  smooth();

//bring character on stage with eyes animating
  //head
  stroke(0);
  strokeWeight(2);
  fill(255, 193, 146);
  ellipse(mouseX, mouseY, 150, 150);
  //mouth
  noStroke();
  fill(0);
  ellipse(mouseX, mouseY+25, 20, 20);

  //eyes
  stroke(0);
  fill(255);
  ellipse(mouseX-50, mouseY-15, 75, 75);
  ellipse(mouseX+50, mouseY-15, 75, 75);
  //pupils
  fill(0);
  ellipse(mouseX-65,pmouseY-25, 25, 25);
  ellipse(mouseX+65,pmouseY-25, 25, 25);
  //eyebrows
  line(mouseX-75,mouseY-65,pmouseX-10,pmouseY-55);
  line(mouseX+10,mouseY-55,pmouseX+75,mouseY-65);

  //feet
  stroke(0);
  fill(255, 193, 146);
  ellipse(mouseX-40,mouseY+80, 75, 20);
  ellipse(mouseX+40,mouseY+80, 75, 20);
}


//make the character stick
void mousePressed() {
  smooth();

  //head
  stroke(0);
  strokeWeight(2);
  fill(255, 193, 146);
  ellipse(mouseX, mouseY, 150, 150);
  //mouth
  noStroke();
  fill(0);
  ellipse(mouseX, mouseY+25, 20, 20);

  //eyes
  stroke(0);
  fill(255);
  ellipse(mouseX-50, mouseY-15, 75, 75);
  ellipse(mouseX+50, mouseY-15, 75, 75);
  //pupils
  fill(0);
  ellipse(mouseX-65,mouseY-25, 25, 25);
  ellipse(mouseX+65,mouseY-25, 25, 25);
  //eyebrows
  line(mouseX-75,mouseY-65,mouseX-10,mouseY-55);
  line(mouseX+10,mouseY-55,mouseX+75,mouseY-65);

  //feet
  stroke(0);
  fill(255, 193, 146);
  ellipse(mouseX-40,mouseY+80, 75, 20);
  ellipse(mouseX+40,mouseY+80, 75, 20);
}

//make the character disappear - clear screen
void keyPressed() {
  background(255);
}



