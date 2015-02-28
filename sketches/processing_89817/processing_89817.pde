
void setup() {
  size(500, 500);
}
/*
void draw(){
 background(0);
 //if my mouse is on the right, circle appears
 if( mouseX> width/2) {
 
 ellipse(width/2, height/2, 50, 50);
 }
 //
 else{
 rect(0,0, 50, 50);
 }
 
 println("moving on..");
 }
 */

void draw() {
  background(0);
  //if my mouse is on the right, circle appears

  fill(245, 233, 190);
  rect(125, 200, width/4, height/4);
  if ((mouseX>125) && (mouseX<240)) {
    fill(23, 76, 79);
    rect(125, 200, width/4, height/4);
  }


    fill(255, 150, 102);
    ellipse(350, 270, width/4, height/4);
  
   if ((mouseX>280) && (mouseX<410)) {
    fill(32, 113, 120);
    ellipse(350, 270, width/4, height/4);
  }


  /*ellipse
   
   
   //
  /*
   else if ((mouseX>width/3 && mouseX<2*width/3)){
   fill(0, 255, 0);
   rect(width/3, 0, width/3, height);}
   else{
   fill(0, 0, 255);
   rect(2*width/3, 0, width/3, height);
   
   }
   */
}



