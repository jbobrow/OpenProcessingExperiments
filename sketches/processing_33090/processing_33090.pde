

float xPos;
float yPos;
float xSpeed;
float ySpeed;



void setup() {
  size (400, 400);
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
  smooth();
  ellipse (xPos, yPos, 20, 20);


  xPos = xPos + xSpeed;

   if (xPos > 390) {
   xSpeed = (-1) * xSpeed;
   fill (0,100,0);
   ellipse (xPos, yPos, 20, 20);
  } 
   else if (xPos < 10) {
   xSpeed = (-1) * xSpeed;
   fill (100,100,0);
   ellipse (xPos, yPos, 20, 20);
  }  
  
  
  yPos = yPos + ySpeed;
   
   if (yPos > 390) {
    ySpeed = (-1) * ySpeed;
   fill (100,120,100);
   ellipse (xPos, yPos, 20, 20);
  } 
  else if (yPos < 10) {
    ySpeed = (-1) * ySpeed;
     fill (150,50,150);
     ellipse (xPos, yPos, 20, 20);
  }
}

//  xSpeed = xSpeed + 1;










