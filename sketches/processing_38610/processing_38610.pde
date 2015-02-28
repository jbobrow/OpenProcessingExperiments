
//click on character to drag him around
//click again to make him stick
//press any key to make him disappear
//click anywhere to make him re-appear

boolean button = false;
float x = 400;
float y = 250;

void setup() {
  size(800, 500);
  background(255);
  smooth();
  strokeWeight(2);
  frameRate(30);

  //CHARACTER
  //head
  fill(255, 193, 147);
  ellipse(x, y, 150, 150);
  //mouth
  noStroke();
  fill(0);
  ellipse(x, y+25, 20, 20);
  //eyes
  stroke(0);
  fill(255);
  ellipse(x-50, y-15, 75, 75);
  ellipse(x+50, y-15, 75, 75);
  //pupils
  fill(0);
  ellipse(x-65, y-25, 25, 25);
  ellipse(x+65, y-25, 25, 25);
  //eyebrows
  line(x-75, y-65, x-10, y-55);
  line(x+10, y-55, x+75, y-65);
  //feet
  stroke(0);
  fill(255, 193, 147);
  ellipse(x-40, y+80, 75, 20);
  ellipse(x+40, y+80, 75, 20);
}

void draw() {
  smooth();

  //CHARACTER
  //head
  if (button ==true) {
    background(255);
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
    ellipse(mouseX-65, pmouseY-25, 25, 25);
    ellipse(mouseX+65, pmouseY-25, 25, 25);
    //eyebrows
    line(mouseX-75, mouseY-65, pmouseX-10, pmouseY-55);
    line(mouseX+10, mouseY-55, pmouseX+75, mouseY-65);
    //feet
    stroke(0);
    fill(255, 193, 146);
    ellipse(mouseX-40, mouseY+80, 75, 20);
    ellipse(mouseX+40, mouseY+80, 75, 20);
  }
}


//make the character stick or re-appear
void mousePressed() {
  smooth();
  button=!button;

  //CHARACTER
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
  ellipse(mouseX-65, mouseY-25, 25, 25);
  ellipse(mouseX+65, mouseY-25, 25, 25);
  //eyebrows
  line(mouseX-75, mouseY-65, mouseX-10, mouseY-55);
  line(mouseX+10, mouseY-55, mouseX+75, mouseY-65);
  //feet
  stroke(0);
  fill(255, 193, 146);
  ellipse(mouseX-40, mouseY+80, 75, 20);
  ellipse(mouseX+40, mouseY+80, 75, 20);
}

//make the character disappear - clear screen
void keyPressed() {
  background(255);
}


