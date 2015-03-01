
/*=======================================
Sarah Hockman. 
Crazy Lines - Vertical
Homework 2
ART 3001
 
Modified 2/3/2015
 
hockman.25@osu.edu
hockman.25@gmail.com
 
=======================================*/

//setup animation
void setup() {
  size(500,500);
  frameRate(100);
  strokeWeight(4);
}

//appearance
void draw(){
  background(0);
  stroke (random(100,255),random(100,255),random(100,255));
  line ( 0, (random(100,500)), 500, (random(100,500)) );
}
