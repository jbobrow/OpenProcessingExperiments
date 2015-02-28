
//20131030 HorusWang
//Green Green Grass of Home - Practice


void setup(){
  size(500,500);
  background(255);
  smooth();
  noStroke();
  //strokeWeight(0.5);
  //noLoop();
}

int b = 0;
int s = 0;

void draw(){
  
  if(mouseButton==RIGHT){
  noLoop();
  }
 
 
  frameRate(5);
  b += 1;
  if(b > 1){
    b = 0;
    background(255);
  }
  int[] angle = {10,-20};
  rectMode(CENTER);
  for(int x = 10; x < width; x += 10){
    for(int y = 20; y < height; y += 30){
          
      
      
     pushMatrix();
     translate(x,y);
     rotate(radians(angle [round(random(0,1))]));     
     fill(173,255,47,100);
     rect(0,0,random(0,10),random(5,20)); 
      popMatrix();
       

      
    
    }
  }
  s += 1;
  if(s < 100){
    
  }
}



