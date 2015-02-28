
    int mida = 100;
    
    int radi = mida/2;
    
   float pX = 250;

     float vX = 6;

  float pY = 150;

   float vY = 1;


  void setup() {
    
  size(600, 300);
  
  rectMode(CENTER);
 
}

  void draw() {
    
  background(255);

  pX = pX + vX;
  pY = pY + vY;
  
  
  if (pX + radi > width) {
    
    vX = -vX;
    pX = width -radi;
  } 
   if (pX-radi <0) { 
    vX = -vX;
    pX = radi;
  }
  
    if (pY + radi > height) {
    
    vY = -vY;
    pY = height -radi;
  } 
   if (pY-radi <0) { 
     vY = -vY;
     pY = radi;
  }
  ellipse(pX, pY,mida,mida);
  
  ellipse(pX, pY,mida,mida);
  
}

  void mousePressed() {
  
  fill(211,21,112);
  if (cambiarColor==true);
  }  
  
  boolean cambiarColor= true;{
   
          
  }


