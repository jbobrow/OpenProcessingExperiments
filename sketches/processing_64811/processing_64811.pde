
/*
ACCD Summer 2012
ID02
Midterm Progress6
Charlene Chen
06/29/2012
*/


PImage H;
PImage H2;
PImage june4;
PImage june5;

int xpos;
int ypos;
int frame = 0;
int moveX, moveY;

float dotSize;
float angleOffsetA;
float angleOffsetB;
float angle;

void setup() {
  size(500, 500); 
  noStroke();
  smooth();
  background(255);
  //noLoop();
  //frameRate(1);  // Redraw the tree once a second
  
  angleOffsetA = radians(1.5); // Convert 1.5 degrees to radians
  angleOffsetB = radians(30);  // Convert 50 degrees to radians
  
  H = loadImage("H.png");
  H2 = loadImage("H2.png");
  june4 = loadImage("june4.png");
  june5 = loadImage("june5.png");
  
  imageMode(CENTER);
 
//  int xpos = 0;
//  int ypos = height/2;
}

void draw() {
   //background(255);                     // White background
    
   //int xpos = 0;
   //int ypos = height/2; 
  
    //xpos = xpos + 1;
    //point (xpos, ypos);
    
//    if(xpos >= width) {
//     xpos = 0; 
//    }
    
    color juneColor = june5.get(mouseX, mouseY);
    background(juneColor);

  for (int i = 0; i <= width; i = i +20) {
    angle = map(mouseX, 0, width, 180, 360);
    dotSize = map(mouseX, 0, width, 5, 9);
    
    //fill(juneColor);
    noStroke();
    fill(255, 200);
    //fill(178, 54, 126);
    seed1(dotSize, radians(angle), i, height);
  }
  
  for (int j = 0; j <= width; j = j +20) {
    //float angle = random(180);
    angle = map(mouseY, 0, height, 90, 180);
    dotSize = map(mouseX, 0, width, 9, 15);
    
    //fill(juneColor, 100);
    noStroke();
    fill(255, 100);
    //fill(138, 109, 181);
    seed2(dotSize, radians(mouseY), j, 0);
  }
  
  //tint(juneColor);
  tint(255, 255);
  //image(H, 0, 0);
  //scale(1.4);
  image(H2, width/2, height/2);
  
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

//void mousePressed() {
//    color juneColor = june5.get(xpos, ypos);
//    
//    dotSize = map(mouseX, 0, width, 1, 5);
//    
//    float angle = random(180, 360);
//    fill(juneColor, 50);
//    noStroke();
//    //fill(255, 200);
//    //fill(178, 54, 126);
//    seed1(dotSize, radians(angle), mouseX, mouseY);
//}

