
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim m;
AudioPlayer bubble;
AudioPlayer bubble1;

float posX; // position variables
float posY;
float[] circle_a;
float[] circle_b;
int index = 0;

  
float speedX; // speed variables
float speedY;
 
 //colour
 float j = 67;
 float k = 13;
 float l =200;
 
void setup(){
  size(700,400);
  background(255);
   smooth();
    
  circle_a = new float[40];
  circle_b = new float[40];
  
  m = new Minim(this);
  bubble = m.loadFile("bubble_sound.wav");
  bubble1 = m.loadFile("button_1.wav");
  
   
  posX = width / 2;
  posY = width / 2;
  speedX = 0;
  speedY = 0;
}
 
  
 
void draw(){
  if (mousePressed) {
    if ((mouseX > (posX - 20) && mouseX < (posX + 20)) &&
        (mouseY > (posY - 20) && mouseY < (posY + 20))) {
      speedX = mouseX - pmouseX;
      speedY = mouseY - pmouseY;
    }
  }
 
 // Calculate the new position
  posX = posX + speedX;
  posY = posY + speedY;
  
  // If the position is outside of the window: bounce
  if (posX > width - 30 || posX <= 30) {
    speedX = -speedX;
    bubble1.loop(0);
  
  }
   if (posY > height - 30 || posY <= 30) {
    speedY = -speedY;
    bubble.loop(0);
   }
   
  // Add a little friction
  speedX = speedX * 0.995;
  speedY = speedY * 0.995;
    background(94,178,178);
    noStroke();
  
  for (int i=0; i < circle_a.length; i++) { 
    int pos = (index+i) % circle_a.length;
      
  
    fill(map(i, 0, circle_a.length, 0, 100), k, j, l);  
    ellipse(circle_a[pos], circle_b[pos], 20+i, 20+i);
    
 //Black worm   
    fill(94,178,178);
    ellipse(circle_a[pos], circle_b[pos],1+i, 1+i);
    //eyes
   // fill(0,0,0,75);
    //ellipse(circle_a[pos]-10, circle_b[pos]-10,4, 4);
    //ellipse(circle_a[pos]+10, circle_b[pos]-10,4, 4);
    //ellipse(circle_a[pos], circle_b[pos]+10,10, 10);
    
    
    //Extra circles - visual components?
    /*fill(94,178,178);
    ellipse(circle_a[pos]-30, circle_b[pos]+30, -20+i, -20+i);
    ellipse(circle_a[pos]+30, circle_b[pos]-30,-20+i, -20+i);
    ellipse(circle_a[pos]-30, circle_b[pos]-30,-20+i, -20+i);  
    ellipse(circle_a[pos]+30, circle_b[pos]+30,-20+i, -20+i);
    ellipse(circle_a[pos]+0, circle_b[pos]+50,-20+i, -20+i);
    ellipse(circle_a[pos]+50, circle_b[pos]+0,-20+i, -20+i);
    ellipse(circle_a[pos]-50, circle_b[pos]-0,-20+i, -20+i);
    ellipse(circle_a[pos]-0, circle_b[pos]-50,-20+i, -20+i);
*/


  
  
  }
  
  circle_a[index] = posX;
  circle_b[index] = posY;
  index++;
  
  if (index >= circle_a.length) index = 0;
  
    if(mouseButton == RIGHT){   
     j = 109;
     k = 7;
     l = 90; 
    } 
 if(mouseButton == LEFT){
  j = 333;
  k = 93;
  l =93;
 }

 
}



