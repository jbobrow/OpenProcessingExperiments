
/*
Refrence from Openprocessing
source: http://www.openprocessing.org/visuals/?visualID=7855

rewrite with for-loop.
modified some visual effect and 
added a function to check the mouseX's position.
(on the left or right part of the frame.)
*/

//environment setup
void setup(){ 
  size(500, 500); 
  background(0);
  stroke(255);
  strokeWeight(0.1);
  smooth();
}

void draw(){ 
  if (mousePressed == true){
    for(int i = 0; i <= 450; i=i+100){
      line(250, i, mouseX, i+50); 
      line(mouseX, i+50, 250, i+100);
      /*
      check mouse click position, if the value of the mouseX
      is bigger than 250, means the right part of the frame.
       (frame width = 500)
       Vice versa.
      */
      if(mouseX > 250){
        line(0,i+50,mouseX-250, i+100);
        line(mouseX-250,i,0,i+50);
      }
      else{
        line(500,i+50,mouseX+250, i+100);
        line(mouseX+250,i,500,i+50);
      }
    }
  }
/*
this is a lazy way to get thumbnail for upload.
*/ 
  if (keyPressed == true) { 
   saveFrame("thumbnail.jpg"); 
  } 
 
} 

 
 

