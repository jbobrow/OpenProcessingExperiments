
//Week 3 Homework
//Graham Strang
float x;
float y;
float directionX;
float directionY;
float z;
float w;
float directionZ;
float directionW;


void setup(){
  size(700, 700);
  smooth();
  background(255);
  frameRate(30);
  x = 0;                            // variable set
  y = 0;
  directionX = 5;
  directionY = 5.5;
  z = width;                            // variable set
  w = height;
  directionZ = -5;
  directionW = -5.5;
  
}

void draw(){

 
 x += directionX;                  //setup of line vertex motion
 y += directionY;
 z += directionZ;                  //setup of line vertex motion
 w += directionW;
 
 if (x > width){                   //color and direction changes
   directionX = -5;
   stroke(255,0,0,10);
  
 }
 if (y > height){
   directionY = -5.5;
   stroke(0,255,0,10);
 }
 if (x <  0){
   directionX = 5;
   stroke(0,0,255,10);
 }
 if (y < 0){
   directionY = 5.5;
   stroke(0,0,0,10);
 }
 
 if (z > width){                   //color and direction changes
   directionZ = -5;
  
 }
 if (w > height){
    directionW = -5.5;
    
    
 }
 if (z <  0){
   directionZ = 5;
  
 }
 if (w < 0){
   directionW = 5.5;
  
 }
 
  for (int i = 0; i <= width; i += width/4){      //lines
    for(int j = 0; j <= height; j += width/4){
      strokeWeight(1);
      line(i, j, x, y);
    }
  }
  for (int l = 0; l <= width; l += width/4){      //lines
    for(int k = 0; k <= height; k += width/4){
      strokeWeight(1);
      line(l, k, z, w);
    }
  }
  //ellipse(x+random(-10,10), y+random(-10,10),5,5);
}

