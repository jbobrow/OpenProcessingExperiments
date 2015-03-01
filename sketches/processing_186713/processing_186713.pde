
void setup() {
  size (1500,750);}
  
void draw() {
  background (50,175,225);
  //orginal background color
  if (mousePressed)
    background (50,200,75);
  //when mouse is pressed color will change
}
void mouseDragged() {
  background (200,50,70);
  //when the mouse is dragged it changes to this color
}
