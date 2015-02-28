
int ellipseHeight = 50;
int ellipseWidth = 50;
int ellipseSize = 100;
int arcHeight = 50;
int arcWidth = 250;
int arcSize = 100;
int bezierY = 50;
int bezierX = 50;

int strokeOpac = 100;
int redValue = 0;
int greenValue = 0;
int blueValue = 0;


void setup() {
  size(1000, 500);
  smooth();
background(255);

}


void draw() {

strokeOpac = map(mouseX, 100, width, 0, 255);
greenValue = map(mouseY, 100, height, 0, 255);
redValue = map(mouseY, 100, height, 0, 255);
blueValue = map(mouseY, 100, height, 0, 255);


stroke(redValue, greenValue, blueValue, strokeOpac);


//1 Large Shape
//ellipse left
noFill();
ellipseMode(CORNER);
ellipse(ellipseHeight, ellipseWidth*2, ellipseSize*3, ellipseSize*3);

//elipse right
noFill();
ellipseMode(CORNER);
ellipse(ellipseHeight*13, ellipseWidth*2, ellipseSize*3, ellipseSize*3);


//arc left
noFill();
ellipseMode(CENTER);
arc(arcHeight*7, arcWidth, arcSize*3, arcSize*3, radians(90), radians(270));

//arc right
noFill();
ellipseMode(CENTER);
arc(arcHeight*13, arcWidth, arcSize*3, arcSize*3, radians(270), radians(450));


//bezier ellipse topleft botright
noFill();
//line(40, 20, 80, 20);
//line(120, 80, 160, 80);
bezier(bezierX*4, bezierY*2, bezierX*8, bezierY*2, bezierX*12, bezierY*8, bezierX*16, bezierY*8);

//bezier ellipse topright botleft
noFill();
//line(160, 20, 120, 20);
//line(80, 80, 40, 80);
bezier(bezierX*16, bezierY*2, bezierX*12, bezierY*2, bezierX*8, bezierY*8, bezierX*4, bezierY*8);


//bezier arc topleft botright
noFill();
//line(70, 20, 100, 20);
//line(100, 80, 130, 80);
bezier(bezierX*7, bezierY*2, bezierX*10, bezierY*2, bezierX*10, bezierY*8, bezierX*13, bezierY*8);

//bezier arc topright botleft
noFill();
//line(130, 20, 100, 20);
//line(100, 80, 70, 80);
bezier(bezierX*13, bezierY*2, bezierX*10, bezierY*2, bezierX*10, bezierY*8, bezierX*7, bezierY*8);




//2 Medium shape
//ellipse left
noFill();
ellipseMode(CORNER);
ellipse(ellipseHeight*2, ellipseWidth*3, ellipseSize*2, ellipseSize*2);

//elipse right
noFill();
ellipseMode(CORNER);
ellipse(ellipseHeight*14, ellipseWidth*3, ellipseSize*2, ellipseSize*2);


//arc left
noFill();
ellipseMode(CENTER);
arc(arcHeight*8, arcWidth, arcSize*2, arcSize*2, radians(90), radians(270));

//arc right
noFill();
ellipseMode(CENTER);
arc(arcHeight*12, arcWidth, arcSize*2, arcSize*2, radians(270), radians(450));


//bezier ellipse topleft botright
noFill();
//line(40, 30, 80, 30);
//line(120, 70, 160, 70);
bezier(bezierX*4, bezierY*3, bezierX*8, bezierY*3, bezierX*12, bezierY*7, bezierX*16, bezierY*7);

//bezier ellipse topright botleft
noFill();
//line(160, 30, 120, 30);
//line(80, 70, 40, 70);
bezier(bezierX*16, bezierY*3, bezierX*12, bezierY*3, bezierX*8, bezierY*7, bezierX*4, bezierY*7);


//bezier arc topleft botright
noFill();
//line(80, 30, 100, 30);
//line(100, 70, 120, 70);
bezier(bezierX*8, bezierY*3, bezierX*10, bezierY*3, bezierX*10, bezierY*7, bezierX*12, bezierY*7);

//bezier arc topright botleft
noFill();
//line(120, 30, 100, 30);
//line(100, 70, 80, 70);
bezier(bezierX*12, bezierY*3, bezierX*10, bezierY*3, bezierX*10, bezierY*7, bezierX*8, bezierY*7);




//3 Small shape
//ellipse left
noFill();
ellipseMode(CORNER);
ellipse(ellipseHeight*3, ellipseWidth*4, ellipseSize, ellipseSize);

//elipse right
noFill();
ellipseMode(CORNER);
ellipse(ellipseHeight*15, ellipseWidth*4, ellipseSize, ellipseSize);


//arc left
noFill();
ellipseMode(CENTER);
arc(arcHeight*8, arcWidth, arcSize, arcSize, radians(90), radians(270));

//arc right
noFill();
ellipseMode(CENTER);
arc(arcHeight*12, arcWidth, arcSize, arcSize, radians(270), radians(450));


//bezier ellipse topleft botright
noFill();
//line(40, 40, 80, 40);
//line(120, 60, 160, 60);
bezier(bezierX*4, bezierY*4, bezierX*8, bezierY*4, bezierX*12, bezierY*6, bezierX*16, bezierY*6);

//bezier ellipse topright botleft
noFill();
//line(160, 40, 120, 40);
//line(80, 60, 40, 60);
bezier(bezierX*16, bezierY*4, bezierX*12, bezierY*4, bezierX*8, bezierY*6, bezierX*4, bezierY*6);


//bezier arc topleft botright
noFill();
//line(80, 40, 100, 40);
//line(100, 60, 120, 60);
bezier(bezierX*8, bezierY*4, bezierX*10, bezierY*4, bezierX*10, bezierY*6, bezierX*12, bezierY*6);

//bezier arc topright botleft
noFill();
//line(120, 40, 100, 40);
//line(100, 60, 80, 60);
bezier(bezierX*12, bezierY*4, bezierX*10, bezierY*4, bezierX*10, bezierY*6, bezierX*8, bezierY*6);

}



void mouseClicked() {
  strokeWeight(random(20));
  color c = color(random(25, 200),random(100, 255),random(50, 150),random(100, 200));
  float value = alpha(c);
  stroke(value);
  
}




/*
The artist I selected is Heather Hansen. She makes symmetrical chacoal drawings
using her entire body. She creates lots of circles and curvy lines. I found these
to connect with the ellipse, arc, and bezier tools. I feel like I captured her 
style of work with the piece of work that I created.
*/


