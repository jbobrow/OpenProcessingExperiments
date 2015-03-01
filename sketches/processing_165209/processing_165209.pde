
//makes s shape variable 
PShape n;
//makes image pwpt a variable 
PImage pwpt;

//sets up things that only happen once
void setup() {
  //sets the size
  size(500, 500);
  //tells the program what pwpt means
  pwpt = loadImage("pwpt.jpg");
  //loads shape
  n=loadShape("neuron-01.svg");
  //ends void setup
}

//sets up things that coninuously draw
void draw() {
  //sets up if statement for if q is pressed
  if (key=='q') {
    //tells program that if q is pressed, run workingmemorytest
    workingmemorytest();
    //ends if statement
  }
  //sets up if statement for if w is pressed
  if (key == 'w') {
    //tells program that if q is pressed, run thumbnails
    thumbnails();
    //ends if statement
  }
  //sets up if statement for if e is pressed
  if (key == 'e') {
    //tells program that if q is pressed, run neuralpatterns
    neuralpatterns();
    //ends if statement
  }
  //sets up if statement for if a key pressed
  if (keyPressed) {
    //sets up nested if statement for if that key pressed is e
    if (key == 'e') {
      //changes the background to black ONLY ONCE if e is pressed
      background(0);
      //ends if statement
    }
    //ends if statement
  }
  //ends void draw
}





//sets up custom function workingmemorytest
void workingmemorytest() {
  //sets the baground to white
  background(255);
  //makes fonts possible?
  PFont CG;
  //loads a font from the sketch's data folder and names it CG
  CG = createFont("CenturyGothic.ttf", 30);
  //sets the fill (text color)
  fill(0, 150, 150);
  //sets the font to CG, size 30
  textFont(CG, 35);
  //outputs this text at this location 
  text("Working Memory Test", 50, 50);
  //sets the font to CG, size 20
  textFont(CG, 20);
  //outputs this text at this location 
  text("You have 5 seconds to do this task.", 50, 90);
  //outputs this text at this location 
  text("You will be trying to remember as many", 50, 120);
  //outputs this text at this location 
  text("words as possible from a list that will appear.", 50, 150);
  //outputs this text at this location 
  text("Hold down the mouse for five seconds. Go.", 50, 180);

  //sets up if statement for if mouse is pressed
  if (mousePressed) {
    //draws a new background
    background(255);
    //sets font to CG, size 30
    textFont(CG, 35);
    //outputs this text at this location 
    text("cat", 300, 300);
    //outputs this text at this location 
    text("banana", 300, 350);
    //outputs this text at this location 
    text("love", 300, 400);
    //outputs this text at this location 
    text("chair", 300, 450);
    //outputs this text at this location 
    text("run", 50, 300);
    //outputs this text at this location 
    text("chirp", 50, 350);
    //outputs this text at this location 
    text("print", 50, 400);
    //outputs this text at this location 
    text("sharp", 50, 450);
    //ends if statement
  }
  //ends workingmemorytest
}

//sets up custom function thumbnails
void thumbnails() {
  //sets background
  background(51, 193, 227);
  //resizes image pwpt
  pwpt.resize(500, 397);
  //calls image
  image(pwpt, 0, 0);
  //ends void thumbnails
}

//sets up custom function neuralpatterns
void neuralpatterns() {
  //sets framerate
  frameRate(10);
  //calls shape
  shape(n, 150, 100);
  //rotates shape somehow
  n.rotate(180); 

  //sets up if statement for if the mouse is pressed
  if (mousePressed) {
    //if the mouse is pressed, a new background is drawn
    background(0);
    //ends if statement
  }
  //ends neural patters
}



