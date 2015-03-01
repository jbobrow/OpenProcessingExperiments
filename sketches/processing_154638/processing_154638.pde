
//Claire Sheen (csheen)
//Copyright 7.8.14

float crosWd, crosHt, crosX, crosY, crosDx, crosDy;//croissant values
float chicWd, chicHt, chicX, chicY;//chicken values
float distance;
PImage croissant, chicken;

void setup()
{
  size (700, 500);
  frameRate(60);
  smooth();
  noStroke();
  crosHt = 50;
  crosWd = 100;
  crosX = 0;
  crosY = 0;
  crosDx = 10;
  crosDy = 6;
  imageMode( CENTER );
  croissant = loadImage("transparentcroissant.png");
  
  chicWd = chicHt= 300;
  chicX = 400;
  chicY = 200;
  imageMode( CENTER );
  chicken = loadImage("chicken.png");
  
}

void draw()
{
  distance = dist(crosX, crosY, chicX, chicY);//distance between croissant and chicken!
  background(0);//black background
  
  //croissant values
  crosX = crosX + crosDx;
  crosY = crosY + crosDy;
  
  //chicken values
  chicX = chicX - 10;
  chicY = chicY - 5;
 
  
 if(crosX < 0 || crosX > 700)//if it hits the left or right wall
  {
    crosDx = -crosDx;//reverse horizontal speed
    crosX = crosX + crosDx;//restore motion so it doesn't shake
  }
  
 if(crosY < 0 || crosY > 500)//if it hits the top or bottom wall
 {
    crosDy = -crosDy;//reverse vertical speed
    crosY = crosY + crosDy;//restore motion so it doesn't shake
 }
 
 if(chicX < -0.5*chicWd)
  {
    chicX = width+0.5*chicWd;
  }
  
  if(chicY < -0.5*chicHt)
  {
    chicY = height+0.5*chicHt;
  }
  
  if(distance > 100)
  {
   image(croissant, crosX, crosY, crosWd, crosHt);
   image(chicken, chicX, chicY, chicWd, chicHt);
  }
  else
  {
    fill(244, 255, 288);
    rect(0, 0, 700, 500);
  }
}




