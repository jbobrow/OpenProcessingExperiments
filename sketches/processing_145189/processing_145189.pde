
// VARIABLES

float posY;
float posX;
float velY;
float velX;
float rad;
float velIniX;
float velIniY;
color colorBola;

void setup(){
  
  size (500,500);
  colorMode(HSB);
  
  // SET VARIABLES
  

  colorBola = int(random(0,255));
  
  posY = width/2;
  posX = height/2;
  
  velIniX = random(5,20);
  velIniY = random(5,20);
  
  velX = random(-velIniX,velIniX);
  velY = random(-velIniY,velIniY);
  
  rad = random(10,150); 
  
  // COLOR BOLA
  
  stroke(colorBola,200,200);
  
}

void draw(){
  
  // CLEANER
  fill(128,128,128,30);
  rect(0,0,width,height);
  
  
    
   
    
  // BOLA
  ellipse(posX,posY,rad,rad);
  
  
  
  
  // REBOTINGS
  
  if(posY < 0+rad/2){
   velY = velY *-1; 
  }
  
  if(posY > height - rad/2) {
   velY = velY *-1;
  }
  
  if (posX > width-rad/2){
    
   velX = velX *-1; 
  }
  
  if (posX < 0 +rad/2){
   velX = velX *-1; 
  }
  
  // VELOCIDAT
  
  posY = posY + velY;
  posX = posX + velX;
  
  
  
}

