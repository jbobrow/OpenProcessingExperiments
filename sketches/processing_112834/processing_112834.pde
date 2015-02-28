
float xPos1;
float yPos1;
float xPos2;
float yPos2;
float speed1;
float speed2;

void setup(){
 size(200,200); 
 xPos1 = 0;
 yPos1 = 10; 
 xPos2 = 0;
 yPos2 = 100;
 speed1 = 1;
 speed2 = 2;
}

void draw(){
 background(255);

  stroke(0);
  fill(255,0,0);
  rect(xPos1,yPos1,20,10);
  
  xPos1 = xPos1 + speed1;
  if(xPos1>width){
    xPos1 = 0;
  }
  
  stroke(0);
  fill(0,255,0);
  rect(xPos2,yPos2,20,10);
  
  xPos2 = xPos2 + speed2;
  if(xPos2>width){
    xPos2 = 0;
  }
   
}


