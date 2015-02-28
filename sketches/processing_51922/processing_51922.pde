
PFont f;

void setup () {
  //set the size of the window
  size (500, 500);
  smooth();
  frameRate(30);
  f = createFont ("Garamond", 16, true);

}

void draw()  {
  //draw a mint background
  background(152, 251, 151);
  
  //Set ellipses and rectangles to CENTER mode
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  //Draw Electrode's body
  stroke(255);
  fill(175);
  rect(mouseX, mouseY, 20, 100);
  
  //Draw Electrode's head
  stroke(255);
  fill(255);
  ellipse(mouseX, mouseY-30, 60, 60);
  
  //Draw Electrode's Eyes
  fill(mouseX, 0, mouseY);
  ellipse(mouseX-19, mouseY-30, 16, 32);
  ellipse(mouseX+19, mouseY-30, 16, 32);
  
  //Draw Electrode's legs
  stroke(255);
  line(mouseX-10, mouseY+50, pmouseX-10, pmouseY+70);
  line(mouseX+10, mouseY+50, pmouseX+10, pmouseY+70);
  line(mouseX-5, mouseY+50, pmouseX-10, pmouseY+70);
  line(mouseX+5, mouseY+50, pmouseX+10, pmouseY+70);

  //Draw Electrode's Hat
  stroke(255);
  fill(mouseX, 0, mouseY);
  triangle(mouseX+50, mouseY-60, mouseX-50, mouseY-60, mouseX, mouseY-90);
  line(mouseX+50, mouseY-60, mouseX+50, mouseY-40);
  
  //Make Electrode Speak
  textFont(f,16);
  fill(0);
  text("My name is Electrode! Pleased to meet you!", 100, 60);
  
}


void mousePressed()  {
  println("My name is Electrode! Pleased to meet you!");
}

void keyPressed() {
  if (key=='s'){
    saveImage();
  }
  if(key=='b'){
    filter(BLUR);
  }
}

