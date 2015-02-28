
/*Exercise 3 Part A - 1
Trying out importing Images into Processing
and manipulating the sketch.
Press and drag to draw colours
Press 'C' to clear the screen of residue.*/

/*Declare the img variable to be used later*/
PImage img;

/*Setting up the canvas*/
void setup() {
  
  // set up the background
  img = loadImage("swing.jpg"); 
  
  //canvas size is same as image
  size(1000, 750);
  noStroke();
  
  //slightly thicker lines than normal
  strokeWeight(5);
  
  //drawing ellipses from the center
  ellipseMode(CENTER);
  
  //keep a decent speed for animating
  frameRate(60);
  
  //anti-alias the lines/shapes
  smooth();
  
  // Display at half opacity
  tint(255, 255);
  
  image(img,0,0);
}
 
void draw() {
  // Display at half opacity
  tint(255, 10);
  // redraw background for animation
  image(img,0,0);
}

void mouseDragged(){
 
  /*dragging the mouse while pressing down will draw four distinct lines of colour
 like the finger lights used to create the image*/
  stroke(255);
  line(mouseX,mouseY,pmouseX,pmouseY);
  stroke(255,0,0);
  line(mouseX+5,mouseY+5,pmouseX+5,pmouseY+5);
  stroke(0,255,0);
  line(mouseX-5,mouseY-5,pmouseX-5,pmouseY-5);
  stroke(0,0,255);
  line(mouseX-5,mouseY,pmouseX-5,pmouseY);
}

void keyPressed(){
  /*clear the screen of the random lights*/
  if(key=='c'){
    background(0);
    tint(255,255);
    image(img,0,0);
  }
}

