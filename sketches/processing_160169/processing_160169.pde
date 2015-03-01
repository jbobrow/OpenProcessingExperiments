
//week 2 assignment 7b
//bouncing zoog
 
//canvas setup
int width = 300;
int height = 300;
 
//steady variables
int headW = 100;
int headH = 50;
int eyeDia = 20;
 
//speed variables
float gravity = 0.2;

float globalX = 150; //must be larger than headW/2
float globalY = 50; //must be larger than headH/2
float xspeed = 0;
float yspeed = 0;
  
//move variable
boolean move = false;
 
void setup() {
size(width,height);
background(255);
ellipseMode(CORNER);
rectMode(CORNER);
}
   
void draw() {

//moving zoog
if (move) {
yspeed = yspeed + gravity;

globalX = globalX + xspeed;
globalY = globalY + yspeed;
}
 
if ((globalX+headW/2) == width || (globalX-headW/2) == 0) {        //makes sure the zoog bounces when the edge of his             head touches the edge of the screen.
xspeed = xspeed * -1;
}
 
if ((globalY+headH/2) > height) {
yspeed = yspeed * -0.95;
}

//general
background(255);
strokeWeight(3);
   
//variables
int headX = globalX - 50;
int headY = globalY - 25;
int eyeLX = globalX - 25;
int eyeRX = globalX + 25;
int eyeY = globalY - 20;
int mouthLX = globalX - 25;
int mouthRX = globalX + 25;
int mouthY = globalY + 10;
   
//head
ellipseMode(CORNER);
fill(globalX,globalY,100);
ellipse(headX,headY,headW,headH);
   
//eyes
fill(255);
ellipseMode(CENTER);
ellipse(eyeLX,eyeY,eyeDia,eyeDia);
ellipse(eyeRX,eyeY,eyeDia,eyeDia);
point(eyeLX,eyeY);
point(eyeRX,eyeY);
   
//mouth
strokeWeight(5);
line(mouthLX,mouthY,mouthRX,mouthY);
   
}
 
void mousePressed() { //if the mouse if pressed, it turns the move variable on or off.
move = !move
}
  
