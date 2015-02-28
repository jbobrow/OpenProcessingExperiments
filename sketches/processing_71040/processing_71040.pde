
PImage wood1; //Declares attribute "wood1" as an image
PImage wood2; //Declares attribute "wood2" as an image

void setup() { //Start of void setup
  //Set size as 500 pixels by 500 pixels
  size (500,500);
  //Set background as wood1
  wood1 = loadImage("Wood1.jpg");
  background(wood1);  
} //End of void setup

void draw () { //Start of void draw
  //Line colour
  stroke(205,183,158,150);
  //Line thickness
  strokeWeight(10);
  //Have line follow mouse
  line(mouseX, mouseY, pmouseX, pmouseY);
  //Cursor as termite image
  PImage termite;
  if (mousePressed && (mouseButton == LEFT)){ //Start of IF statement
    termite = loadImage("termitedown.gif");
    cursor(termite);
  } //End of IF statement
  else{ // Start of ELSE statement
    termite = loadImage("termiteup.gif");
    cursor(termite);
  } //End of ELSE statement
} //End of void draw

void keyPressed() { //Start of void keyPressed
  //Reset background
  if(key == 'r' || key == 'R') { //Start of IF statement
  wood2 = loadImage("Wood2.jpg");
  background(wood2);
  } //End of IF statement
} //End of void keyPressed

