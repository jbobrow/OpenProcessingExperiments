
import processing.pdf.*;

PImage A;
void setup()
{
  size(360,400);
  background(10,60,90);
  A=loadImage("A.jpeg"); 
  //this is the loop that changes the ypos 
  
  for (int ypos = 0; ypos < 400; ypos = ypos + 100){
  
    
  //this is the loop that changes the xpos
  for(int xpos = 0; xpos < 400; xpos = xpos + 100){
 
  
  fill(200,100,120);
  rect(xpos-33, ypos+22, 100, 47);
  
  fill(67, 112, 36);
  image(A, xpos-9, ypos+11, 80,90);   
  
  fill(100);
  line(xpos-8, ypos+8, 500, 500);  
  
  fill(20,250,100);
  ellipse(xpos-30, ypos+30, 30, 45);
  
  
  
}
    
    }
  }

 
  
  


