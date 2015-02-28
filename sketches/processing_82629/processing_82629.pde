
// homework 12 leyli guliyeva
// copyrights 2012 

// data from http://www.cmu.edu/ira/QuickFacts/index.html
// it displays the number and type of degrees granted during the academic year 2010-2011
//press 'b' to see bachelor's, 'd' for doctoral, 'm' for master's

int [] bDegrees = {212, 350, 282, 0, 179, 168, 103};
int [] mDegrees = {110, 502, 85, 585, 47, 235, 405};
int [] dDegrees = {4, 113, 27, 6, 41, 67, 12};

String [] college = {"CFA", "CIT", "DC", "HC", "MCS", "SCS", "TSB"};

float x, y;
float diam[];
PImage tartan;
color b, m, d;
boolean bTest, mTest, dTest;
PImage img;

void setup () {
  size (800, 600);
  smooth ();
  img = loadImage("plaid.png");
  
  b = color (216, 217, 218);
  m = color (253, 184, 19);
  d = color (0, 135, 82); 

}

void draw () {
  prepScreen ();
  drawMcircles ();
  drawBcircles ();
  drawDcircles ();
  drawLine();
  image (img, 0, 0, 350, 110);
  image (img, 350, 0, 350, 110);
  image (img, 700, 0, 350, 110);
  writeText();
  title();
  numberText();
}

void prepScreen () {
  noStroke();
  background(#990000);
}

void drawBcircles() {
  for (int i=0; i < bDegrees.length; i++){
    float x = i*width/8+width/8.5;
    float y = map (bDegrees[i], min(dDegrees), max(mDegrees), 450, 150);
  println(y);
  noStroke();
  fill (b);
  float diam = 15;
  ellipse(x, y, diam, diam);
  }
}

void drawMcircles() {
  for (int i=0; i < mDegrees.length; i++){
    float x = i*width/8+width/8.5;
    float y = map (mDegrees[i], min(dDegrees), max(mDegrees), 450, 150);
  noStroke();
  fill (m);
  float diam = 15;
  ellipse(x, y, diam, diam);
  }
}

void drawDcircles() {
  for (int i=0; i < dDegrees.length; i++){
    float x = i*width/8+width/8.5;
    float y = map (dDegrees[i], min(dDegrees), max(mDegrees), 450, 150);
  noStroke();
  println(y);
  fill (d);
  float diam = 15;
  ellipse(x, y, diam, diam);
  }
}

void numberText() {
  if (bTest == true) {
  for (int i=0; i < bDegrees.length; i++){
      fill (255);
      float x = i*width/8+width/8.5;
      float y = map ( bDegrees[i], min(dDegrees), max(mDegrees), 450, 150)-22;
      textSize (13);
      text(bDegrees[i], x, y);
      textAlign(CENTER);
      textSize(14);
      text("BACHELOR'S",400, 570); 
    }
  }
    if (mTest == true) {
  for (int i=0; i < mDegrees.length; i++){
      fill (255);
      float x = i*width/8+width/8.5;
      float y = map ( mDegrees[i], min(dDegrees), max(mDegrees), 450, 150)-22;
      textSize (13);
      text(mDegrees[i], x, y);
      textAlign(CENTER);
      textSize(14);
      text("MASTER'S",400, 570);
    }
  }
    if (dTest == true) {
  for (int i=0; i < dDegrees.length; i++){
      fill (255);
      float x = i*width/8+width/8.5;
      float y = map ( dDegrees[i], min(dDegrees), max(mDegrees), 450, 150)-22;
      textSize (13);
      text(dDegrees[i], x, y);
      textAlign(CENTER);
      textSize(14);
      text("DOCTORAL",400, 570);
    }
  }
 
}  
 

void drawLine() {
  stroke (#f3f0e9);
  strokeWeight(1);
  line(70, height-100, width-70, height-100);
}

void writeText() {
  for (int i=0; i < college.length; i++){
  fill (255);
  float x = i*width/8+width/9;
  float y = height-75;
  textSize (13);
  text(college [i], x, y);
  }
}

//void mousePressed() {
//  int index = round (map (mouseX, 95, 695, 0, 6 ));
//  println(index); 
//  
//}

void keyPressed () {
  if (key == 'b'){
    b = color (216, 217, 218);
    m = color (253, 184, 19, 50);
    d = color (0, 135, 82, 50);
    for (int i=0; i < bDegrees.length; i++){
      fill (255);
      float x = i*width/8+width/8.5;
      float y = map ( bDegrees[i], min(dDegrees), max(mDegrees), 450, 150)-22;
      textSize (13);
      bTest = true;
    }
    
  }
  else if (key == 'm'){
    b = color (216, 217, 218, 50);
    m = color (253, 184, 19);
    d = color (0, 135, 82, 50);
      for (int i=0; i < mDegrees.length; i++){
      fill (255);
      float x = i*width/8+width/8.5;
      float y = map ( mDegrees[i], min(dDegrees), max(mDegrees), 450, 150)-22;
      textSize (13);
      mTest = true;
    }
  }
  else if (key == 'd'){
    b = color (216, 217, 218, 50);
    m = color (253, 184, 19, 50);
    d = color (0, 135, 82);
        for (int i=0; i < dDegrees.length; i++){
      fill (255);
      float x = i*width/8+width/8.5;
      float y = map ( dDegrees[i], min(dDegrees), max(mDegrees), 450, 150)-22;
      textSize (13);
      dTest = true;
    }
  }
}


void keyReleased () {
  b = color (#d4d4d4);
  m = color (#fdb813);
  d = color (#008752);
  if (key == 'b') {
    bTest = false;
  }
  if (key == 'm') {
    mTest = false;
  }
  if (key == 'd'){
    dTest = false;
  }
  
}

void title () {
 textAlign(CENTER);
 fill(255);
 textSize(24);
 text ("Degrees Granted (Academic year 2010-2011)", 400, 62);
}

