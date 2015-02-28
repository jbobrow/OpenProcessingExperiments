
//Homework 3, Jim Roberts, Programming for the Arts with Processing.
//Copyright Nathan Trevino, Pittsburgh, PA. Carnegie Mellon University

//variable declarations 
float x, y;

//this is only run once. 
//after the initial run of the "void setup"
//the lines between these braces are never called again.
void setup(){
  size(450,450);
  smooth();
  noCursor();
  background(60);
  frameRate(100);
  rectMode(CENTER);
 
}

//this runs every frame 
void draw() {
  
  //this controlls the color of the brush
  noStroke();
  fill(mouseX/2,mouseY/2,random(256),200);
  
 
  
  //this is the brush
  //changes color according to the position
  //color specs above.
  ellipse(mouseX,mouseY,60,60);
}

  //this resets the background.
  //it is the "erase" button
void mousePressed() {
  background (random (256), random (256), 255, random (256));
}
 

