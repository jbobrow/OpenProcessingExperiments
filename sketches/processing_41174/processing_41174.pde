
Bubble [] bubbles = new Bubble[0];
/* I'm making the assumption that 'ac' is in fact gravity which should probably be a global property... */
float gravity = 0.1;
 
  
  
 PImage img; 
  
void setup(){
  size (500,350);
  smooth();
  img = loadImage ("wall.jpg");
}
  
void draw(){
  background(50);
  //display balls
  
  image (img,0,0); 
  
  for (int i=0; i<bubbles.length; i++){
    bubbles[i].display();
  }
}
  
void mousePressed(){
  //append new object directly to the array
  bubbles = (Bubble[]) append(bubbles, new Bubble(mouseX, mouseY));
}
 
void mouseReleased(){
  // in the array set the last ball's 'newBall' property to false:
  // Note: bubbles.length is the number of balls in the array so the index of the last ball is bubbles.length-1
  bubbles[bubbles.length-1].newBall = false;
}

