
/**
 * Load and Display 
 * 
 * Images can be loaded and displayed to the screen at their actual size
 * or any other size. 
 */
 
// The next line is needed if running in JavaScript Mode with Processing.js
/* @pjs preload="moonwalk.jpg"; */ 

PImage img;  // Declare variable "a" of type PImage
color c1, c2;
int Y_AXIS = 1;
int X_AXIS = 2;
int counterx = 0;
int concentration = 1000;
int boxsize;

void setup() {
  c1 = color(204, 102, 0);
  c2 = color(0, 102, 153);
  size(640, 320, P3D);
    colorMode(RGB, 1); 
  // The image file must be in the data folder of the current sketch 
  // to load successfully
  img = loadImage("gran.jpg");  // Load the image into the program  
  noStroke();
  // lights();
  boxsize = 10;
}

void draw() {
  
  
  // Displays the image at its actual size at point (0,0)
  image(img, 0, 0);
  // Displays the image at point (0, height/2) at half of its size
  background (0);

  fill(25, 100 ,100);
  stroke(255);

//directionalLight(51, 102, 255, -1, -1, 0);
  pushMatrix();
  translate(width/4, height/2, -100);
  rotateY(PI/3 + counterx/float(height) * PI);
  rotateX(PI/3 + mouseY/float(width/2) * PI);
    
   
   scale(90);
  beginShape(QUADS);

  fill(0, 1, 1); vertex(-1,  1,  1);
  fill(1, 1, 1); vertex( 1,  1,  1);
  fill(1, 0, 1); vertex( 1, -1,  1);
  fill(0, 0, 1); vertex(-1, -1,  1);

  fill(1, 1, 1); vertex( 1,  1,  1);
  fill(1, 1, 0); vertex( 1,  1, -1);
  fill(1, 0, 0); vertex( 1, -1, -1);
  fill(1, 0, 1); vertex( 1, -1,  1);

  fill(1, 1, 0); vertex( 1,  1, -1);
  fill(0, 1, 0); vertex(-1,  1, -1);
  fill(0, 0, 0); vertex(-1, -1, -1);
  fill(1, 0, 0); vertex( 1, -1, -1);

  fill(0, 1, 0); vertex(-1,  1, -1);
  fill(0, 1, 1); vertex(-1,  1,  1);
  fill(0, 0, 1); vertex(-1, -1,  1);
  fill(0, 0, 0); vertex(-1, -1, -1);

  fill(0, 1, 0); vertex(-1,  1, -1);
  fill(1, 1, 0); vertex( 1,  1, -1);
  fill(1, 1, 1); vertex( 1,  1,  1);
  fill(0, 1, 1); vertex(-1,  1,  1);

  fill(0, 0, 0); vertex(-1, -1, -1);
  fill(1, 0, 0); vertex( 1, -1, -1);
  fill(1, 0, 1); vertex( 1, -1,  1);
  fill(0, 0, 1); vertex(-1, -1,  1);

  endShape();
  
 // box(200);
  //image(img, -160,-160);
  popMatrix();
//  c2 = color(mouseX, mouseY, mouseY);
//  setGradient(0, 0, 320, 320, c2, c1, X_AXIS);
  noStroke(); 
  rectMode(CENTER);
   for (int i = 0; i < 320; i += boxsize) {
    for (int j = 0; j < 320; j += boxsize) {
      color c = get(i,j);
      float value = brightness(c);  // Sets 'value' to 255
      fill(c);
      float sizeb = boxsize* value;
      rect (i + 320, j, sizeb, sizeb);
    }
  }
  counterx += 1;
  if (counterx >= 640){
   counterx = 0; 
  }
  fill (0,0,100);
  //rect (0,0, 320, 320, 0);

}


//void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) {
//
//  noFill();
//
//  if (axis == Y_AXIS) {  // Top to bottom gradient
//    for (int i = y; i <= y+h; i++) {
//      float inter = map(i, y, y+h, 0, 1);
//      color c = lerpColor(c1, c2, inter);
//      stroke(c);
//      line(x, i, x+w, i);
//    }
//  }  
//  else if (axis == X_AXIS) {  // Left to right gradient
//    for (int i = x; i <= x+w; i++) {
//      float inter = map(i, x, x+w, 0, 1);
//      color c = lerpColor(c1, c2, inter);
//      stroke(c);
//      line(i, y, i, y+h);
//    }
//  }
//}


void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      boxsize *=2;
        println(boxsize);
    } else if (keyCode == DOWN) {
      boxsize /=2;
    } 
  } 
}


