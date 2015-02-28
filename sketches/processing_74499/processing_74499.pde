
int d = 100;
int xPos1 = 0;
int directionX1 = 1;

int xPos2 = 10;
int xPos3 = 35;
int c = 15;
int directionX2 = 1;
int directionX3 = 1;


void setup(){
  size (400, 400);
  smooth();
}

void draw(){
  background (255);
  
  //palla blu
  noStroke();
  fill(0,0,255);
  ellipse(xPos1, height/2, d, d);
  xPos1 = xPos1 + directionX1;
  if (xPos1 > height - d/2){
    directionX1 = -1;
  }
  if (xPos1 < d/2){
    directionX1 = 1;
  }
  
  //occhi palla blu
  fill(0);
  ellipse(xPos2, 180, c, c);
  xPos2 = xPos2 + directionX2; 
  if(xPos2 > height-10 - d/2){
    directionX2 = -1;
  }
  if(xPos2 < d/2  - 10){
    directionX2 = 1;
  }
  
  ellipse(xPos3, 180, c, c);
  xPos3 = xPos3 + directionX3;
  if(xPos3 > height-10 - d/4){
    directionX3 = -1;
  }
  if(xPos3 < d/2 + 15){
   directionX3 = 1;
  } 
  
 if (mousePressed){
  background(255, 255, 0);
  
  //palla blu
  noStroke();
  fill(0,0,255);
  ellipse(xPos1, height/2, d, d);
  xPos1 = xPos1 + directionX1;
  if (xPos1 > height - d/2){
    directionX1 = -5;
  }
  if (xPos1 < d/2){
    directionX1 = 5;
  }
  
  //occhi palla blu
  fill(0);
  ellipse(xPos2, 180, c, c);
  xPos2 = xPos2 + directionX2; 
  if(xPos2 > height-10 - d/2){
    directionX2 = -5;
  }
  if(xPos2 < d/2  - 10){
    directionX2 = 5;
  }
  
  ellipse(xPos3, 180, c, c);
  xPos3 = xPos3 + directionX3;
  if(xPos3 > height-10 - d/4){
    directionX3 = -5;
  }
  if(xPos3 < d/2 + 15){
   directionX3 = 5;
  } 
 } 
  
  
}
