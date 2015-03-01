
float aX1=300, aY1=300;
float bX1=300, bY1=300;

float aX=300, aY=600;
float bX=300, bY=600;

boolean DetXa = true;
boolean DetYa = true;

boolean DetXb = true;
boolean DetYb = true;

int count=0;
PImage img;

void setup()
{
  size(600, 600);
  img = loadImage("sun.png");
  frameRate(200 );
}

void draw()
{
  float aVecX = aX - aX1;
  float aVecY = aY - aY1;

  float aVecMag = sqrt(aVecX * aVecX + aVecY * aVecY);
 
  float bVecX = bX - bX1;
  float bVecY = bY - bY1;

  float bVecMag = sqrt(bVecX * bVecX + bVecY * bVecY);
 
  float dotProd = aVecX * bVecX + aVecY * bVecY;
 
  float cosine = dotProd / (aVecMag * bVecMag);
 
  
  background(93 ,0 ,178);
  
  count+=1;
  
  if(count < 500 && cosine > 0 && cosine <= 1)
  {
    if(aX > width) DetXa = false;
    else if(aX < 0) DetXa = true;
    if(DetXa) aX += 1;
    
    stroke(246,255,34);
    strokeWeight(10);
    line(aX1, aY1, aX, aY);
  
    if(bX > 0) DetXb = true;
    else if(bX < 0) DetXb = false;
    if(DetXb) bX -= 1;
  
    stroke(246,255,34);
    strokeWeight(10);
    line(bX1, bY1, bX, bY);
  }
   
  if(count < 1500 && cosine <= 0 && cosine >= -1)
  {
    if(aY > height) DetYa = false;
    else if(aY < 0) DetYa = true;
    if(DetYa) aY -= 1;
    stroke(246,255,34);
    strokeWeight(10);
    line(aX1, aY1, aX, aY);
    if(bY > height) DetYb = false;
    else if(bY < 0) DetYb = true;
    if(DetYb) bY -= 1;
    stroke(246,255,34);
    strokeWeight(10);
    line(bX1, bY1, bX, bY);
  }
  
  if(count > 500 && cosine >= 0 && cosine <= 1)
  {
    if(aX > width) DetXa = false;
    else if(aX < 0) DetXa = true;
    if(DetXa) aX -= 1;
    
    stroke(246,255,34);
    strokeWeight(10);
    line(aX1, aY1, aX, aY);
  
    if(bX > 0) DetXb = true;
    else if(bX < 0) DetXb = false;
    if(DetXb) bX += 1;
  
    stroke(246,255,34);
    strokeWeight(10);
    line(bX1, bY1, bX, bY);
  }
  
   if(count > 1500 && cosine <= 0 && cosine >= -1)
  {
    if(aY > height) DetYa = false;
    else if(aY < 0) DetYa = true;
    if(DetYa) aY += 1;
    stroke(246,255,34);
    strokeWeight(10);
    line(aX1, aY1, aX, aY);
    if(bY > height) DetYb = false;
    else if(bY < 0) DetYb = true;
    if(DetYb) bY += 1;
    stroke(246,255,34);
    strokeWeight(10);
    line(bX1, bY1, bX, bY);
  }
  
  
  if(mousePressed == true)
  {
   if(cosine < -0.99) 
   {
     image(img, 150, 0, 300, 300);
   }   
  }
} 


