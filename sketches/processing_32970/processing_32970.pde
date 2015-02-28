
/* Tarea - 08 Agosto 
 representation of a bouncing ball, plus image */

boolean isGoingRight = true;
boolean isGoingLeft = true;
float xPos = 0;
float yPos = 0;
float xLPos = 900;
float yLPos = 0;
float xIPos = 0;
float yIPos = 0;
PImage myImage;



void setup() {
  size(900, 600);
  background(0);
  myImage = loadImage("letras.jpg");
}


void draw() {

  background(0);




  fill(184, 173, 117, 255); 
  rect(xPos - 900, yPos, 900, 20);


  if (isGoingRight) {
    xPos+=3;
  }

  else {
    xPos-=3;
  }


  if (xPos  >= width) { 
    isGoingRight=false;
  }


  if (xPos  <= 0) { 

    isGoingRight=true;
  }


  image(myImage, xLPos, yLPos + 25);


  if (isGoingLeft) {
    xLPos-=3;
  }

  else {
    xLPos+=3;
  }

  if (xLPos  >= width) { 
    isGoingLeft=true;
  }


  if (xLPos <= 0) { 

    isGoingLeft=false;
  }


  fill(94, 41, 82, 255); 
  rect(xPos - 900, yPos + 50, 900, 20);

  image(myImage, xLPos, yLPos + 75);


 fill(171, 92, 152, 255); 
  rect(xPos - 900, yPos + 100, 900, 20);

  image(myImage, xLPos, yLPos + 125);
  
   fill(53, 120, 119, 255); 
  rect(xPos - 900, yPos + 150, 900, 20);

  image(myImage, xLPos, yLPos + 175);

image(myImage, xPos - 900, yPos + 200);

 fill(121, 247, 246, 255); 
  rect(xLPos, yLPos + 225, 900, 20);
  
  image(myImage, xPos - 900, yPos + 250);

 fill(211, 247, 246, 255); 
  rect(xLPos, yLPos + 275, 900, 20);
  
  image(myImage, xPos - 900, yPos + 300);

 fill(211, 247, 246, 255);  
  rect(xLPos, yLPos + 325, 900, 20);
  
  image(myImage, xPos - 900, yPos + 350);
  

 fill(121, 247, 246, 255); 
  rect(xLPos, yLPos + 375, 900, 20);

 fill(53, 120, 119, 255); 
  rect(xPos - 900, yPos + 400, 900, 20);


  image(myImage, xLPos, yLPos + 425);

 fill(171, 92, 152, 255); 
  rect(xPos - 900, yPos + 450, 900, 20);

  image(myImage, xLPos, yLPos + 475);


 fill(94, 41, 82, 255); 
  rect(xPos - 900, yPos + 500, 900, 20);

  image(myImage, xLPos, yLPos + 525);
  
   fill(184, 173, 117, 255); 
  rect(xPos - 900, yPos + 550, 900, 20);

  image(myImage, xLPos, yLPos + 575);



}


