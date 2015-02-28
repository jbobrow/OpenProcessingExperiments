
/*

Liz Rutledge
Day 5 In-Class—MAKE THINGS MOVE!
August 5, 2011

*/

PImage sweetElephant;
float xPos = 100;
float yPos = 100;
int elephantRadius=80;
boolean isGoingRight = true;
boolean isGoingDown = true;


void setup(){
  size(800,600);
  background(0);

  sweetElephant = loadImage("elephant.png");
  sweetElephant.resize(elephantRadius*2,elephantRadius*2);
  
  imageMode(CENTER);
}

void draw(){
  noStroke();
  background(0);
//  pushMatrix();
//  scale(.3);
  image(sweetElephant, xPos, yPos);
//  popMatrix();
  
  
  
  //fill( R, G, B, opacity out of 255);
  fill(255,255,255, 100);
  rect(100, 100, 100, 100);

//always moving down one pixel at a time
 //




 // X POSITION 
  if(isGoingRight){
    // xPos = xPos + 3;
    xPos+=3;
  }
  else {
    // xPos = xPos - 3;
    xPos-=3;
  }
  
 
  if(xPos + elephantRadius >= width){
     isGoingRight = false;
  }
  
  if(xPos - elephantRadius <= 0) {
     isGoingRight = true; 
  }
  


//Y POSITION
  if(isGoingDown){
    // yPos = yPos + 3;
    yPos+=3;
  }
  else {
    // yPos = yPos - 3;
    yPos-=3;
  }
  
 
  if(yPos + elephantRadius >= height){
     isGoingDown = false;
  }
  
  if(yPos - elephantRadius <= 0) {
     isGoingDown = true; 
  }


  
}

