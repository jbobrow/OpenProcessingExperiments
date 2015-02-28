
//20131002mouse interaction
//juichilin
//class 

void setup() {
  size(450, 450);
  smooth();
}

void draw() {
  if (mousePressed) {
    fill(0);
  }
  else {
    fill(30, 60, 90, 90);
    stroke(255);
  }

  
  myBox(mouseX-width/2);//setup the start point1
  myBox(mouseY-height/2);//setup the start point2
}

void myBox(int mywidth) {
  //below functions will follow the mouse &the program you define
  //mywidths need relation with each other.
  ellipse(mouseX, mouseY, mywidth, mywidth);
  ellipse(mouseX, mouseY, mywidth/2, mywidth/2);
  rect(mouseX, mouseY, -mywidth/3*2, -mywidth/3*2);
  rect(mouseX, mouseY, mywidth/3*2, mywidth/3*2);
  rect(mouseX, mouseY, -mywidth/3*2, mywidth/3*2);
  rect(mouseX, mouseY, mywidth/3*2, -mywidth/3*2);
}



