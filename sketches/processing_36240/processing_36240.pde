
import processing.pdf.*;
int a = 80;
int colour = 204;
 
void setup(){
  size(500,500);
  background(255);
}
 
void draw(){

fill(colour);
  ellipse(mouseX, mouseY, a, a);
}
 
 void mouseDragged(){
   colour = colour + 10;
   if(colour > 300){
     colour =0;
   }
 }


