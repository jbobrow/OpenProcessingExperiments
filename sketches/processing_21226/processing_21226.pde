
//Rembrant skech by computer

PImage type;
float x,y,prevX,prevY;


void setup(){
  colorMode(HSB,360,100,100);
  size(600,743);
  smooth();
  background(0,0,100);
  strokeWeight(.5);
   type = loadImage("rem.jpg");
    prevX=0;prevY=0;  
  
   for(int i = 0; i < 100000000; i++){   //times the cumputer runs
     x = random(width);
     y = random(height);
     
     
    
     color cp = type.get(int(x),int(y));
     color cpPrev = type.get(int(prevX),int(prevY));
   
   float b = brightness(cp);
   float bPrev = brightness(cpPrev);
 
  if(b < 25 && bPrev < 80 && dist(x,y,prevX,prevY) < 30){  // alter this to get different results
    line(x,y,prevX,prevY);
 
   }
  
  prevX = x;
  prevY = y;
 }
}

