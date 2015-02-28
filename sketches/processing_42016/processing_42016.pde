
float size = (60); 
float ball = (30);  
float xposA, yposA;       
float xposB, yposB;
int back = (125);
int r = (0);
int g = (0);
float b = random(253);


float xspeedA = (5);  
float yspeedA =  (5);  

float xspeedB = (3);
float yspeedB = (3);

int xdirectionA = 1;  
int ydirectionA = 1;  

int xdirectionB = 1;
int ydirectionB = 1;

void setup() 
{
  size(500, 500);
  noStroke();
  frameRate(60);
  smooth();
  
  xposA = width/2;
  yposA = height/2;
  xposB = width/2 + 50;
  yposB = width/2 + 50;
}

void draw() 
{
  background (r, g, b);
  
  
  
  xposA = xposA + ( xspeedA * xdirectionA );
  yposA = yposA + ( yspeedA * ydirectionA );
  
  xposB = xposB + ( xspeedB * xdirectionB );
  yposA = yposA + ( yspeedB * ydirectionB );
  
 
  if (xposA > 500-60 || xposA < 0) {
    xdirectionA *= -1;
  }
  if (yposA > 500-60 || yposA < 0) {
    ydirectionA *= -1;
  }
  
   if (xposB > 500-ball || xposB < 0) {
    xdirectionB *= -1;
  }
  if (yposB > 500-ball || yposB < 0) {
    ydirectionB *= -1;
  }

//color of bkgd
 if (xposB > 500-ball || xposB < 0) {
   r = r + 10;
  }
 if (xposB > 500-ball || xposB < 0) {
   g = g + 7;
  }
if (xposB > 500-ball || xposB < 0) {
   b = b +1 ;
  }

  
  ellipse(xposA+size/2, yposA+size/2, size, size);
  ellipse(xposB+ball, yposB+ball, ball, ball);
}

//  still needing to figure out why 1st ball dissappears

/* FIRST ATTEMPT

float r =  random (0, 255);
float g = random (0, 255);
float b = random (0, 255);
float a = random (0, 255);

int diam1 = RADIUS * 2;
int diam2 = RADIUS * 2;
int diam3 = RADIUS * 2;

float x1 = random;
float y1 = random;
float x2 = random;
float y2 = random;
float x3 = random;
float y3 = random;

int velocityX1;
int velocityY1;
int velocityX2;
int velocityY2;
int velocityX3;
int velocityY3;

void setup () {
  size (500, 500);
  background (random (10, 240));
  noSmooth ();
  
  //velocities
  //  e.g. X is velocityx = int(random(-40, 40));
 // Y is velocityy = int(random(-20, 20));
velocityX1 = int (random (-30, 30));
velocityY2 = int (random (-20, 20));
//float  for 2
velocityX2 = float (random (-30, 30));
velocityY2 = float (random (-30, 30));
//int for 3
velocityX3 = int (random (-30, 30));
velocityY3 = int (random (-30, 30));

}

void draw() {
  //variables to ellipse1
  x1 = random ;
  y1 = random ;
  stroke (2);
  fill (r, g, b, a);
  ellipse (x1, y1, radius, radius);
  if (x1 > width - radius || x < radius); 
 velocityX1 = velocityX1 * -1;
}

if (y1 > height - radius || y < radius);
 velocityY1 = velocityY1 * -1;
}

} */

