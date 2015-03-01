
///* @pjs preload= "empty_frame_by_cnpollard-d57w07t.png"; */

float mx ;
PImage photo;
void setup() {
  background(255);
  size(530,700);
  photo= loadImage("empty_frame_by_cnpollard-d57w07t.png");
  smooth();
  strokeWeight(5);
  
}

void draw() {
  mx=mouseX;
  image(photo,0,0,photo.width/1.3,photo.height/1.3);
 if (mousePressed) {
   if(mouseButton == LEFT){
 line(mouseX,mouseY,pmouseX,pmouseY);
 }
 }
 
 if(mousePressed) {
   if(mouseButton == RIGHT){
     strokeWeight(20);
     stroke(255);
     line(mouseX, mouseY, pmouseX, pmouseY);
   }
 }
}




