
/*=======================================
Simple Interactive Box LAB

Modified 2/5/2015
  
Sarah Hockman
hockman.25@osu.edu
hockman.25@gmail.com
  
Created for Art 3001 - Data Visualization
BFA in Art and Technology
The Ohio State University
http://www.openprocessing.org/classroom/4626
  
=======================================*/

//setup interaction
void setup() {
  size(500,500); 
  background(150);} //gray 

//initiate    
  void draw() {
    int x = 255; 
    noStroke();
    fill(x,0,0); //fill red
    rectMode(CENTER);
    rect(250,250,200,200);
     
    if(mouseX>150 && mouseX<350 && mouseY>150 && mouseY<350)
    {fill(0,x,0); rect(250,250,200,200);} //mouseover fill green
     
     
  }
    
