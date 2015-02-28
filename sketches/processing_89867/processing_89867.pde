
int h1 = 600;
int w1 = 400;
float hLine = 0.1;
float vLine = 399.9;
int edge = 600;

void setup() {
  size(h1, w1);
}

void draw() {
  background(200, 200, 200);
  //Upper Left = Draw red ellipse
  if (mouseX <= width/2 && mouseY <= height/2) {
    fill(255, 0 , 0);
    ellipse(0.25 * width, 0.25 * height, 50, 50);
  }

 //Bottom Left = Draw red ellipse
  else if (mouseX <= width/2 && mouseY >= height/2) {
    fill(0, 0, 255);
    ellipse(0.25 * width, 0.75 * height, 50, 50);
  }

  //Upper Right = Draw green ellipse
  else if (mouseX >= width/2 && mouseY <= height/2) {
    fill(0, 255, 0);
    ellipse(0.75 * width, 0.25 * height, 50, 50);
  }

  //Bottom Right = Draw nothing
  if (keyPressed == true) {
    if (key == 'g') {
      fill(0);
      rect(0.5*width, 0.5*height, 300, 200);
    }
  }
  
  if (mousePressed == true) {
    line (vLine, 0, edge, vLine);
    line (hLine, 0, edge, vLine);
    line (hLine, 0.66*height, edge, vLine);
  }
 
}

