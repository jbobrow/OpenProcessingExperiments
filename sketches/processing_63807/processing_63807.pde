
void setup() {
  size(400, 400); //size of screen is 400 by 400
  smooth(); //better graphics
}
void draw() {
  background(255); //background is black
  
  line(0, 200, 400, 200); //line from left to right
  
  line(200, 0, 200, 400); //line from up to down
  
  if (mouseX > width-width && mouseX < width-200 && mouseY > height-height && mouseY < height-200) {//if mouse is in upper left rect
    fill(0);
    rect(0, 0, 200, 200); //upper left rect
  }
    
  if (mouseX > width-200 && mouseX < width && mouseY > height-height && mouseY < height-200) {//if mouse is in upper right rect
    fill(0);
    rect(200, 0, 200, 200); //upper right rect
  }
  if (mouseX > width-width && mouseX < width-200 && mouseY > height-200 && mouseY < height) {//if mouse is in down left rect
    fill(0);
    rect(0, 200, 200, 200); //down left rect
  }
  if (mouseX > width-200 && mouseX < width && mouseY > height-200 && mouseY < height) {//if mouse is in down right rect
    fill(0);
    rect(200, 200, 200, 200); //down right rect
  }
}
