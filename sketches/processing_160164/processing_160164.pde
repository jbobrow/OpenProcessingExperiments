
//week 2 assignment 6b
//moving the zoog on mouse click
 
//steady variables
int headW = 100;
int headH = 50;
int eyeDia = 20;
 
//speed variables
int globalX = 30;
int globalY = 30;
int xspeed = 1;
int yspeed = 1;

//move variable
boolean move = false;

void setup() {
size(300,300);
background(255);
ellipseMode(CORNER);
rectMode(CORNER);
}
 
void draw() {
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
 
//moving zoog
if (move) {
globalX = globalX + xspeed;
globalY = globalY + yspeed;
}
 
}
 
void mousePressed() { //if the mouse if pressed, it turns the move variable on or off.
move = !move
}


