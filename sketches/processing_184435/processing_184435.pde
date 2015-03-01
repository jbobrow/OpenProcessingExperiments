
/*------------------------------
"Random Line Boxes - Variable"
Simple programming sketch creating random lines in boxes designated by color.  
The sketch is not static and thus the canvas size can change without affecting 
the result of the sketch. 

Created February 4, 2015
By Megan Cattey
megancattey@gmail.com

Created for Art 3001 - Data Visualization
BFA in Art and Technology
The Ohio State University
http://www.openprocessing.org/classroom/4626
 ------------------------------*/

void setup() {
  size(400, 400);
  smooth();
  background(0);
}

void draw() {
  noStroke(); //removes stroke from box
  fill(0,10); //gives the illusion of the lines fading b/c the background rectangle is not fully opaque
  rect(0,0,width,height); //black rectangle to aid in line of code above
  int m=width/10;


  stroke(#FFDE00);
  strokeWeight(random(1, 5));
  line(m, random(m, height/2-m/2), width/2-m/2, random(m, height/2-m/2)); //upper left

  stroke(#0080FF);
  line(width/2+m/2, random(m,height/2-m/2), width-m, random(m,height/2-m/2)); //upper right

  stroke(#17D72A);
   line(m, random(height/2+m/2,height-m), width/2-m/2, random(height/2+m/2,height-m)); //lower left

  stroke(#D71717);
   line(width/2+m/2, random(height/2+m/2,height-m),width-m,random(height/2+m/2,height-m)); //lower right
}

