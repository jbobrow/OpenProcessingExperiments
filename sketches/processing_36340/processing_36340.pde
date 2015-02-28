
void setup() {
  size(300, 300);
  background(0);
}
int x=0;
void draw() {
  //creates continuous colorful blue shade in bottom half of screen 
  //when mouse is in upper half
  if (150<mouseY) {           
    stroke(255, mouseY, mouseX/2);
    line(x, 0, x, height/2);
    x++;
  }
  //creates continuous colorful red shade in top half of screen 
  //when mouse is in lower half
  if (mouseY<150) {
    stroke(mouseX/2, mouseY, 255);
    line(x, 150, x, height);
    x++;
  }
  //loops lines continuously and clears background
  if (x > width) {
    x = 0;
    background(0);
  }
}


