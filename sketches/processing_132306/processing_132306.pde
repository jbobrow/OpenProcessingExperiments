
/* @pjs preload="bg.jpg"; 
 */

PImage img;
int edgeFill = 242;
int coreFill = 212;
int init = 1;
int x1 = 147, y1 = 200;
int xOffset = 0; 
int yOffset = 0; 

void setup() {
  size(400, 400);
  img = loadImage("bg.jpg");
  tint(100, 150);
  image(img, 0, 0);
  //wings
  noStroke();
  fill(edgeFill);
  triangle(40, 350, 183, 230, 147, 200);
  triangle(359, 350, 216, 230, 252, 200);
  //stabilizer
  noStroke();
  fill(100, 149, 237); 
  triangle(153, 200, 193, 200, 173, 350);
  triangle(206, 200, 246, 200, 226, 350);
  //core
  fill(coreFill, 200);
  noStroke();
  triangle(170, 150, 228, 150, 199, 250);
  //forward
  stroke(0, 0, 0);
  fill(edgeFill);
  triangle(147, 200, 197, 150, 197, 5);
  triangle(251, 200, 201, 150, 201, 5);
}

void draw() {
  background(img);
  int x2 = x1+50, y2 = y1-50, x3 = x1+50, y3 = y1-195; 

  if ((mousePressed && (mouseButton == RIGHT)) || keyPressed && (key == 'c' || key == 'C')) {
    int newColor = int(random(252));
    edgeFill = newColor;
    coreFill = newColor;
  }

  //wings
  noStroke();
  fill(edgeFill);
  triangle(40, 350, 183, 230, 147, 200);
  triangle(359, 350, 216, 230, 252, 200);

  //stabilizer
  noStroke();
  fill(100, 149, 237); 
  triangle(153, 200, 193, 200, 173, 350);
  triangle(206, 200, 246, 200, 226, 350);

  //core
  fill(coreFill, 200);
  noStroke();
  triangle(x1+23, y1-50, x2+31, y2, x3+2, y3+245);
  //forward
  stroke(0, 0, 0);
  fill(edgeFill);
  triangle(x1, y1, x2, y2, x3, y3);
  triangle(x1+104, y1, x2+4, y2, x2+4, y3);
}

void mousePressed() {
  xOffset = mouseX-x1; 
  yOffset = mouseY-y1;
}

void mouseDragged() {
  x1 = mouseX-xOffset; 
  y1 = mouseY-yOffset;
}

void keyPressed() {
  if (keyCode == 37) { //left
    x1 = x1 - 5;
  }
  if (keyCode == 38) { //up
    y1 = y1 - 5;
  }
  if (keyCode == 39) { //right
    x1 = x1 + 5;
  }
  if (keyCode == 40) { //down
    y1 = y1 + 5;
  }
}



