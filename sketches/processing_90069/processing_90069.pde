
//Wenda Lewis Teh
//Class assignment 3
//16 Feb 2013

 float angle = 0.0;
 float offset = 300;
 float scalar = 2;
 float speed = 0.1;
 
void setup() {
  size(600,600);
  smooth();
  background(3,3,3);
  strokeWeight(1);
}

void draw() { 
if (mouseY < 300) { //top-left corner
  if (mouseY > 0) {
    if (mouseX < 300) {
      if (mouseX >0) {
    float x = offset + cos(angle) * scalar*3;
    float y = offset + sin(angle) * scalar*3;
    stroke(255,3,121);
    line(x,y,mouseX,mouseY);
    angle += speed;
    scalar += speed/3;
     if (mousePressed == true) {
    stroke(247,150,2);
   line(x,y,mouseX,mouseY);
    angle += speed;
    scalar += speed/3;
}}}}}

if (mouseY < 300) { //top-right corner
  if (mouseY > 0) {
    if (mouseX  <600) {
      if (mouseX >300) {
    float x = offset + cos(angle) * scalar*3;
    float y = offset + sin(angle) * scalar*3;
    stroke(196,32,38);
    line(x,y,mouseX,mouseY);
    angle += speed;
    scalar += speed/3;
     if (mousePressed == true) {
    stroke(5,255,144);
   line(x,y,mouseX,mouseY);
    angle += speed;
    scalar += speed/3;
}}}}}

if (mouseY < 600) { //bottom-right corner
  if (mouseY > 300) {
    if (mouseX  <600) {
      if (mouseX >300) {
    float x = offset + cos(angle) * scalar*3;
    float y = offset + sin(angle) * scalar*3;
    stroke(98,206,4);
    line(x,y,mouseX,mouseY);
    angle += speed;
    scalar += speed/3;
     if (mousePressed == true) {
    stroke(168,44,145);
   line(x,y,mouseX,mouseY);
    angle += speed;
    scalar += speed/3;
}}}}}

if (mouseY < 600) { //bottom-left corner
  if (mouseY > 300) {
    if (mouseX  <300) {
      if (mouseX >0) {
    float x = offset + cos(angle) * scalar*3;
    float y = offset + sin(angle) * scalar*3;
    stroke(255,247,5);
    line(x,y,mouseX,mouseY);
    angle += speed;
    scalar += speed/3;
     if (mousePressed == true) {
    stroke(0,27,252);
   line(x,y,mouseX,mouseY);
    angle += speed;
    scalar += speed/3;
}}}}}





  
}  //end of void draw

void keyPressed(){
    background(3,3,3);
    
  
} //end of void keypressed
