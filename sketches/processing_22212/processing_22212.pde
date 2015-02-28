
/* Project 4: Fluid Form(er) for DMA 28 Winter 11 by Faustine Chia 

Mini M's
M&M Logo 

Move MOUSE toward "m" for iconic m&m :)
> change color of "m"
> uncover the "m"

 */

PImage mmG, mmR, m;
color c;
float offset;

void setup() {

  size(640, 480);
  background (255);
  noStroke();
  frameRate(120);
}


void draw() {
  mm();
}

void mm() {

  mmG = loadImage("m&m_test_green.png");
  mmR = loadImage("m&m_red.png");
  m = loadImage("m&m_test_letter.png");

  // angle
  float a = random(0, TWO_PI);
  // radius
  float r = random (0, 200); 
  // center coord
  int cX = width/2;
  int cY = height/2;

  float d = dist(cX, cY, mouseX, mouseY);

  // circle equation
  float x = cos(a)*r+cX;
  float y = sin(a)*r+cY;

  ellipseMode(CENTER);
//  fill(255,0,0);
//  ellipse(cX, cY, 400,400);
  float radius = 200;

  // eyedropper
  color c = get (int(x), int(y)); 

 // plot m&m's
  if (c == color(255)) {
  noTint();
//  float s = random(0.1, 0.8);
//  scale(s);
  image(mmG, x, y);
  //image(mmR, x, y);
  
   }
    
  
  // Mouse: in circle-> M on top; out circle-> M covered
  if (d < radius) {
   imageMode(CENTER);
   tint(57, 181, 103); // green 
   image(m, cX, cY);
   
   float myTint = map(d, 0, 200, 255, 0);
   tint(255, myTint); // changing green (transparency)
   image(m, cX, cY);
  }
   
   
// M always on top   
//   imageMode(CENTER);
//   tint(57, 181, 103); // green 
//   image(m, cX, cY);
//   
//   float myTint = map(d, 0, 200, 255, 0);
//   tint(255, myTint); // changing green (transparency)
//   image(m, cX, cY);
  
}


