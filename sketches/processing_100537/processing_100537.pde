
// The following code creates my very first Processing-born creature, Miss littleAngel.
// In this code, the halo above Miss littleAngel's head will wobble. 


void setup() {
  // Framerate for the wobbling halo.
  frameRate(22);
  
  // Set up the canvas where Miss littleAngel will land.
  int width = 600;
  int height = 800;
  size(600, 800);
  background(240, 211, 224);
  smooth();
  
  // Miss littleAngel's circular face outline. 
  stroke(100, 100, 100);
  strokeWeight(3.5);
  noFill();
  ellipse(width / 2, height / 2.4, 350, 350);
  
  // The sleepy left eye of Miss littleAngel. 
  line(width / 3, height / 7 * 2.6, width / 2 * 0.9, height / 7 * 2.6);
  
  // The sleepy right eye of Miss liettleAngel. 
  line(width / 2 * 1.15, height / 7 * 2.4, width / 2 * 1.25, height / 7 * 2.8);
  line(width / 2 * 1.25, height / 7 * 2.8, width / 2 * 1.37, height / 7 * 2.4);
  
  // The little red-cherry mouth of Miss littleAngel. 
  stroke(255, 0, 0);
  strokeWeight(5);
  point(width / 2, height / 2 * 1.05);
  
  // Initialize the width and height of Miss littleAngel's arms.
  int arm_width = 120;
  int arm_height = 30;
  
  // The left arm of Miss littleAngel.
  stroke(100, 100, 100);
  strokeWeight(3.5);
  noFill();
  rect(width / 6 * 0.85, height / 2.4 + 235, arm_width, arm_height);
  
  // The right arm of Miss littleAngel.
  // Note: we use "pushMatrix() - translate() - rotate(radians()) - popMatrix()" method 
  //for drawing this rectangle as we want to turn the right arm "up".
  pushMatrix();
  translate(width / 3 * 1.85, height / 2.4 + 240);
  rotate(radians(325));
  rect(0, 0, arm_width, arm_height);
  popMatrix(); 
  
  // The triangle body of Miss littleAngel.
  fill(240, 211, 224);
  stroke(100, 100, 100);
  strokeWeight(3.5);
  triangle(width / 2, height / 2.4 + 176, width / 5 * 0.9, height / 7 * 6, width / 5 * 4.1, height / 7 * 6); 
  
  // The signature of Miss littleAngel.
  fill(207, 118, 255);
  // Use the class PFont to pick a specific font. 
  PFont font; 
  font = loadFont("NanumBrush-48.vlw");
  textFont(font, 28);
  text("Miss littleAngel", width / 3 * 2, height / 7 * 6.6);
}

int dir = 1;
int i = dir;

void draw() {
  fill(240, 211, 224);
  noStroke();
  rect(0, 0, width, 150);
  
  stroke(255, 234, 0);
  fill(255);
  strokeWeight(5);
  
  pushMatrix();
  translate(width / 2, height / 7);
  rotate(radians(180 - i));
  ellipse(0, 0, 200, 45);
  popMatrix();
  i += dir; 
  
  if (5 == i) {
    dir = -1;
  } else if (-5 == i) {
    dir = 1;
  }  
}












