
int mida = 60;
int radi = mida/2;
float pX = 600;
float vX = 6;
float pY = 400;
float vY = 4;

void setup() {
  size(600, 400);
  pX = width;
  pY = height;
  vX = 6;
  vY = 4;
  background(195,243,247);

}

void draw() {
  

  pX = pX + vX;
  pY = pY + vY;
  // eix x
  if (pX + radi > width) {

    vX = -vX;
    pX = width -radi;
  } 
   if (pX-radi <0) { 
    vX = -vX;
    pX = radi;
  }
  //eix y
    if (pY + radi > height) {
    //pX = 0;
    vY = -vY;
    pY = height -radi;
  } 
   if (pY-radi <0) { 
     vY = -vY;
    pY = radi;
  }
 
    //bola
     
fill(pX-mida, pY-mida, mida, mida);
strokeWeight(1);
stroke(pX, pY, width, height);

  ellipse(pX, pY, mouseY/2, mouseX/2);
  
}




 



 




