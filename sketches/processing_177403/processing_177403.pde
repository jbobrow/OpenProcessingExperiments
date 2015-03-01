
//This is the last project for the wonderful course :"Introduction To Computationnal Arts//
//We must bring all together, the skills we acquired//
//For this project, i used the ellipses
//Dragging the ellipses with the mouse allows you to draw a star and the universe is in the center
/**
 * drawing ellipses by clicking the mouse
 *    
 * Holding the mouse and drawing
 * 
 * KEYS
 * s                   : save png
 * 7-9                 : change the stroke color
 * DELETE or BACKSPACE : erase the canvas
 */
 
 /* I also add an image that i created with photoshop
 The image is referencing to the course*/
 
//Global Variables
color strokeColor = color(0, 10);

//setup()
//Declae a PImage variable Type
PImage intro4;

//Load an image file from HDD
//This is the image i created for this last project with photoshop. I used the skills i acquired to draw it//
void setup() {
  size(1200, 600);
  intro4 = loadImage("intro4.png");
  colorMode(HSB);
  noFill();
  background(250);
 
}




  

//Draw the image to the screen at (0,0)
void draw()  {
  image(intro4, 0, 0);
  
  if(mousePressed){
  pushMatrix();
  translate(width/2, height/2);
  //map(value, start1, stop1, start2, stop2);
  int circleResolution = (int)map(mouseX, 10, height-600, 10, 10);
  int radius = mouseX-600;
  float angle = TWO_PI/circleResolution;
  
  strokeWeight(2);
  stroke(strokeColor);
  
  for (int i=0; i<circleResolution; i++){
    float x = 0 + cos(angle*i) * radius;
    float y = 0 + sin(angle*i) * radius;
    ellipse(x, y, 100, 100); 
  }
  popMatrix();
 }
}

//Keyboard Input
void keyPressed(){
  if (key=='s'|| key=='S') saveFrame("assignment.png");
  if (key== DELETE || key==BACKSPACE) background(250);
  
  switch(key){
    case '7':
      strokeColor = color(161, 100, 255, 10);
      break;
    case '8':
      strokeColor = color(200, 100, 255, 10);
      break;
    case '9':
      strokeColor = color(200, 100, 150, 10);
      break;

  }
}




