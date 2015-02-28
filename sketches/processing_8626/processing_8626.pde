
int y=0;
int speed=1;

void setup(){
  size(600,600);
  smooth();
}

void draw(){
  background(255);

  fill(0);
  speed=speed+2;

  
   for(int y= -500 ; y< 3000 + 50; y +=50){
  
  for(int x= -500; x< 3000 + 50; x +=50){
    


  
  drawellipse(x,y,30,30);
  
  
 
  if(keyPressed){

    
    
  float r = random(0,10);
  float g = random(0,255);
  float b = random(0,10); 



    


  drawellipse(x+speed,y,30,30);  
  drawellipse(x-speed,y,30,30); 
  
  drawellipse(x,y+speed,30,30);  
  drawellipse(x,y-speed,30,30); 
 

  }

 
  
  }
  
  }
  
  
 
}

void drawellipse (int cx, int cy, int cx2, int cy2){
    noStroke();
    ellipse(cx,cy,cx2,cy2);
    
}



