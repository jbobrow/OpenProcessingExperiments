
void setup (){
  size (400,400);
  background (255);
  smooth ();
}
 
// Click within the image to change
// the value of the rectangle
 
int value = 0;
 
void draw() {
  fill(value);
   
}
 
void mouseDragged() {
  if(value == 0) {
    value = 0;
    ellipse(mouseX, mouseY, 5, 5);
  
   
      }
}

                
