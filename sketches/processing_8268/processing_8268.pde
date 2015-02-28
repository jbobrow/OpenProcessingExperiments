


int page = 1;   

PFont font;

float circleX;
float circleY;
float circleRadius = 40;

float circleXBlue;
float circleYBlue;
float circleRBlue = 20;


float lineX1;
float lineY1;
float lineX2, lineY2;

float lineX1B;
float lineY1B;
float lineX2B, lineY2B;


float speed = 2.0;
float d;
float Bd;

float length1 = 20; 
float sWeight = 10; 

int Score =0;
String t = "0";

  color bRing = color(255,153,0);
  color sRing = color(58,133,206);
  
PImage img;  
//######################################################
//######################################################
//######################################################

void setup() {
   size(480, 320); 
  ellipseMode(RADIUS);
  smooth();
  // strokeWeight(10);
  noFill();
  font = loadFont("ArialRoundedMTBold-200.vlw");
  textFont(font);
  textSize(250);
  textAlign(CENTER);
  img = loadImage("game_intro1.png");
}
//######################################################
//######################################################
void draw() {
  
 if (page == 1) {
    pageOne();
  } else if (page == 2) {
    pageTwo(); 
 } else if (page == 3) {
    pageThree(); 
  }else if (page == 4) {
    pageFour(); 

  }else if (page == 5) {
    pageFive(); 
  }
}

void mousePressed() {
  if (page == 1) {
    page = 2; 
    }else if (page == 3) {
   page = 4; 
    }else if (page == 5) {
   page =1;
   Score = 10;
    }
} 

// WELCOME PAGE

void pageOne() {
 background(0);
 image(img,0,0);
 }

// LEVEL ONE

void pageTwo() {
 

  fill(0,30);
  noStroke();
  rect(0,0,width,height);



  int t = Score;
  
  fill(255,5);
 text (t,240,240);
  noFill();
  println(Score);
  //######################################################
  //######################################################
  //######################################################

  circleX = mouseX;
  circleY = mouseY;
  circleXBlue =  50 + mouseX;
  circleYBlue = height - mouseY;


  //######################################################
  //######################################################
  //######################################################
  // if RED circle touches LINE1 

  if (circleLineIntersect(lineX1, lineY1, lineX2, lineY2, circleX, circleY, circleRadius) == true) {
    stroke(255);
    Score+=1;
    } 

  /// if BLUE Circle touches Line1B

else  
 if (circleLineIntersect(lineX1B, lineY1B, lineX2B, lineY2B, circleXBlue, circleYBlue, circleRBlue) == true) {
 
    stroke(255);
    //circleRBlue =20;
    Score +=1;
  } 
 
  //######################################################
  //######################################################
  //######################################################

strokeWeight(10);

 stroke(bRing);
 ellipse(circleX, circleY, circleRadius, circleRadius);
 stroke(sRing);
 ellipse(circleXBlue, circleYBlue, circleRBlue, circleRBlue);



  //######################################################
  //######################################################
  //######################################################

  stroke(255);
  strokeWeight(sWeight);

  lineX1= width/2;
  lineX2 = lineX1;
  lineY1= lineY2-length1;
  lineY2 = lineY2 + speed;


  //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

  lineX1B= width/2;
  lineX2B = lineX1B;
  
  lineY1B= lineY2B-length1;
  lineY2B = lineY2B + speed;
 


  float angle = radians(d);
  //float angle2 = radians(Bd);


  //######################################################
  //######################################################
  //######################################################


  if (lineY2 > 10){
    length1 -=0.1;
    sWeight += 0.08;
  }
  rotate(angle);

  stroke(bRing);
  line(lineX1, lineY1, lineX2, lineY2);
 
  //rotate(angle2); 
  rotate(-(angle*2)); 
  stroke(sRing);
  line(lineX1B, lineY1B, lineX2B, lineY2B);


  //######################################################
  //######################################################
  //###################################################### 

  if (lineY2 >height +60) {
    lineY2 = -50;
    length1 = 20; 
    sWeight = 10; 
    d = random(-50,50);
  }
 if (lineY1B>height+60){
   lineY2B = -50;
    length1 = 20; 
    sWeight = 10; 
 //   d = random(-50,50);
    //Bd = random(-50,50);
   }
   
   
if (Score == 100){
 page = 3; 
 }   
   
}

 

// LEVEL TWO INTRO

void pageThree() {

  fill(255,200);
  textSize(100);
  text ("level 2",240,170);
  textSize(20);
  text ("click to begin",240,215);
  
  fill(255,20);
  text ("bonus feature: click & hold the mouse",235,240);
}


// LEVEL TWO

void pageFour() {
  color bRing = color(182,0,255);
  color sRing = color(255,243,0);

  fill(0,30);
  noStroke();
  rect(0,0,width,height);



  int t = Score;
  textSize(250);
  fill(255,5);
  text (t,240,240);
  noFill();
  println(Score);
  //######################################################
  //######################################################
  //######################################################

  circleX = mouseX;
  circleY = mouseY;
  circleXBlue =  50 + mouseX;
  circleYBlue = height - mouseY;

if (mousePressed == true){
 circleXBlue =  width - mouseX;// Inverse X
circleYBlue = height - mouseY; // Inverse Y
}

  //######################################################
  //######################################################
  //######################################################
  // if RED circle touches LINE1 

  if (circleLineIntersect(lineX1, lineY1, lineX2, lineY2, circleX, circleY, circleRadius) == true) {
    stroke(255);
    circleRadius =40;

    Score+=1;
    
  } 

  /// if BLUE Circle touches Line1B

//else  
 if (circleLineIntersect(lineX1B, lineY1B, lineX2B, lineY2B, circleXBlue, circleYBlue, circleRBlue) == true) {
 
    stroke(255);
    circleRBlue =20;
    Score +=1;
  } 
 
  //######################################################
  //######################################################
  //######################################################

strokeWeight(10);

 stroke(bRing);
 ellipse(circleX, circleY, circleRadius, circleRadius);
 stroke(sRing);
 ellipse(circleXBlue, circleYBlue, circleRBlue, circleRBlue);



  //######################################################
  //######################################################
  //######################################################

  stroke(255);
  strokeWeight(sWeight);

  lineX1= width/2;
  lineX2 = lineX1;
  lineY1= lineY2-length1;
  lineY2 = lineY2 + speed;


  //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

  lineX1B= width/2;
  lineX2B = lineX1B;
  
  lineY1B= lineY2B-length1;
  lineY2B = lineY2B + 4;
  


  float angle = radians(d);


  //######################################################
  //######################################################
  //######################################################


  if (lineY2 > 10){
    length1 -=0.1;
    sWeight += 0.08;
  }
  rotate(angle);

  stroke(bRing);
  line(lineX1, lineY1, lineX2, lineY2);
 
  rotate(-(angle*2)); 
  stroke(sRing);
  line(lineX1B, lineY1B, lineX2B, lineY2B);


  //######################################################
  //######################################################
  //###################################################### 

  if (lineY2 >height +60) {
    lineY2 = -50;
    length1 = 20; 
    sWeight = 10; 
    d = random(-50,50);
  }
 if (lineY1B>height+60){
   lineY2B = -50;
    length1 = 20; 
    sWeight = 10; 
   // d = random(-50,50);
   }
   
if (Score == 200){
 page = 5; 
 }      
}

//END PAGE

void pageFive() {

  fill(255,200);
  textSize(80);
  text ("Score:"+ Score,240,180);
  textSize(20);
  text ("play again?",240,230);
}

































// Code adapted from Paul Bourke:
// http://local.wasp.uwa.edu.au/~pbourke/geometry/sphereline/raysphere.c
boolean circleLineIntersect(float x1, float y1, float x2, float y2, float cx, float cy, float cr ) {
  float dx = x2 - x1;
  float dy = y2 - y1;
  float a = dx * dx + dy * dy;
  float b = 2 * (dx * (x1 - cx) + dy * (y1 - cy));
  float c = cx * cx + cy * cy;
  c += x1 * x1 + y1 * y1;
  c -= 2 * (cx * x1 + cy * y1);
  c -= cr * cr;
  float bb4ac = b * b - 4 * a * c;

  //println(bb4ac);

  if (bb4ac < 0) {  // Not intersecting
    return false;
  } 
  else {

    float mu = (-b + sqrt( b*b - 4*a*c )) / (2*a);
    float ix1 = x1 + mu*(dx);
    float iy1 = y1 + mu*(dy);
    mu = (-b - sqrt(b*b - 4*a*c )) / (2*a);
    float ix2 = x1 + mu*(dx);
    float iy2 = y1 + mu*(dy);

    // The intersection points
    //ellipse(ix1, iy1, 10, 10);
    //ellipse(ix2, iy2, 10, 10);

    float testX;
    float testY;
    // Figure out which point is closer to the circle
    if (dist(x1, y1, cx, cy) < dist(x2, y2, cx, cy)) {
      testX = x2;
      testY = y2; 
    } 
    else {
      testX = x1;
      testY = y1; 
    }

    if (dist(testX, testY, ix1, iy1) < dist(x1, y1, x2, y2) || dist(testX, testY, ix2, iy2) < dist(x1, y1, x2, y2)) {
      return true;
    } 
    else {
      return false;
    }
  }
}







