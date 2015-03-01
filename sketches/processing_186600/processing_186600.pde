
void setup() {
  size (400,400);} 

void draw() {
  background (12,149,237);
// This is the color I chose for the initial background.

  if (mousePressed)
    background (102,227,41);
// This means that if the mouse is pressed the background will change colors.    
} 
void mouseDragged() {
  background (245,12,40);
// This is another way to make the background change colors - by dragging the mouse.  
}
