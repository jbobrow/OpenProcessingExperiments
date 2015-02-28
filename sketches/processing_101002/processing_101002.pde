
// The following code creates my very first Processing-born creature, Miss littleAngel.
// In this code, the halo above Miss littleAngel's head will wobble. Also, Miss littleAngel will move around the 
// canvas. As well, the background color will fade in and out. 

float miss_x;
float miss_y; 

float miss_x_speed = -1;
float miss_y_speed = -2;

float halo_w = 200;
float halo_h = 45;

float mouth_r;
float mouth_g;
float mouth_b;

float c1 = 30;
float c2 = 155;

float c1_dir = 0.5;
float c2_dir = -0.5;

void setup() {
  // Framerate for the wobbling halo.
  frameRate(80);
  
  // Set up the canvas where Miss littleAngel will land.
  size(600, 800);
  
  // Set up the starting position of Miss littleAngel: she will start in  the middle and below the screen.
  miss_x = width / 2; 
  miss_y = height + 100;
  
  smooth();
}

int dir = 1;
int i = dir;

void draw() {
  //background(240, 211, 224);
  background(c1, c2, 60);
  
  // The wobbling halo above Miss littleAngel's head.
  stroke(255, 234, 0);
  fill(255);
  strokeWeight(5);
  
  pushMatrix();
  translate(miss_x, miss_y);
  rotate(radians(180 - i));
  ellipse(0, 0, halo_w, halo_h);
  popMatrix();
  i += dir; 
  
  if (5 == i) {
    dir = -1;
  } else if (-5 == i) {
    dir = 1;
  }

  // Miss littleAngel's circular face outline. 
  stroke(100, 100, 100);
  strokeWeight(3.5);
  noFill();
  //float move = random(5, 50);
  ellipse(miss_x - 30, miss_y + 250, 350, 350);
  
  // The sleepy left eye of Miss littleAngel. 
  line(miss_x - 90, miss_y + 250 - 10, miss_x - 30, miss_y + 250 - 10);
  
  // The sleepy right eye of Miss liettleAngel. 
  line(miss_x + 30, miss_y + 250 - 10 - 30, miss_x + 55, miss_y + 250 + 10);
  line(miss_x + 55, miss_y + 250 + 10, miss_x + 30 + 55, miss_y + 250 - 10 - 30);
  
  // The little red-cherry mouth of Miss littleAngel. 
  mouth_r = random(255);
  mouth_g = random(255);
  mouth_b = random(255); 
  stroke(mouth_r, mouth_g, mouth_b);
  strokeWeight(8);
  point(miss_x, miss_y + 250 + 90);
  
  
  // Initialize the width and height of Miss littleAngel's arms.
  int arm_width = 120;
  int arm_height = 30;
  
  rectMode(CENTER);
  
  // The left arm of Miss littleAngel.
  stroke(100, 100, 100);
  strokeWeight(3.5);
  noFill();
  rect(miss_x - 90 - 45, miss_y + 250 + 260, arm_width, arm_height);
  
  // The right arm of Miss littleAngel.
  // Note: we use "pushMatrix() - translate() - rotate(radians()) - popMatrix()" method 
  //for drawing this rectangle as we want to turn the right arm "up".
  pushMatrix();
  translate(miss_x + 30 + 55 + 30, miss_y + 250 + 250);
  rotate(radians(325));
  rect(0, 0, arm_width, arm_height);
  popMatrix(); 
  
  // The triangle body of Miss littleAngel.
  fill(c1, c2, 60);
  stroke(100, 100, 100);
  strokeWeight(3.5);
  triangle(miss_x, miss_y + 250 + 176, miss_x - 90 - 45 - 60, miss_y + 250 + 280 + 60, miss_x + 30 + 55 + 30 + 80, miss_y + 250 + 280 + 60); 
  
  // The signature of Miss littleAngel.
  fill(250);
  // Use the class PFont to pick a specific font. 
  PFont font; 
  font = loadFont("NanumBrush-48.vlw");
  textFont(font, 20);
  text("Miss littleAngel (妈妈的小天使)", width / 3 * 1.5, height / 7 * 6.4);
  
  c1 += c1_dir;
  c2 += c2_dir;
  
  // Reverse direction of color change.
  if (c1 < 0 || c1 > 205) {
    c1_dir *= -1;
  }
  
  if (c2 < 0 || c2 > 205) {
    c2_dir *= -1;
  }
  
  
  // Miss littleAngel moves around the canvas.
  miss_x = miss_x - miss_x_speed;
  miss_y = miss_y - miss_y_speed;
  
  // Change the direction of miss_x_speed if the halo touches the two sides of the width of the canvas.
  if(miss_x + halo_w / 2 >= width && miss_x_speed < 0) {
    miss_x_speed = -1 * miss_x_speed;
  } else if (miss_x - halo_w / 2 <= 0 && miss_x_speed >0) {
    miss_x_speed = -1 * miss_x_speed;
  }
  
  // Change the direction of miss_y_speed if the halo touches the two sides of the width of the canvas.
  if(miss_y + halo_h >= height && miss_y_speed < 0) {
    miss_y_speed = -1 * miss_y_speed;
  } else if (miss_y - halo_h / 2 <= 0 && miss_y_speed > 0) {
    miss_y_speed = -1 * miss_y_speed;
  }
  
  miss_x_speed = constrain(miss_x_speed, -1, 1);
  miss_y_speed = constrain(miss_y_speed, -2, 2);
}









