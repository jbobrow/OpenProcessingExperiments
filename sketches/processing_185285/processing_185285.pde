
/*=======================================
"The Eye"
For-Doodle/Lab
  
Modified 2/10/2015
    
Sarah Hockman
hockman.25@osu.edu
hockman.25@gmail.com
    
Created for Art 3001 - Data Visualization
BFA in Art and Technology
The Ohio State University
http://www.openprocessing.org/classroom/4626
    
=======================================*/


float r=0;
float s=10;

void setup() {
  size(400,400);
  background(0);
  smooth();
  strokeWeight(.75); //thickness of line
  
}

void draw () {
  translate(200,200);
   rotate(r);
  
    stroke(random (255), random (255), random (255)); 
     fill(0,30);
     rect(50,10,50,10);
       stroke(255);
       fill(0,10); 
       rect(10,100,50,40);
  r++;
      
  }


