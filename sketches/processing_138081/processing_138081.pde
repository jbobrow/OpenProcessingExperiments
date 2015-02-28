
/*
  ////////////////////////////////// Introduction to computational arts Final Project //////////////////////////////////////////////////////////
                                     Author: Amr M. Elsaid
                                     Project name: zooming matrix
                                     Descryption: 5x5 matrix that enables zooming using Up arrow, Un-zooming using Down arrow , Rotate right using 
                                     Right arrow, and rotating left using left arrow. To start it click on the canvas, Delete or Backspace cleares the 
                                     screen,Space returns unrotated canvas and 's' or 'S' saves a snapshot ,dragging the mouse moves the matrix with it.
  
*/

// Color palette
color[] rainyday = {#31414D, #4A9AD4, #84AECC, #1B374D, #638299};
color[] palette = rainyday;
//length of the rect sides
int len = 40;
//temporary value to store the mouse clicked value 
//to trigger the sketch 
int temp=0;
//Initial position variables
float xo;
float yo;
//Initial zoom
float zoom = 1;
//initial rotational angle
float angle = 0;

void setup() {
  //canvas size 
  size(900, 600);
  xo = width/2;
  yo = height/2;
  //anti aliasing
  smooth();
  //cancelling the stroke
  noStroke();
}
//generating the coloumn using it's X-axis value
void drawCol(int x) {
   rect(x, -180, len, len);
   rect(x, -100, len, len);
  rect(x, -20, len, len);
  rect(x, 60, len, len);
  rect(x, 140, len, len);
}

void draw() {
  //setting background color 
  background(palette[0]);
  translate(xo, yo);
  //using zoom as scaling factor
  scale(zoom);
  //using the angle as rotation factor 
  rotate(angle);
  //checking if the mouse is pressed to
  //trigger the sketch
  if (mousePressed){
    temp=1;}
    //if triggered draw the matrix
    if(temp==1){
  //filling the rect with the selected color 
  fill(palette[1]);
  //used code block to minimize the code size
  drawCol(-200);
  fill(palette[2]);
  drawCol(-100);
  fill(palette[3]);
  drawCol(0);
  fill(palette[4]);
  drawCol(100);
  fill(#CE1D1D);
  drawCol(200);
}}
//getting pressed keys
void keyPressed() {
  //if delete/Backspace is pressed clear the screen
   if(key ==DELETE||key==BACKSPACE)
      temp=0;
  // s saves snapshots
  if(key=='s'|| key=='S')
  saveFrame("screenshot.png");
  if (key == CODED) {
    //Up zooms in
    if (keyCode == UP) {
      zoom += .03;
    } else if (keyCode == DOWN) {
      //down zooms out
      zoom -= .03;
      //right rotates right
    } else if (keyCode == RIGHT) {
      angle += .03;
      //left rotates left
    } else if (keyCode == LEFT) {
      angle -= .03;
    }
  }
  //space cleares the screen 
  if (key == ' ') {
    angle = 0;
    zoom = 1;
    xo = width/2;
    yo = height/2;
  }
}
//mouse dragged moves the matrix
void mouseDragged() {
  xo = xo + (mouseX - pmouseX);
  yo = yo + (mouseY - pmouseY);
}


