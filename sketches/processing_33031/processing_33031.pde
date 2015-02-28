
float velX = 30;
float velY=30;
float ellipX = 50; 
float ellipY = 50; 
int rad = 35; 
int directionX = 1;
int directionY = 1;
//float ellipX = 50; 
//float ellipY = 50;


void setup() { 
  size(500, 400); 
  background(255, 0, 127); 
  smooth(); 

  frameRate(10);
}


void draw() {
  background(201, 255, 67); 
  ellipse(ellipX, ellipY, rad, rad); 
  stroke(255, 255, 255); 
  fill(67, 255, 231); 


  ellipY= ellipY + velY*directionY; 
  ellipX = ellipX + velX*directionX; 

  if (ellipY >= height) {

    directionY = -1; 
    velY = random(10, 60);
  }

  else if (ellipY <= 0 ) {
    directionY = 1; 
    velY = random(10, 60);
  }


  if (ellipX >=width) {
    directionX = -1; 
    velX = random(10, 60);
  }

  else if (ellipX <=0) {
    directionX  = 1; 
    velX = random(10,60);
  }
}


