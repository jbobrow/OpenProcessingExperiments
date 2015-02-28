
int mida = 3;
int radi = mida/2;
float pX = 500;
float vX = 2;
float pY = 500;
float vY = 1;



void setup() {
  size(500, 500);
  stroke(0,255,255);
  pX = width;
  pY = height;
  vX = 2;
  vY = 1;
  noStroke();
  fill(255,32);
  
  
}
void draw() {
  background(0);
  
  for (int i = 0; i < width; i+=5) {
    float mida = random(i);
    ellipse(i-mouseY, i-mouseY,mida,mida);
  }
  
 for (int i = 0; i <= height; i = i + 20) { 
 dibuix_fons (0,0);
//    //línees puntes
//    line(0,0,width,i);
//    line(width,height,0,i);
//    line(width,0,i,height);
//    line(0,width,i,0);
    
    actualitzarelement(i);
    
//    pX = pX + vX;
//    pY = pY + vY;
//    
//  // eix x
//  if (pX + radi > width) {
// 
//    vX = -vX;
//    pX = width -radi;
//  }
//   if (pX-radi <1) {
//    vX = -vX;
//    pX = radi;
//  }
//  
//  //eix y
//    if (pY + radi > height) {
//    //pX = 0;
//    vY = -vY;
//    pY = height -radi;
//  }
//   if (pY-radi <1) {
//     vY = -vY;
//    pY = radi;
//  }
  
  posicionarelement (pX[i],pY[i]);
//    //1 boles boges
//    fill(pX, pY, mida, mida);
//
//    strokeWeight(1);
//    stroke(pX, pY, width, height);
//    ellipse(pX, pY, width, height);

    
  }
}

void dibuix_fons (int x, int y){
  
//    //línees puntes
    line(0,0,width,i);
    line(width,height,0,i);
    line(width,0,i,height);
    line(0,width,i,0);
}

void actualitzarelement (int i) {
      pX = pX + vX;
    pY = pY + vY;
    
  // eix x
  if (pX + radi > width) {
 
    vX = -vX;
    pX = width -radi;
  }
   if (pX-radi <1) {
    vX = -vX;
    pX = radi;
  }
  
  //eix y
    if (pY + radi > height) {
    //pX = 0;
    vY = -vY;
    pY = height -radi;
  }
   if (pY-radi <1) {
     vY = -vY;
    pY = radi;
  }
}
void posicionarelement (float pX,float pY){
//1 boles boges
    fill(pX, pY, mida, mida);

    strokeWeight(1);
    stroke(pX, pY, width, height);
    ellipse(pX, pY, width, height);
}


