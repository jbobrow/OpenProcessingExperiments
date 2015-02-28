
// 255 = white
// 0 = black
float centerX = width/2;
float centerY = height/2;
PVector centerCircle;
PVector[] level1 = new PVector[8];
PVector[] level2White = new PVector[6];
PVector[] level2Black = new PVector[6]; 
PVector[] level3White = new PVector[6];
PVector[] level3Black = new PVector[6];

  boolean ccFill = true;
  boolean l1cW = false;  
  boolean l2cW = true;
  boolean l2cB = false;

void setup(){
  size(500, 500);
  background(220);
  smooth();
  
  // establishes center circle's coordinate vector
  centerCircle = new PVector(width/2, height/2);
  
  // establishes level 1's coordinate vector
  int count1 = 0;
  for (float i = PI/16; i< 2*PI; i += PI/4){ 
    float amplitude = 80;
    float cxPos = centerX + amplitude * sin(i);
    float cyPos = centerY + amplitude * cos(i);
    PVector temp1 = new PVector(cxPos, cyPos);
    level1[count1] = temp1;
    count1 ++;
  }
  println (level1);
}

// true = white
// false = black

void draw(){
  background(220);
  float centerX = width/2;
  float centerY = height/2;
  
  smooth();
  noStroke();
  
  // center circle
  drawCircle(width/2, height/2, 100, ccFill);
  
  // level 1 circles
  for (float i = PI/16; i< 2*PI; i += PI/4){ 
    float amplitude = 80;
    float cxPos = centerX + amplitude * sin(i);
    float cyPos = centerY + amplitude * cos(i);
    drawCircle(cxPos, cyPos, 50, l1cW);
  }
  
  // level 2 circles - white
  for (float i = PI/16; i< 2*PI; i += PI/3){ 
    float amplitude = 130;
    float cxPos = centerX + amplitude * sin(i);
    float cyPos = centerY + amplitude * cos(i);
    drawCircle(cxPos, cyPos, 30, l2cW);
  }
  
  // level 2 circles - black
  for (float i = PI/4; i< 2*PI; i += PI/3){ 
    float amplitude = 150;
    float cxPos = centerX + amplitude * sin(i);
    float cyPos = centerY + amplitude * cos(i);
    drawCircle(cxPos, cyPos, 70, l2cB);
  }
}

void drawCircle(float cxPos, float cyPos, float radius, boolean shade){
  smooth();
  if (shade == true){
    fill(255);
  } else {
    fill(0);
  }
  ellipse (cxPos, cyPos, radius, radius);
}

// finds distance between mouseX and mouseY and circle to be checked
boolean inCircle(float cx, float cy, float mX, float mY, float radius){
  float distance = dist(cx, cy, mX, mY);
  return (distance <= radius);
}

void mousePressed(){
  float mX = mouseX;
  float mY = mouseY;
  if (inCircle(centerCircle.x, centerCircle.y, mX, mY, 50)){
    ccFill = false;
  } 
}

void mouseReleased(){
  float mX = mouseX;
  float mY = mouseY;
  for (int i=0; i< 8; i++){
    println ("released!" + " " + mouseX + " " + mouseY);
    if (inCircle(level1[i].x, level1[i].y, mX, mY, 25)){
      l1cW = true;
      println ("hurray!");
    }
  }
}
