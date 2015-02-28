

//Nick Tanzman
 
int xOne, yOne;
int xTwo, yTwo;
int xThree, yThree;
int xFour, yFour;
int xFive, yFive;

float deg;

PImage img;

void setup() {
 
 
 img = loadImage("image3.png");
  
 size(600,600);
 background(255);
 
 xOne = -100;
 yOne = -200;

 xTwo = -175;
 yTwo = 100;

 xThree = 100;
 yThree = -130;

 xFour = 100;
 yFour = 50;
 
 xFive = -30;
 yFive = -30;
 
 deg = 0.0;
 
 image(img,0,0);
}

void draw() {

  

  translate(width/2,height/2);

  if (mousePressed) {
 deg+=0.5;
 float rad = radians(deg);
 rotate(rad);
  
 
   
 ellipse(xOne,yOne, 15, 15);
 ellipse(xTwo,yTwo, 30, 30);
 ellipse(xThree,yThree, 45, 45);
 ellipse(xFour,yFour, 60, 60);
 ellipse(xFive,yFive, 75, 75);
 fill(255,0,0);
  }
}


