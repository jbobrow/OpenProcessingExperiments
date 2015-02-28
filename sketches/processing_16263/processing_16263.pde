
int page=1;
PFont font;
//CIRCLE
float circleX=240;
float circleY=160;
float circleR=25;
float speedX = 2.5;
float lastStart;
float m;
int start;
float time=.01;
float speedY = 1.0;
int directionX = 1;
int directionY = -1;

//RECTANGLE SHOOTER
float rectX=240;
float rectY=300;

//RECTANGLE PENDULUM
float rectPx=22.5;
float rectPy=-30;
//float rectPh=200;
//float rectPw=45;
float rectR=0;
float speedP=1;
float directionP=radians(1);
float pendX=240;
float pendY=-10;
float pendX2;
float pendY2;
float angle;

//CIRCLE COLOR CHANGE
float pinkR=252;
float pinkG=71;
float pinkB=145;
float blueR=33;
float blueG=146;
float blueB=249;
float currentR;
float currentG;
float currentB;
float r=252;
float g=71;
float b=145;
float speedC=1;
float colorCr=1.5;
float colorCg=1.5;
float colorCb=1.5;

//BULLET
float bullX=240;
float bullY=300;
float bullR=3;

// BOOLEANS
boolean Blue=false;
boolean Pink=false;
boolean shoot=false;
boolean move= true;
boolean right=false;
boolean left=false;
boolean hitting=false;

//score
int score=0;

PImage instruct;

void setup() {
  size(480,320);
  smooth();
  rectMode(CENTER);
  ellipseMode(RADIUS);
  font=loadFont("AndaleMono-40.vlw");
  start=millis();
  instruct= loadImage("instruct.jpg");
  lastStart=0;
}

void draw() {

  if(page==1) {
    intro();
  }

  if (page==2) {
    gameStartPINK();
  }
  
  if (page==3){
  restart();}
  
  if (page==4){
  gameStartBLUE();
  }
}


void intro() {
  
  noStroke();
  background(0);
  fill(50);
  textSize(24);
  text("CHOOSE A COLOR.",133,200);
  ///ADD INTRO PAGE---------------------------------------------------
  fill(252,71,145);
  rect(180,120,60,60);
  fill(33,146,249);
  rect(300,120,60,60);
  image(instruct,0,220);
  lastStart=millis();
 

  if(mousePressed && move) {
    float d=dist(mouseX,mouseY,180,120);
    if(d<20){
    page=2;
    move=false;
  }}
  
    if(mousePressed && move) {
    float d=dist(mouseX,mouseY,300,120);
    if(d<20){
    page=4;
    move=false;
  }}
}

//BEGIN GAME CHOOSE PINK==========================================

void gameStartPINK() {
  background(0);
  m=millis()-lastStart;
  println("m equals"+ m);
  textSize(10);
  text("SCORE:"+ score,410,15);
  //BOTTOM RECTANGLE SHOOTER================================
  fill(75);
  noStroke();
  float Rx=constrain(rectX,30,width-30);
  rect(Rx,rectY,80,20);
  


  //CIRCLE TARGET COLOR START PINK============================================
  currentR=r;
  currentG=g;
  currentB=b;
  println(currentR + " " + currentG + " " + currentB);

  fill(currentR,currentG,currentB);

  r-=speedC*colorCr;
  if((r>=252) || (r<=33)) {
    colorCr=-colorCr;
  }
  g+=speedC*colorCg;
  if((g<=71) || (g>=146)) {
    colorCg=-colorCg;
  }

  b+=speedC*colorCb;
  if((b<=145) || (b>=249)) {
    colorCb=-colorCb;
  }
  //   CIRCLE TARGET=========================================
  noStroke();
 
  
  ellipse(circleX,circleY,circleR,circleR);
  circleX += (speedX+m/10000) * directionX;
  

  if ((circleX > width-circleR) || (circleX < circleR)) {
    directionX = -directionX;
  }
  circleY += speedY * directionY;
  if ((circleY > 252) || (circleY < circleR)) {
    directionY = -directionY;
  }


  if (key == CODED) {
    if (keyCode == LEFT) {
      if (keyPressed == true) {
        rectX-=4;
      }
    }
  }

  if (key == CODED) {
    if (keyCode == RIGHT) {
      if (keyPressed == true) {
        rectX+=4;
      }
    }
  }

  //  COLOR BOOLEAN===================================

  if(currentR<=114 && currentR>=33) {

    Blue=true;
  }
  else {
    Blue=false;
  }
  if(Blue) {
    println("BLUE");
  }
  // PENDULUM================================

  float pendX2=((cos(angle))*250)+width/2;
  float pendY2=(sin(angle))*250;
  angle+=speedP*directionP;
  stroke(75);
  strokeWeight(5);
  strokeCap(SQUARE);
  line(pendX,pendY,pendX2,pendY2);

  if((angle>PI) || (angle<0)) {
    directionP=-directionP;
  }
  

if (side(pendX,pendY,pendX2,pendY2,circleX,circleY)<0){
left=true;
}
  if (circleLineIntersect(pendX, pendY,pendX2,pendY2, circleX, circleY, circleR) == true){
    hitting=true;}
    
    if (hitting ==true ){
//    if(left ==true){
    hitting=false;
    circleR=random(7,25);
    }
    

  // SHOOT BOOLEAN=======================
  fill(75);
  noStroke();
  float Bx= constrain(bullX,30,width-40);
  ellipse(Bx,bullY,bullR,bullR);
  
  if (shoot == true) {
    bullY = bullY - 15;
  }

  if (bullY < -10) {
    shoot = false;
  }

  if (circlecircleIntersect(circleX,circleY,circleR,bullX,bullY,bullR) == true) {
    if(Blue == true) {
      shoot=false;
      score+=1;
      println(score);
    }
  }

  if (circlecircleIntersect(circleX,circleY,circleR,bullX,bullY,bullR) == true && shoot ==true) {
    if(Blue == false) {
      shoot=false;
      time=m;
      page=3;
    }
  }

  if(shoot == false) {
    bullY=300;
  }

if (key == CODED) {
    if (keyCode == LEFT) {
      if (keyPressed == true) {
        bullX-=4;
      } 
    }
  }

  if (key == CODED) {
    if (keyCode == RIGHT) {
      if (keyPressed == true) {
        bullX+=4;
      }
    }
  }

}

// BEGIN GAME CHOOSE BLUE===============================================
void gameStartBLUE() {
  background(0);
  m=millis()-lastStart;
  println("m equals"+ m);
  textSize(10);
  text("SCORE:"+ score,410,15);
  //BOTTOM RECTANGLE SHOOTER================================
  fill(75);
  noStroke();
   float Rx=constrain(rectX,30,width-30);
  rect(Rx,rectY,80,20);


  //CIRCLE TARGET COLOR START BLUE============================================
  currentR=r;
  currentG=g;
  currentB=b;
  println(currentR + " " + currentG + " " + currentB);

  fill(currentR,currentG,currentB);

  r-=speedC*colorCr;
  if((r>=252) || (r<=33)) {
    colorCr=-colorCr;
  }
  g+=speedC*colorCg;
  if((g<=71) || (g>=146)) {
    colorCg=-colorCg;
  }

  b+=speedC*colorCb;
  if((b<=145) || (b>=249)) {
    colorCb=-colorCb;
  }
  //   CIRCLE TARGET=========================================
  noStroke();
  ellipse(circleX,circleY,circleR,circleR);
  circleX += (speedX+ (m/10000)) * directionX;

  if ((circleX > width-circleR) || (circleX < circleR)) {
    directionX = -directionX;
  }
  circleY += speedY * directionY;
  if ((circleY > 252) || (circleY < circleR)) {
    directionY = -directionY;
  }


  if (key == CODED) {
    if (keyCode == LEFT) {
      if (keyPressed == true) {
        rectX-=4;
      }
    }
  }

  if (key == CODED) {
    if (keyCode == RIGHT) {
      if (keyPressed == true) {
        rectX+=4;
      }
    }
  }

  //  COLOR BOOLEAN===================================

  if(currentR<=252 && currentR>=216) {

    Pink=true;
  }
  else {
    Pink=false;
  }
  if(Pink) {
    println("PINK");
  }
  // PENDULUM================================

  float pendX2=((cos(angle))*250)+width/2;
  float pendY2=(sin(angle))*250;
  angle+=speedP*directionP;
  stroke(75);
  strokeWeight(5);
  strokeCap(SQUARE);
  line(pendX,pendY,pendX2,pendY2);

  if((angle>PI) || (angle<0)) {
    directionP=-directionP;
  }

if (side(pendX,pendY,pendX2,pendY2,circleX,circleY)>0){
right=true;
}

if (circleLineIntersect(pendX, pendY,pendX2,pendY2, circleX, circleY, circleR) == true){
    hitting=true;}
    
    if (hitting ==true ){
//    if(left ==true){
    hitting=false;
    circleR=random(7,25);
    }

  
    


  // SHOOT BOOLEAN=======================
  fill(75);
  noStroke();
  float Bx= constrain(bullX,30,width-40);
  ellipse(Bx,bullY,bullR,bullR);
  
  if (shoot == true) {
    bullY = bullY - 15;
  }

  if (bullY < -10) {
    shoot = false;
  }

  if (circlecircleIntersect(circleX,circleY,circleR,bullX,bullY,bullR) == true) {
    if(Pink == true) {
      shoot=false;
      score+=1;
      println(score);
    }
  }

  if (circlecircleIntersect(circleX,circleY,circleR,bullX,bullY,bullR) == true && shoot==true) {
    if(Pink == false) {
      shoot=false;
      page=3;
    }
  }

  if(shoot == false) {
    bullY=300;
  }

if (key == CODED) {
    if (keyCode == LEFT) {
      if (keyPressed == true) {
        bullX-=4;
      } 
    }
  }

  if (key == CODED) {
    if (keyCode == RIGHT) {
      if (keyPressed == true) {
        bullX+=4;
      }
    }
  }

}
//CIRCLE LINE INTERSECT FUNCTION===============================================

float side ( float Sx1, float Sy1, float Sx2, float Sy2, float pointSx, float pointSy )
{
  return (Sx2 - Sx1) * (pointSy - Sy1) - (Sy2 - Sy1) * (pointSx - Sx1);
}

boolean circlecircleIntersect(float Cx1, float Cy1, float Cr1, float Cx2, float Cy2, float Cr2) {
  return dist(Cx1, Cy1, Cx2, Cy2) < Cr1 + Cr2;
}

//Following code adapted from http://www.openprocessing.org/visuals/?visualID=8009

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

void keyPressed() {
  if (key == ' ') {
    shoot=true;
  }
}

//RESTART================================================
void restart(){
background(0);
fill(75);
textSize(50);
text("YOU LOSE",120,160);
fill(255);
textSize(10);
text("Click to restart.",200,180);
score=0;


if(mousePressed && move){
move=false;
page=1;
}
}


//MOVE BOOLEAN===================================
void mouseReleased()
{
  move=true;
}











