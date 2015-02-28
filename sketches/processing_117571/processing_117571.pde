

int myState = 0; 
int myCounter = 150;

/* @pjs font="BigelowRules-Regular.ttf";*/

PFont myFont;

float x = 0;
float y = 0;
float y1 = 0;
float y2 = 0 ;


void setup() {
  size(500, 500);
  
  myFont = loadFont("BigelowRules-Regular.ttf",200); 
textFont(myFont, 46); 
  text("Merry Christmas", 50, 300); 
  
  noStroke(); 
}

void draw() {
  myCounter = myCounter - 1;
  background(0);
  
switch(myState) {
  
  case 0:
fill(100);
rect(278, 265, 85, 20);
fill(100);
rect(290, 225, 60, 40);
fill(250);
ellipse(320, 330, 90, 90);
fill(250);
ellipse(320, 430, 90, 110);
fill(0);
ellipse(320, 450, 10, 10);
fill(0);
ellipse(320, 430, 10, 10);
fill(0);
ellipse(320, 410, 10, 10);
fill(0);
ellipse(305, 325, 10, 10);
fill(0);
ellipse(335, 325, 10, 10);
fill(250, 150, 0);
triangle(315, 340, 325, 340, 320, 366);

fill(255);
ellipse(5, 490, 100, 20);
fill(255);
ellipse(50, 495, 100, 20);
fill(255);
ellipse(78, 492, 150, 22);
fill(255);
ellipse(150, 492, 100, 20);
fill(255);
ellipse(200, 492, 100, 20);
fill(255);
ellipse(240, 496, 100, 20);
fill(255);
ellipse(270, 493, 100, 20);
fill(255);
ellipse(300, 495, 100, 20);
fill(255);
ellipse(333, 492, 100, 20);
fill(255);
ellipse(368, 495, 100, 20);
fill(255);
ellipse(400, 494, 100, 20);
fill(255);
ellipse(458, 495, 100, 20);

if (myCounter < 0) {
  myCounter = 250;
  myState = 1;
}
break;

case 1:

text("Merry Christmas", 50, 300);

fill(100);
rect(278, 265, 85, 20);
fill(100);
rect(290, 225, 60, 40);
fill(250);
ellipse(320, 330, 90, 90);
fill(250);
ellipse(320, 430, 90, 110);
fill(0);
ellipse(320, 450, 10, 10);
fill(0);
ellipse(320, 430, 10, 10);
fill(0);
ellipse(320, 410, 10, 10);
fill(0);
ellipse(305, 325, 10, 10);
fill(0);
ellipse(335, 325, 10, 10);
fill(250, 150, 0);
triangle(315, 340, 325, 340, 320, 366);

fill(255);
ellipse(5, 490, 100, 20);
fill(255);
ellipse(50, 495, 100, 20);
fill(255);
ellipse(78, 492, 150, 22);
fill(255);
ellipse(150, 492, 100, 20);
fill(255);
ellipse(200, 492, 100, 20);
fill(255);
ellipse(240, 496, 100, 20);
fill(255);
ellipse(270, 493, 100, 20);
fill(255);
ellipse(300, 495, 100, 20);
fill(255);
ellipse(333, 492, 100, 20);
fill(255);
ellipse(368, 495, 100, 20);
fill(255);
ellipse(400, 494, 100, 20);
fill(255);
ellipse(458, 495, 100, 20);

if (myCounter < 0) {
  myCounter = 400;
  myState = 2;
}
break;

case 2:
text("Merry Christmas", 50, 300);

fill(100);
rect(278, 265, 85, 20);
fill(100);
rect(290, 225, 60, 40);
fill(250);
ellipse(320, 330, 90, 90);
fill(250);
ellipse(320, 430, 90, 110);
fill(0);
ellipse(320, 450, 10, 10);
fill(0);
ellipse(320, 430, 10, 10);
fill(0);
ellipse(320, 410, 10, 10);
fill(0);
ellipse(305, 325, 10, 10);
fill(0);
ellipse(335, 325, 10, 10);
fill(250, 150, 0);
triangle(315, 340, 325, 340, 320, 366);

fill(255);
ellipse(5, 490, 100, 20);
fill(255);
ellipse(50, 495, 100, 20);
fill(255);
ellipse(78, 492, 150, 22);
fill(255);
ellipse(150, 492, 100, 20);
fill(255);
ellipse(200, 492, 100, 20);
fill(255);
ellipse(240, 496, 100, 20);
fill(255);
ellipse(270, 493, 100, 20);
fill(255);
ellipse(300, 495, 100, 20);
fill(255);
ellipse(333, 492, 100, 20);
fill(255);
ellipse(368, 495, 100, 20);
fill(255);
ellipse(400, 494, 100, 20);
fill(255);
ellipse(458, 495, 100, 20);

  fill(255);
 ellipse(x, y, 10, 10); 
 ellipse(x+20, y+15, 10, 10); 
 ellipse(x+38, y, 10, 10); 
 ellipse(x, y+50, 10, 10); 
 ellipse(x+60, y+10, 10, 10); 
 ellipse(x+75, y+30, 10, 10); 
 
  ellipse(75, y1, 20, 20); 
 ellipse(90, y1+15, 10, 10); 
 ellipse(115, y1, 30, 30); 
 ellipse(123, y1+50, 10, 10); 
 ellipse(135, y1+10, 10, 10); 
 ellipse(225, y1+30, 10, 10); 
 
ellipse(175, y2, 20, 20); 
 ellipse(200, y2+15, 10, 10); 
 ellipse(233, y2, 30, 30); 
 ellipse(240, y1+75, 10, 10); 
 ellipse(244, y1+16, 10, 10); 
 ellipse(261, y2+22, 10, 10); 

ellipse(255, y, 5, 5); 
 ellipse(270, y+15, 25, 25); 
 ellipse(279, y, 10, 10); 
 ellipse(283, y1+75, 10, 10); 
 ellipse(290, y1+16, 10, 10); 
 ellipse(300, y2+22, 10, 10); 
 
ellipse(310, y, 5, 5); 
 ellipse(350, y+15, 25, 25); 
 ellipse(370, y, 10, 10); 
 ellipse(323, y1+75, 10, 10); 
 ellipse(341, y1+16, 10, 10); 
 ellipse(366, y2+22, 10, 10); 

 ellipse(420, y, 5, 5); 
 ellipse(400, y2+15, 25, 25); 
 ellipse(375, y, 10, 10); 
 ellipse(387, y+75, 10, 10); 
 ellipse(371, y+16, 10, 10); 
 ellipse(395, y1+22, 10, 10); 
 
 y = y+1.3;
 y1 = y1 + 2 ;
 y2 = y2 + .8;
if (y > height) {
  y = 0;
}

if (y1 > height) {
  y1 = 0;
}

if (myCounter < 0) {
  myCounter = 350;
  myState = 3;
}
break;

case 3:
text("Merry Christmas", 50, y+15);

fill(100);
rect(278, 265, 85, 20);
fill(100);
rect(290, 225, 60, 40);
fill(250);
ellipse(320, 330, 90, 90);
fill(250);
ellipse(320, 430, 90, 110);
fill(0);
ellipse(320, 450, 10, 10);
fill(0);
ellipse(320, 430, 10, 10);
fill(0);
ellipse(320, 410, 10, 10);
fill(0);
ellipse(305, 325, 10, 10);
fill(0);
ellipse(335, 325, 10, 10);
fill(250, 150, 0);
triangle(315, 340, 325, 340, 320, 366);

fill(255);
ellipse(5, 490, 100, 20);
fill(255);
ellipse(50, 495, 100, 20);
fill(255);
ellipse(78, 492, 150, 22);
fill(255);
ellipse(150, 492, 100, 20);
fill(255);
ellipse(200, 492, 100, 20);
fill(255);
ellipse(240, 496, 100, 20);
fill(255);
ellipse(270, 493, 100, 20);
fill(255);
ellipse(300, 495, 100, 20);
fill(255);
ellipse(333, 492, 100, 20);
fill(255);
ellipse(368, 495, 100, 20);
fill(255);
ellipse(400, 494, 100, 20);
fill(255);
ellipse(458, 495, 100, 20);

  fill(255);
 ellipse(x, y, 10, 10); 
 ellipse(x+20, y+15, 10, 10); 
 ellipse(x+38, y, 10, 10); 
 ellipse(x, y+50, 10, 10); 
 ellipse(x+60, y+10, 10, 10); 
 ellipse(x+75, y+30, 10, 10); 
 
  ellipse(75, y1, 20, 20); 
 ellipse(90, y1+15, 10, 10); 
 ellipse(115, y1, 30, 30); 
 ellipse(123, y1+50, 10, 10); 
 ellipse(135, y1+10, 10, 10); 
 ellipse(225, y1+30, 10, 10); 
 
ellipse(175, y2, 20, 20); 
 ellipse(200, y2+15, 10, 10); 
 ellipse(233, y2, 30, 30); 
 ellipse(240, y1+75, 10, 10); 
 ellipse(244, y1+16, 10, 10); 
 ellipse(261, y2+22, 10, 10); 

ellipse(255, y, 5, 5); 
 ellipse(270, y+15, 25, 25); 
 ellipse(279, y, 10, 10); 
 ellipse(283, y1+75, 10, 10); 
 ellipse(290, y1+16, 10, 10); 
 ellipse(300, y2+22, 10, 10); 
 
ellipse(310, y, 5, 5); 
 ellipse(350, y+15, 25, 25); 
 ellipse(370, y, 10, 10); 
 ellipse(323, y1+75, 10, 10); 
 ellipse(341, y1+16, 10, 10); 
 ellipse(366, y2+22, 10, 10); 

 ellipse(420, y, 5, 5); 
 ellipse(400, y2+15, 25, 25); 
 ellipse(375, y, 10, 10); 
 ellipse(387, y+75, 10, 10); 
 ellipse(371, y+16, 10, 10); 
 ellipse(395, y1+22, 10, 10); 
 
 y = y+1.3;
 y1 = y1 + 2 ;
 y2 = y2 + .8;
if (y > height) {
  y = 0;
}

if (y1 > height) {
  y1 = 0;
}

if (myCounter < 0) {
  myCounter = 400;
  myState = 4;
}
break;

case 4:


fill(100);
rect(278, 265, 85, 20);
fill(100);
rect(290, 225, 60, 40);
fill(250);
ellipse(320, 330, 90, 90);
fill(250);
ellipse(320, 430, 90, 110);
fill(0);
ellipse(320, 450, 10, 10);
fill(0);
ellipse(320, 430, 10, 10);
fill(0);
ellipse(320, 410, 10, 10);
fill(0);
ellipse(305, 325, 10, 10);
fill(0);
ellipse(335, 325, 10, 10);
fill(250, 150, 0);
triangle(315, 340, 325, 340, 320, 366);

fill(255);
ellipse(5, 490, 100, 20);
fill(255);
ellipse(50, 495, 100, 20);
fill(255);
ellipse(78, 492, 150, 22);
fill(255);
ellipse(150, 492, 100, 20);
fill(255);
ellipse(200, 492, 100, 20);
fill(255);
ellipse(240, 496, 100, 20);
fill(255);
ellipse(270, 493, 100, 20);
fill(255);
ellipse(300, 495, 100, 20);
fill(255);
ellipse(333, 492, 100, 20);
fill(255);
ellipse(368, 495, 100, 20);
fill(255);
ellipse(400, 494, 100, 20);
fill(255);
ellipse(458, 495, 100, 20);

  fill(255);
 ellipse(x, y, 10, 10); 
 ellipse(x+20, y+15, 10, 10); 
 ellipse(x+38, y, 10, 10); 
 ellipse(x, y+50, 10, 10); 
 ellipse(x+60, y+10, 10, 10); 
 ellipse(x+75, y+30, 10, 10); 
 
  ellipse(75, y1, 20, 20); 
 ellipse(90, y1+15, 10, 10); 
 ellipse(115, y1, 30, 30); 
 ellipse(123, y1+50, 10, 10); 
 ellipse(135, y1+10, 10, 10); 
 ellipse(225, y1+30, 10, 10); 
 
ellipse(175, y2, 20, 20); 
 ellipse(200, y2+15, 10, 10); 
 ellipse(233, y2, 30, 30); 
 ellipse(240, y1+75, 10, 10); 
 ellipse(244, y1+16, 10, 10); 
 ellipse(261, y2+22, 10, 10); 

ellipse(255, y, 5, 5); 
 ellipse(270, y+15, 25, 25); 
 ellipse(279, y, 10, 10); 
 ellipse(283, y1+75, 10, 10); 
 ellipse(290, y1+16, 10, 10); 
 ellipse(300, y2+22, 10, 10); 
 
ellipse(310, y, 5, 5); 
 ellipse(350, y+15, 25, 25); 
 ellipse(370, y, 10, 10); 
 ellipse(323, y1+75, 10, 10); 
 ellipse(341, y1+16, 10, 10); 
 ellipse(366, y2+22, 10, 10); 

 ellipse(420, y, 5, 5); 
 ellipse(400, y2+15, 25, 25); 
 ellipse(375, y, 10, 10); 
 ellipse(387, y+75, 10, 10); 
 ellipse(371, y+16, 10, 10); 
 ellipse(395, y1+22, 10, 10); 
 
 y = y+1.3;
 y1 = y1 + 2 ;
 y2 = y2 + .8;
if (y > height) {
  y = 0;
}

if (y1 > height) {
  y1 = 0;
}

if (myCounter < 0) {
  myCounter = 400;
  myState = 0;
}
break;






}
}





