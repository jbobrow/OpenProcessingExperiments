
/*=======================================
"Accumulating Gestures - Boxes"
Animated Squares LAB
 
Modified 2/5/2015
 
Sarah Hockman
hockman.25@osu.edu
hockman.25@gmail.com
 
Created for Art 3001 - Data Visualization
BFA in Art and Technology
The Ohio State University
http://www.openprocessing.org/classroom/4626
 
=======================================*/


//setup animation
void setup() {
  background(255);
  size(500,500);
}
 
//appearance  
void draw() {
  float x=random(0,255); 
  //margins
  //background(255); //stroke accumulates
  int m=width/100; //size of boxes
  strokeWeight(0.5); //thickness of line
  
  //top left
  stroke(x,0,0); //red stroke
  line(m,random(m,height/2-m/2),width/2-m/2,random(m,height/2-m/2)); 
  
  //top right
  stroke(0,x,0); //green stroke
  line(width/2+m/2,random(m,height/2-m/2),width-m,random(m,height/2-m/2));
  
  //bottom left
  stroke(0,0,x); //blue stroke
  line(m,random(height/2+m/2,height-m),width/2-m/2,random(height/2+m/2,height-m));
  
  //bottom right
  stroke(x,x,0); //yellow stroke
  line(width/2+m/2,random(height/2+m/2,height-m),width-m,random(height/2+m/2,height-m));
   
}
