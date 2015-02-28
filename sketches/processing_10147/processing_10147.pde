
float [] r= new float [150];
float [] ballx = new float [150];
float [] bally = new float [150];
float [] diry= new float[150];
float [] dirx= new float[150];
void setup(){
   size(400,400);
  
  smooth();
  for (int i=0; i<ballx.length; i++){
    ballx[i]=(random(width));
      bally[i]=(random(height));
      diry[i]=random(-1,1);
      dirx[i]=random(-1,1);
      r[i]=random(25);
  }
  background(0,100,0);
  strokeWeight(2);
   
  noStroke();
  fill(255,75);
   
  for (int i=0; i<ballx.length; i++){
    ellipse(ballx[i],bally[i],r[i],r[i]);
     
}
}
void draw(){
   background(150);
    
  for (int i=1; i<ballx.length; i++){
  
   if((bally[i]>height) || (bally[i]<0 )){
   diry[i]=diry[i]*-1;
    
   
   }
   if((ballx[i]>width) || (ballx[i]<0)){
   dirx[i]=dirx[i]*-1;
    
   
   }
     
 
 bally[i]=  bally[i]+diry[i];
  ballx[i]=  ballx[i]+dirx[i];
  strokeWeight(1);
  stroke(255,75);
   line(ballx[i-1],bally[i-1],ballx[i],bally[i]);
   noStroke();
  fill(0);
 
 ellipse(ballx[i],bally[i],r[i],r[i]);
}
}

