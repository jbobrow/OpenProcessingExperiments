
/*=======================================
Crazy Lines - LAB

Modified 2/3/2015

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
  size(500,500);
  strokeWeight(3);
  
}

//appearance
void draw(){
  background(0);
  frameRate(100);
  
  //top left
  stroke (random(1,255),random(1,255),random(1,255));
  float X1=random(100,200); 
  float X2=random(100,200);
  line(100,X1,200,X2);
  
  //top right 
  stroke (random(1,255),random(1,255),random(1,255));
  float X3=random(100,200);
  float X4=random(100,200);
  line(300,X3,400,X4);
  
  //bottom left
  stroke (random(1,255),random(1,255),random(1,255));
  float X5=random(300,400);
  float X6=random(300,400);
  line(100,X5,200,X6);
  
  //bottom right
  stroke (random(1,255),random(1,255),random(1,255));
  float X7=random(300,400);
  float X8=random(300,400);
  line(300,X6,400,X8);
  
  
}
