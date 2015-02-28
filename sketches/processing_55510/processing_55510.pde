
/* Pierre Pothier-Bradley (YSDN) 
*/

//Sketch setup 
 void setup() {
       size(800, 800);
       stroke(#7fff00);
       background(#2f4f4f);
     } 

     void draw() {
       rect(mouseY, mouseX, mouseX, mouseY);
     }
//Mouse behaviours     
     void mouseMoved() {
  rect(mouseX, mouseY, mouseX, mouseY); //draw rectanlge
  if (mouseX > pmouseX) {
    fill(#add8e6);
  }
  else if (mouseX < pmouseX) {
    fill(#00ced1);
  }
  
}
//Sketch clear
  void mouseClicked () {
   background(#2f4f4f);
  }

