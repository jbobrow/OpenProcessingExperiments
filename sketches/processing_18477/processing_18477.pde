
// Homework #1 -
// setup
void setup() {
  size(520, 620);
  background(20);
  smooth();
}

//image
void draw() {
  //helpful tip that I saw in Chen's code later on. Thanks!
  println("X: " + mouseX);
  println("Y: " + mouseY);
  
  // white rectangle
  fill(250);
  noStroke();
  rect(0, 479, 520, 55);
  // gold triangle
  fill(223, 183, 79);
  noStroke();
  triangle(250, 350, 170, 479, 337, 479);
  
  // blue triangle 1
  fill(57, 125, 172);
  noStroke();
  triangle(250, 350, 52, 0, 0, 0);
  // blue triangle 2
  fill(80, 237, 228);
  noStroke();
  triangle(250, 350, 104, 0, 52, 0);
  // blue triangle 3
  fill(211, 255, 239);
  noStroke();
  triangle(250, 350, 156, 0, 104, 0);
  // blue triangle 4
  fill(80, 237, 228);
  noStroke();
  triangle(250, 350, 208, 0, 156, 0);
  // blue triangle 5
  fill(57, 125, 172);
  noStroke();
  triangle(250, 350, 260, 0, 208, 0);
  
  // red triangle 5
  fill(149, 0, 0);
  noStroke();
  triangle(250, 350, 312, 0, 260, 0);
  // red triangle 4
  fill(180, 4, 4);
  noStroke();
  triangle(250, 350, 364, 0, 312, 0);
  // red triangle 3
  fill(219, 22, 22);
  noStroke();
  triangle(250, 350, 416, 0, 364, 0);
  // red triangle 2
  fill(180, 4, 4);
  noStroke();
  triangle(250, 350, 468, 0, 416, 0);
  // red triangle 1
  fill(149, 0, 0);
  noStroke();
  triangle(250, 350, 520, 0, 468, 0);

  // far left triangle (bottom)
  fill(219, 22, 22);
  noStroke();
  triangle(139, 577, 0, 534, 0, 620);
  // center gold quad (bottom)
  fill(223, 183, 79);
  noStroke();
  quad(250, 534, 139, 577, 250, 620, 375, 577); 
  // far right triangle (bottom)
  fill(211, 255, 239);
  noStroke();
  triangle(375, 577, 520, 537, 520, 620);
  // red 1 triangle (bottom)
  fill(180, 4, 4);
  noStroke();
  triangle(0, 534, 139, 577, 250, 534);
  // red 2 triangle (bottom)
  fill(149, 0, 0);
  noStroke();
  triangle(0, 620, 139, 577, 250, 620);
  // blue 1 triangle (bottom)
  fill(80, 237, 228);
  noStroke();
  triangle(250, 534, 375, 577, 528, 534);
  // blue 2 triangle (bottom)
  fill(57, 125, 172);
  noStroke();
  triangle(250, 620, 375, 577, 520, 620);
}


