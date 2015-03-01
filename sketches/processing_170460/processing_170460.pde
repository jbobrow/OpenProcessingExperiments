
//FINAL MIDTERM sketch
//float r;
//float g;
//float b;

float x1;
float y1;
float x2;
float y2;
float x3;
float y3;

float x4;
float y4;
float x5;
float y5;
float x6;
float y6;

float x7;
float y7;
float x8;
float y8;
float x9;
float y9;

boolean animating;
boolean animating2;
boolean animating3;

//---

void setup() {
  size (400, 400);
  frameRate(10);
  //r=random (255);
  //g=random (255);
  //b=random (255);

  noStroke();

  x1=200;
  y1=75;
  x2=200;
  y2=150;
  x3=475;
  y3=100;


  x4=200;
  y4=250;
  x5=200;
  y5=325;
  x6=-75;
  y6=300;

  x7 = 200;
  y7 =400;
  x8 =150;
  y8 =400;
  x9= 250;
  y9= 400;

  animating = false;
  animating2 = false;
  animating3 = false;
}

//---

void draw () {
  //background(10,200,b-10,150);
  //horizontal lines
  background (0,229,234);
  fill (0,5,234);
  
  //fill(r,g,b+10);
  triangle(x1, y1, x2, y2, x3, y3);
  triangle(x4, y4, x5, y5, x6, y6);
  triangle(x7, y7, x8, y8, x9, y9);

  drawFirst();
  //-----

  drawSecond();

  drawThird();



  //---
} 

//---------
void keyPressed() {
  animating = true;
  animating2 = true;
  animating3 = true;
}

void mousePressed () {
   saveFrame();
   
}

/*
void keyPressed () {
if (key == 'p') {
anmimating = true; 
}
if (key == ' ') {
  animating 4 = false (reset positions)
}
*/

void drawFirst() {
  if (animating==true) {
    x1=x1-15;
    y1= y1-7.5;
    x2=x2-10;
    y2= y2+5;
    x3 = x3-32.5;
    y3 = y3-10;


   if (y1==0) {
      animating = false;
    }
    if (x2==100) {
      animating = false;
    }
    if (x3==150) {
      animating = false;
    }
    
   
  }
}


void drawSecond() {

  if (animating2==true) {
   
    x4 =x4+5;
    y4 =y4-25;
    x5 = x5+15;
    y5 = y5-32.5;
    x6 = x6+37.5;
    y6 = y6-10;
  }
  if (x4 == 250) {
    animating2 = false;
  }
  if (x5 == 350) {
    animating2 = false;
  }
}


void drawThird() {

  if (animating3==true) {
       y7 = y7-20;
  }
  if (y7 == 200) {
    animating3 = false;
  }
  
}



