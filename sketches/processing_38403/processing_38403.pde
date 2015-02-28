
//  Tim Blanks
//  Drawing machine project
//  This program is a loop that uses a counter to determine the position of the
//  rectangles in either the x or y axis. It also uses randomness to determine
//  the length, fill & strokeweight of the rectangles.

void setup() {
  size(500,500);
  background(200);
  colorMode(RGB, width);
  rectMode(CENTER);
  frameRate(8);
}


float count = 0; 
float number = 35; //sets the limit of the count
    
void draw() {
  if(mousePressed) {
    count=0;
    background(200);
     }
  if (count < number) { 
    strokeWeight(random(4));
    stroke(100);
    fill(100, random(count/number) * width , 100, random(500));  
    rect(count * width/number, 100, 25, random(500));  // The count determines position along x axis
    fill(0, random(count/number) * width, 100, random(500));
    rect(100, count * width/number, random(500), 25);  //The count determines position along y axis      
 
  }
  
  count++; 
  
}


