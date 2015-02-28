
/*****************************************
* Self portrait - static
* T Caulkins Sept 2011
*****************************************/

// declare your variables here

int xCenter = 300;
int yCenter = 300;
int xMirror= 60;
int xHairStart1 = xCenter;
int yHairStart1 = 70;
int xHairEnd1 = xCenter-140;
int yHairEnd1 = 170;

// setup() only happens once at the beginning of the sketch
void setup(){
// this is where you set the initial properties
size(600, 600);// size() should always go inside setup()
smooth();// smooth() usually only needs to go here
}

// draw() happens over and over and over
void draw(){
background(120, 120, 120, 150);// apply the background first
// now draw or evaluate anything you want

stroke(0); // Sets line value to black
strokeWeight(2); // Sets line width to 5 pixels

ellipseMode(CENTER);
fill(255);
//ears 
ellipse(xCenter - xMirror - 55, 225, 35, 80); // Large circle
ellipse(xCenter + xMirror + 55, 225, 35, 80); // Large circle
//head
fill(255);
ellipse(xCenter, 230, 220, 300);
//eyes
ellipse(xCenter - xMirror, 200, 60, 27); // Large circle
ellipse(xCenter + xMirror, 200, 60, 27); // Large circle
//iris
//fill(204);
fill(170, 120, 120, 255);

ellipse(xCenter - xMirror, 200, 27, 27); // Large circle
ellipse(xCenter + xMirror, 200, 27, 27); // Large circle
fill(1);
ellipse(xCenter - xMirror, 200, 3, 3); // Large circle
ellipse(xCenter + xMirror, 200, 3, 3); // Large circle

//nose
line(xCenter-5, 200, xCenter-5, 285 );
line(xCenter-5, 285, xCenter+10, 285 );
//mouth
line(xCenter-30, 305, xCenter-40, 315);
line(xCenter+30, 305, xCenter+40, 315);
fill(255);
bezier(xCenter-30, 315, xCenter-30, 330, xCenter+30, 330, xCenter+30, 315);
fill(1);
triangle(xCenter-5, 335, xCenter+5, 335, xCenter, 340 );
//hair
stroke(150, 100, 100); // Sets line value to black
strokeWeight(20); // Sets line width to 5 pixels

//line(xHairStart1-45, yHairStart1, xHairEnd1, yHairEnd1);
line(xHairStart1-45, yHairStart1, xHairEnd1+60, yHairEnd1-60);
line(xHairStart1-45, yHairStart1, xHairEnd1+40, yHairEnd1-40);
line(xHairStart1-45, yHairStart1, xHairEnd1+40, yHairEnd1-20);
line(xHairStart1-30, yHairStart1-10, xHairEnd1+40, yHairEnd1);
line(xHairStart1-30, yHairStart1-10, xHairEnd1+60, yHairEnd1);
line(xHairStart1-15, yHairStart1-20, xHairEnd1+80, yHairEnd1);
line(xHairStart1-15, yHairStart1-20, xHairEnd1+100, yHairEnd1-10);
line(xHairStart1, yHairStart1-20, xHairEnd1+120, yHairEnd1-20);
line(xHairStart1, yHairStart1-20, xHairEnd1+140, yHairEnd1-30);
line(xHairStart1, yHairStart1-20, xHairEnd1+160, yHairEnd1-20);
line(xHairStart1+15, yHairStart1-20, xHairEnd1+180, yHairEnd1-10);
line(xHairStart1+15, yHairStart1-20, xHairEnd1+200, yHairEnd1);
line(xHairStart1+30, yHairStart1-10, xHairEnd1+220, yHairEnd1);
line(xHairStart1+30, yHairStart1-10, xHairEnd1+240, yHairEnd1);
line(xHairStart1+45, yHairStart1, xHairEnd1+240, yHairEnd1-20);
line(xHairStart1+45, yHairStart1, xHairEnd1+240, yHairEnd1-40);
line(xHairStart1+45, yHairStart1, xHairEnd1+220, yHairEnd1-60);
//line(xHairStart1+45, yHairStart1, xHairEnd1+280, yHairEnd1);



}


