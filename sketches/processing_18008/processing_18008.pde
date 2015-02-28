
//Assignment 2: My Avatar
//by Brittany Truex

//colors
int bRound = 255;
int rBun = 253;
int gBun = 208;
int bBun = 28;
int r = 255;
int g = 255;
int b = 255;
int bodLine = 0;
int rBod = 191;
int gBod = 17;
int bBod = 11;
int rRelish = 0;
int gRelish = 255;
int bRelish = 0;

//shapes

void setup(){
  size(200,200);
  smooth();
  frameRate(60);
}
void draw(){
  background(bRound);
  // blanket  
  background(r,g,b);
fill(r,0,0);
noStroke();
//row
for (int x = 0; x < width+25; x += 50){
  for (int y = 0; y < height+25; y += 50){
rect (x,y,25,25);
    }
}
//rowalt
for (int x = 25; x < width+25; x += 50){
    for (int y = 25; y < height+25; y += 50){
      rect (x,y,25,25);
    }
}

//bun
fill(rBun,gBun,bBun);
noStroke();
rectMode(CENTER);
ellipseMode(CENTER);
 
float bun1X = mouseX-22;
float bun1Y = mouseY-42;
float bun1Y1 = mouseY+51;
float bun2X = mouseX+26;
float bun2Y = bun1Y;
float bun2Y1 = bun1Y1;

int bun1W = 43;
int bun1H = 47;

int bunRy = mouseY+5;
int bunRw = 42;
int bunRh = 80;

//left
ellipse(bun1X,bun1Y,bun1W,bun1H);
rect(bun1X+.5,bunRy,bunRw,bunRh);
ellipse(bun1X,bun1Y1,bun1W,bun1H+.7);

//right
ellipse(bun2X,bun2Y,bun1W,bun1H);
rect(bun2X+.5,bunRy,bunRw,bunRh);
ellipse(bun2X,bun2Y1,bun1W,bun1H);

//legs
noFill();
stroke(bodLine);
strokeWeight(1.5);

int legRx = mouseX+13;
int legRy = mouseY+90;
int legLx = mouseX-10;
int legLy = mouseY+90;

int start = 30;
int stop = 50;

arc(legRx,legRy,start,stop,TWO_PI-PI/2, TWO_PI);
arc(legLx,legLy,start,stop,PI,TWO_PI-PI/2);

//feet
noFill();
stroke(bodLine);
strokeWeight(1);

int footLx = mouseX-30;
int footLy = mouseY+90;
int footRx = mouseX+33;
int footRy = footLy;
int footW  = 13;
int footH = 4;

ellipse(footLx,footLy,footW,footH);
ellipse(footRx,footRy,footW,footH);

//hotdog body
fill(rBod,gBod,bBod);
noStroke();
rectMode(CENTER);
ellipseMode(CENTER);

int bodx = mouseX+3;
int body1 = mouseY-39;
int bodW = 47;
int bodW2 = 48;
int body2 = mouseY+5;
int body3 = mouseY+48;
int bodH = 80;

ellipse(bodx,body1,bodW,bodW);
rect(bodx+.3,body2,bodW,bodH);
ellipse(bodx,body3+.8,bodW2,bodW);

//eyes
fill(bRound);
noStroke();

int eyeX1 = mouseX-3;
int eyeX2 = mouseX+11;
int eyeX3 = pmouseX-3;
int eyeX4 = pmouseX+11;
int eyeY = mouseY-39;
int eyeW = 12;
int eyeH = 33; 
int eyeY2 = pmouseY-31;
int eyeW2 = 5;
int eyeH2 = 17;


ellipse(eyeX1,eyeY+.5,eyeW,eyeH);
ellipse(eyeX2,eyeY+.5,eyeW,eyeH);

fill(bodLine);
noStroke();

ellipse(eyeX3,eyeY2,eyeW2,eyeH2);
ellipse(eyeX4,eyeY2,eyeW2,eyeH2);

//mouth
noFill();
stroke(bodLine);
strokeWeight(.5);

int mouthX = mouseX+11;
int mouthY = mouseY-17;
int start1 = 15;
int stop1 = start1;

arc(mouthX,mouthY,start1,stop1,PI/2,PI);


//arms
noFill();
stroke(bodLine);
strokeWeight(2);

int armX = mouseX-17;
int armY = mouseY-13;
int armX1 = mouseX+23;
int armY1 = mouseY-7;
int start2 = 40;
int stop2 = 40;

arc(armX,armY,start2,stop2,PI/2,PI);
arc(armX1,armY1,start2,stop2,0,PI/2);

//condiment
stroke(mouseX+255,mouseX+40,0);
noFill();
strokeWeight(5);
int conX = mouseX+2;
int conY = mouseY+5;
int start3 = 15;
int stop3 = start3;

arc(conX,conY,start3,stop3,TWO_PI-PI/2,TWO_PI);
arc(conX,conY+1,start3,stop3,0,PI/2);
arc(conX,conY+15,start3,stop3,PI/2,PI);
arc(conX,conY+16,start3,stop3,PI,TWO_PI-PI/2);
arc(conX,conY+30,start3,stop3,TWO_PI-PI/2,TWO_PI);
arc(conX,conY+31,start3,stop3,0,PI/2);
arc(conX,conY+45,start3,stop3,PI/2,PI);
arc(conX,conY+46,start3,stop3,PI,TWO_PI-PI/2);

if (mousePressed) {
   stroke(rRelish,gRelish,bRelish);
   noFill();
   strokeWeight(5);

arc(conX,conY,start3,stop3,TWO_PI-PI/2,TWO_PI);
arc(conX,conY+1,start3,stop3,0,PI/2);
arc(conX,conY+15,start3,stop3,PI/2,PI);
arc(conX,conY+16,start3,stop3,PI,TWO_PI-PI/2);
arc(conX,conY+30,start3,stop3,TWO_PI-PI/2,TWO_PI);
arc(conX,conY+31,start3,stop3,0,PI/2);
arc(conX,conY+45,start3,stop3,PI/2,PI);
arc(conX,conY+46,start3,stop3,PI,TWO_PI-PI/2);
}
}















