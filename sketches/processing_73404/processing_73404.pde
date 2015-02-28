
//Assignment #3
//Caroline Day
//ceday@brynmawr.edu
//CS 110 - 01
//October 5, 2012


//define variables

float x= 350;
float y = 315;

float r= 250;
float g= 300;
float b = 265;


float m = 1;
float speed = .001;
float gravity = 1;

//setup and background
void setup ( ) {
  size (500,500);
 background (0,0,255);
 smooth ( );
 fill(0, 150, 0);
 rectMode (CORNER);
 rect (0,250,500,250);
 fill (255);
 ellipse (50,50, 100,50);
 ellipse (300, 50, 75,50);
}
//defining functions
void draw ( ) {
  drawFlower1 ( );
 drawFlower2 ( );
 drawLeaves ( );
}

//drawFlower1
void drawFlower1 ( ) {
//draw stem
strokeWeight(3);
stroke( 0,100,0);
line (75,400, 75, 300); 
//draw petals
noStroke ( );
fill(255,0,0);
ellipseMode (CENTER);
ellipse (75,250,70,115);
triangle (45,250,45,170,75,250);
triangle (50,250,75,170,100,250);
triangle (75,250,100,250,100,170);

}
//call function drawFlower
void drawFlower2 ( ) {
//draw stem
stroke (0,100,0);
strokeWeight (3);
fill (0, 150,0);
line (300, 400, 300, 325);
//draw petals
fill(0);
noStroke ( );
ellipseMode (CENTER);
ellipse (300,315,30,30);
fill(255,0,100);
ellipse (350,315, 70, 50);
ellipse (300,265,50,70);
ellipse (250,315,70,50);
}

//draw leaves
void drawLeaves ( ) {
//make petals appear
  if (mouseX<=100 && mouseY>=350) {
  fill(0,50,0);
 ellipse(100,350,50,25);
  ellipse (50,350,50,25);
  }
  //move petals by click of mouse
if (mousePressed) {
  noStroke ( );
   fill (random (0,255), random (0,255), random (0,255));
   ellipse (x,y, 70, 50);
ellipse (g,b,50,70);
ellipse (r,y,70,50);

 y= b;
 
  y = y + speed;
  speed= speed + gravity;
  

  if (y < (height-350)) {
    speed = speed * -.09;
   
  }
  if ((x > width) || (x < 0)) {
    m = m * -1;
  }

  }

}
