
//variables//

float eX = random(0,400);
float eY = random(0,800);
int speedX = 7;
int speedY = 5;

int sizeE = 20; 


//execute once, at program launch//

void setup(){
 
 size(500,900);
 smooth();
 frameRate(120);
 }




//execute repetitively until application closes//

void draw(){
  background(125,125,250);
  fill(125,250,100);
  noStroke();
  ellipse(eX, eY, sizeE, sizeE);

  
  
//moving the cirlce//

  eX = eX + speedX;
  eY = eY + speedY;
  
  if(eX >= width || eX <= 0){
     speedX= -speedX;
  
  }
  
  else if(eY >= height || eY <= 0){
   speedY = -speedY;
  
  }
  }


