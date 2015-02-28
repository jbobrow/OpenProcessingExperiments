
//* Pierre Pothier-Bradley YSDN
//*   Inspired by "Test"  http://www.openprocessing.org/sketch/54532

//Sketch setup
void setup(){
size (600,600);
 
}
//Draw circle when mouse is pressed 
void draw(){
  if (mousePressed) {
  background(255);
  ellipse (mouseX, mouseY, mouseX, mouseY);
  stroke (#F87431); 
  smooth();
} 
   triangle(mouseX, mouseY, 300, 300, mouseX, mouseY);

}
//Mouse behaviour  
void mouseReleased() {
   ellipse (mouseX,mouseY, mouseX, mouseY);
}


