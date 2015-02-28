
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: Moon Ye Lin
// ID: 201420077


void setup(){
size (1024, 768);
smooth();

 }

void draw(){
  background(206,242,121); 
  noStroke(); 
  triangle(0, 0, width, height,0,0); 

  for (int i = 12; i < width-18; i = i + 50) { 
    for (int j = 12; j < height-25; j = j + 50) { 
      stroke(1); 
      strokeWeight(30); 
      noFill(); 
      ellipse(i, j, 50, 50); 
      rectMode(CENTER); 
      rect(i, j, 50, 50); 
    }
   }
 }

void keyPressed(){
background(0);
redraw();
 } 
