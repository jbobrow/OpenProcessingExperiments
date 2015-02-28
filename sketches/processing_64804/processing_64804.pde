
/*
ACCD Summer 2012
ID02
Midterm Progress4 
Charlene Chen
06/29/2012
*/


PImage H;
PImage H2;
PImage june4;
PImage june5;

int xpos;
int ypos = height/2;
float dotSize = 9;
float angleOffsetA;
float angleOffsetB;

void setup() {
  size(500, 500); 
  noStroke();
  fill(0);
  smooth();
  //noLoop();
  //frameRate(1);  // Redraw the tree once a second
  
  xpos = 0;
  
  angleOffsetA = radians(1.5); // Convert 1.5 degrees to radians
  angleOffsetB = radians(30);  // Convert 50 degrees to radians
  
  H = loadImage("H.png");
  H2 = loadImage("H2.png");
  june4 = loadImage("june4.png");
  june5 = loadImage("june5.png");
}

void draw() {
background(255);                     // White background
  
//  int jx = int(random(june4.width));
//  int jy = int(random(june4.height));
//  
//  color juneColor = june4.get(jx, jy);
//  background(juneColor);
    
//    xpos = xpos + 1;
//    point (xpos, ypos);
//    
//    if(xpos >= width) {
//     xpos = 0; 
//    }
//    
//    color juneColor = june5.get(xpos, ypos);
//    background(juneColor);

    //colorMode(HSB, 100);
//    for (int jx = 0; jx < width; jx++) {
//      for (int jy = 0; jy < height; jy++) {
//        color juneColor = june5.get(xpos, ypos);
//        stroke(juneColor);
//        point(jx, jy);
//    }
//  }
  
  
//  pushMatrix();
//  
//  translate(width/2, height);          // Move to the center, bottom of the screen
//  seed1(dotSize, radians(270), 0, 0);  // Start the tree
//  
//  popMatrix();
//  
//  
//  pushMatrix();
//  
//  translate(width, height/2);          // Move to the center, bottom of the screen
//  seed1(dotSize, radians(200), 0, 0);  // Start the tree
//  
//  popMatrix();
//  
//  
//  pushMatrix();
//  
//  translate(0, height/2);          // Move to the center, bottom of the screen
//  seed2(dotSize, radians(45), 0, 0);  // Start the tree
//  
//  popMatrix();
//  
//  
//  pushMatrix();
//  
//  translate(width/2, 0);          // Move to the center, bottom of the screen
//  seed2(dotSize, radians(90), 0, 0);  // Start the tree
//  
//  popMatrix();
    
    xpos = xpos + 1;
    point (xpos, ypos);
    
    if(xpos >= width) {
     xpos = 0; 
    }
    
    color juneColor = june5.get(xpos, ypos);

  for (int i = 0; i <= width; i = i +20) {
    float angle = random(180, 360);
    
    fill(juneColor, 50);
    noStroke();
    //fill(255, 200);
    //fill(178, 54, 126);
    seed1(dotSize, radians(angle), i, height);
  }
  
  for (int j = 0; j <= width; j = j +20) {
    float angle = random(180);
    
    fill(juneColor, 100);
    noStroke();
    //fill(255, 100);
    //fill(138, 109, 181);
    seed2(dotSize, radians(angle), j, 0);
  }
  
  tint(juneColor);
  //tint(255, 255);
  //image(H, 0, 0);
  image(H2, 0, 0);
  
}

void seed1(float dotSize, float angle, float x, float y) {
  
  if (dotSize > 1.0) {
    
    // Create a random numbers between 0 and 1
    float r = random(0, 1.0);  
    
    // 98% chance this will happen
    if (r > 0.02) {  
      ellipse(x, y, dotSize, dotSize);
      float newx = x + cos(angle) * dotSize;
      float newy = y + sin(angle) * dotSize;
      seed1(dotSize * 0.99, angle - angleOffsetA, newx, newy);   
    }
    // 02% chance this will happen
    else {  
      ellipse(x, y, dotSize, dotSize);
      float newx = x + cos(angle);
      float newy = y + sin(angle);
      seed2(dotSize * 0.99, angle + angleOffsetA, newx, newy);
      seed1(dotSize * 0.60, angle + angleOffsetB, newx, newy);
      seed2(dotSize * 0.50, angle - angleOffsetB, newx, newy);
    } 
  }
}


void seed2(float dotSize, float angle, float x, float y) {
  
  if (dotSize > 1.0) {
    
    // Create a random numbers between 0 and 1
    float r = random(0, 1.0);
    
    // 95% chance this will happen
    if (r > 0.05) {
      ellipse(x, y, dotSize, dotSize);
      float newx = x + cos(angle) * dotSize;
      float newy = y + sin(angle) * dotSize;
      seed2(dotSize * 0.99, angle + angleOffsetA, newx, newy);
    } 
    // 05% chance this will happen
    else {
      ellipse(x, y, dotSize, dotSize);
      float newx = x + cos(angle);
      float newy = y + sin(angle);
      seed1(dotSize * 0.99, angle + angleOffsetA, newx, newy);  
      seed2(dotSize * 0.60, angle + angleOffsetB, newx, newy);
      seed1(dotSize * 0.50, angle - angleOffsetB, newx, newy);
    }
  }
}

void mousePressed() {
 redraw(); 
}

