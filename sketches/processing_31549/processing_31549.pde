
float x=10;
float y=0;
  float L=250;
  float E=250;
  float R=0;

void setup(){
 
 background(0,9,120);
 size(500,500);
 smooth();
 strokeWeight(1);
 
}

void draw(){
 
  noStroke();
  fill(0,12,31,50);
  ellipse(0,250,250,250);
  
  fill(0,12,175,100);
  ellipse(100,150,150,150);
  
  stroke(0);
  while(y<50)
  {
    strokeWeight(y);
  line(y*x,0,y*x,500);
  y =y+1;
  }
  
  
  
   stroke(0,13,45,150);
   strokeWeight(3);
   noFill();
   
    ellipse(400,100,L,E);
    L=L+20;
     
   
    
 
}

 
  


