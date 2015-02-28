

float xPos;
float yPos;
float xSpeed;
float ySpeed;



void setup() {
  size (400, 147);
  background (0, 0, 0);
  smooth();
  xPos = width/2;
  yPos= height/2;
  xSpeed = random(-1, 1)*10;
  ySpeed = random(-1, 1)*10;
  fill (100,0,0);
  ellipse (xPos, yPos, 20, 20);
  
 
  
}

void draw() {
  background (0, 0, 0);
   PImage a;
   a = loadImage("eyes00.jpg");
   background(a);
   smooth();
  ellipse (xPos, yPos, 20, 20);


  xPos = xPos + xSpeed;

   if (xPos > 390) {
   xSpeed = (-1) * xSpeed;
   fill (0,100,0);
   ellipse (xPos, yPos, 20, 20);
   PImage b;
   b = loadImage("eyes02.jpg");
   background(b);
  } 
   else if (xPos < 10) {
   xSpeed = (-1) * xSpeed;
   fill (100,100,0);
   ellipse (xPos, yPos, 20, 20);
   
   PImage c;
   c = loadImage("eyes01.jpg");
   background(c);
  }  
  
  
  yPos = yPos + ySpeed;
   
   if (yPos > 137) {
    ySpeed = (-1) * ySpeed;
   fill (100,120,100);
   ellipse (xPos, yPos, 20, 20);
   
   PImage d;
   d = loadImage("eyes03.jpg");
   background(d);
  } 
  else if (yPos < 10) {
    ySpeed = (-1) * ySpeed;
     fill (150,50,150);
     ellipse (xPos, yPos, 20, 20);
    
     PImage d;
     d = loadImage("eyes03.jpg");
     background(d);
  }
}

//  xSpeed = xSpeed + 1;










