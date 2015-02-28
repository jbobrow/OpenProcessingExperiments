
//Anastasia Korneeva Project 2D
//pdf function using single frame with screen display
import processing.pdf.*;
//sets the base
void setup(){
//sets window size of the screen
size(640, 480);
//sets smooth edges on the shape
smooth();
//set-up background will be set to white
background(255);
//rate of the speed the circles are duplicating at is at 50.
frameRate (50);
 
//starts at the center of the screen
mouseX=width/2; mouseY=height/2;
//pdf begins recording
 beginRecord(PDF, "project2D.pdf"); 
}

// start of creating the animation  
void draw(){
//random r for the radius
 float r = random(200);
//a colour and the opacity will change when pressed on key 
  if(keyPressed) {
   //red
    if (key == 'q') {
      fill(#FF5858,30);
    }
   //aqua
    if (key == 'w') {
      fill(#34FFD4,30);
    }
   //yellow
     if (key == 'e') {
      fill(#FFF93B,30);
    }
    //purple
     if (key == 'r') {
      fill(#7916DE,30);      
    }
//white default colour for the ellipse with opacity  
  } else {
    fill(#FAFAFA,50);
  }
 
//function that draws the circles with the mouse 
  ellipse (mouseX, mouseY, r, r);
 
//when pressed, this function is used to clear the drawing board and changes to a darker gradient (white, grey, dark grey, black)

   if(mousePressed){
   background(random(255));
   }
}

 


