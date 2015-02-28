
//homework 4.2 Lauren Ruoff copyright 2014 lruoff
//mousePressed changes orientation from squares to triangles
//keypressed changes the white value to blue by increments of 10 until 255 and then back down
//mouseWheel adds white square after mousex >300

float x, y;
float r, g, b;
boolean down;
boolean boolrect;

void setup(){
  
  size (400, 400);
  background(255);
  frameRate(5);
  r = 255; 
  down = true;
  boolrect = true; 
}

void draw() {
  
  x = mouseX;
  y = mouseY;

////top left
   fill(r, 255, 254);
     if(!boolrect){
       triangle(0, 0, x, y, 0, 400);
       }
     else{
       rect(0, 0, x, y);
       }
///top right 
   fill(103, 203, 203);
     if(!boolrect){
       triangle(0, 0, x, y, 400, 0);
     }
     else{
       rect(x, 0, 400, y);
       }

 ///bottom right
     fill(60, 176, 203);
       if(!boolrect){
         triangle(400, 0, x, y, 400, 400);
       }
       else{
         rect(x, y, 400, 400);
       }
///bottom left   
     fill(250, 200, 250);
       if(!boolrect){
         triangle(400, 400, x, y, 0, 400);
       }
       else{
          rect(0, y, x, 400);
       } 
//triangle color change  
  if (keyPressed) {
    keyPressed();
  }
//rectangles instead
  if (mousePressed) {
     mousePressed();
  } 


if (x >300) {
  mouseWheel();
}

}

void keyPressed() { 
    if (r < 0 && down) {
      down = false;
    }  
     if (r > 255 && !down) {
       down = true;
     }
    
    if (down){
      r = r-10;
    }
    else {
      r = r+10;
    }  
}


void mousePressed() {
     boolrect = !boolrect;
} 

void mouseWheel() {
  fill(255);
  rect(50, 50, 100, 100);
}




