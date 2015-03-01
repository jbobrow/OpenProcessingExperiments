
/*=======================================
For-Doodle/Lab
 
Modified 2/5/2015
   
Sarah Hockman
hockman.25@osu.edu
hockman.25@gmail.com
   
Created for Art 3001 - Data Visualization
BFA in Art and Technology
The Ohio State University
http://www.openprocessing.org/classroom/4626
   
=======================================*/

void setup() {
  size(550, 550);
  background(255);
}
 
//grid 
 
void draw() {
  
  for (int x = 10; x < 550; x = x + 20) { 
    for (int y = 10; y < 550; y = y + 20) { 
      fill(0);
      rect(x, y, 10, 10); 
       
    }
  }
}

