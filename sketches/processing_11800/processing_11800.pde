
// Assignment #1
// Name: Emily Dayton
// E-mail: edayton@brynmawr.edu
// Date: 9/7/10 

void setup() {
  size (500, 500);
  smooth (); 
  frameRate (28);
}

void draw () {
  //Draw a blue background for water.
  background (186, 213, 242);
  
 
 //Ripple: a ripple will occur each time the mouse is clicked.
  if(mousePressed) {
    noFill();
    stroke(255);
    strokeWeight (3);
    ellipse (mouseX+200, mouseY-27, 175, 175);
    ellipse (mouseX+200, mouseY-27, 135, 135);
    ellipse (mouseX+200, mouseY-27, 95, 95); 
    ellipse (mouseX+200, mouseY-27, 55, 55);
    ellipse (mouseX+200, mouseY-27, 15, 15);
     } 
  
 noStroke ();  
//LilyPad1
  fill (50, 224, 77);
  ellipse (225, 285, 70, 70);
  fill (255, 162, 254);
  ellipse (245, 285, 40, 10);
  ellipse (225, 305, 10, 40);
  ellipse (225, 270, 10, 40);
  ellipse (205, 285, 40, 10);
  fill (244, 247, 80);
  ellipse(225, 285, 10, 10);
 
//LilyPad2
  fill (50, 224, 77);
  ellipse (320, 120, 70, 70);
  fill (255, 162, 254);
  ellipse (340, 120, 40, 20);
  ellipse (320, 140, 20, 40);
  ellipse (320, 105, 20, 40);
  ellipse (300, 120, 40, 20);
  fill (244, 247, 80);
  ellipse(320, 120, 20, 20);
  
//LilyPad3
  fill (50, 224, 77);
  ellipse (120, 145, 70, 70);
  fill (255, 162, 254);
  ellipse (140, 145, 40, 15);
  ellipse (120, 165, 15, 40);
  ellipse (120, 130, 15, 40);
  ellipse (100, 145, 40, 15);
  fill (244, 247, 80);
  ellipse (120, 145, 15, 15);
  
  
//Butterfly
//A butterfly will follow the mouse.
 
  fill (255, 100, 183, 120);
  ellipse (mouseX-8, mouseY+18, 30, 40);
  ellipse (mouseX-8, mouseY-18, 30, 40);
  fill (63, 59, 232, 90);
  ellipse (mouseX+8, mouseY+18, 30, 40);
  ellipse (mouseX+8, mouseY-18, 30, 40);
   fill (241, 255, 54);
  ellipse (mouseX, mouseY, 65, 8);


  
}


