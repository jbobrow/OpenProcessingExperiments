
// Example 02-01 from "Getting Started with Processing" 
// by Reas & Fry. O'Reilly / Make 2010

void setup( ) {
  size (480,120) ;
  background(#336633);
  smooth( );
 }
 void draw ( ) {
   if (mousePressed) {
     fill(#00FF66) ;
   } else {
     fill(#FF3300);
   }
   ellipse(mouseX, mouseY, 80, 80) ;
 }
 
  

