
//Interactive Display
//Created By Stephen Wang
//ARCH1391 Digital Computation Studio-Module 2

//Try use left and right mouse clicks and mouse drag to draw lines 

//Code  References:
//Modified based on Riley Galloway's Laser Draw
//Credit to Riley Galloway
//http://www.openprocessing.org/visuals/?visualID=1915

float[][] a=new float[40][2]; //Code based on Riley Galloway's Laser Draw


void setup() { 
  size(400,400); 
  smooth(); 
  background(random(0,255),random(0,255),random(0,255),30); 
  strokeWeight(3);
} 
 
void draw() {   
  lines(mouseX, mouseY, pmouseX, pmouseY); 
} 

//draw lines when left mouse button pressed  
void lines(int x, int y, int px, int py) { //Code based on Riley Galloway's Laser Draw
  if (mousePressed && (mouseButton == LEFT) ) { //all if statement Code made by Stephen Wang
    stroke(random(0,255),random(0,255),random(0,255),20); 
    line(0,y,x,y);  //Modified based on Riley Galloway's Laser Draw
    line(x,0,x,y);
  }
  else if(mousePressed && (mouseButton == LEFT)) { 
    stroke(random(0,255),random(0,255),random(0,255),20); 
    line(0,y,x,y); //Modified based on Riley Galloway's Laser Draw
    line(0,0,x,y);
  }
  //draw lines when right mouse button pressed 
   else if (mousePressed && (mouseButton == RIGHT)) {
   stroke(random(0,255),random(0,255),random(0,255),20); 
    line(0,y-1,x,y);  //Modified based on Riley Galloway's Laser Draw
    line(0,0,x-1,y-2);
    line(x,y-1,x+1,y); 
    line(0,y,x-1,y-2);
  } 
  //draw lines when mouse moved
   else {
    stroke(random(0,255),random(0,255),random(0,255),5); 
    line(0,0,x,y); //Modified based on Riley Galloway's Laser Draw
    line(400,0,x,y);
    line(0,400,x,y);
    line(400,400,x,y);   
  } 
} 
//redraw everything when mouse released
//code made by Stephen Wang
void mouseReleased(){
  background(random(255),random(255),random(255),20); 
} 

