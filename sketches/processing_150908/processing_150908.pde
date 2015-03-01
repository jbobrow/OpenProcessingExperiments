

/**
 Creative Coding, (c)2014 Monash University,
 by Seamus Bradley, based on example code by Indae Hwang and Jon McCormack
**/
void setup(){
   size(600, 600);
   rectMode(CENTER);
   noStroke();
   frameRate(0.5);
}

void draw(){
  background(180);
  fill(200, 50, 50);
  
    
  float cellsize = 100;
  int gap = 10;
  int num = 25;

  for(int i = 0; i < sqrt(num); i++){
    for(int j = 0; j < sqrt(num); j++){
      int offsetX = (int) random(3, 12);
      int offsetY = (int) random(3, 12);
      if(num%getOdd(num)==0){
        fill((int)random(100, 150), 70, 70);
       rect((cellsize + cellsize*i)-getOdd(offsetX), (cellsize + cellsize*j)+getOdd(offsetY), cellsize-gap, cellsize-gap); 
      }else{
         fill((int)random(150, 180), 50, 50);
        rect((cellsize + cellsize*i)+getOdd(offsetX), (cellsize + cellsize*j)-getOdd(offsetY), cellsize-gap, cellsize-gap);
      }  
    }
  } 
  
}

int getOdd(int num){
 return (int)random(1, num); 
}
