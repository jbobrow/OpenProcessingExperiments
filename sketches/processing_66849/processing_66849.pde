
void setup() {
  size(500, 500);
  noFill();
  noStroke();
  smooth();
}

void draw() {

  background(255);
  
  //if the mouse is on the left side of the canvas
  if (mouseX < width/2 && mouseY >  height/2) {
    for (int i = 0; i < 10; i++) {
        fill(30*i, i*40, 20,50);
        ellipse(width/2, height/2, i*50, i*50);
    }
  }

  //if the mouse is on the right side of the canvas
  else {
    for (int j = 0; j < 10; j++) {
        fill(80*j, j*20, 20,50);
        ellipse(width/2, height/2, j*50, j*50);
    }
    //if the mouse is on the right side and the top
    if (mouseY<height/2) {
      for (int j = 0; j < 10; j++) {
        fill(80*j, j*20, 20,50);
        ellipse(width/2, height/2, j*50, j*50);
        }
      }
    }
  }





