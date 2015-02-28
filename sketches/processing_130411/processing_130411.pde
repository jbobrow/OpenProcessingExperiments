
//homewor 4.1 Lauren Ruoff copyright 2014 lruoff

float x, y;
float r, g, b;
boolean down;
boolean boolrect;

void setup(){
  
  size (400, 400);
  background(255);
  frameRate(10);
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
  if (keyPressed == true) {
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

//rectangles instead
  if (mousePressed) {
     boolrect = !boolrect;
  } 

}



