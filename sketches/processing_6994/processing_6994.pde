

float [] r= new float [150];
float [] ballx = new float [150];
float [] bally = new float [150];
float [] diry= new float[150];
float [] dirx= new float[150];
void setup(){
   size(255,255);
 
  smooth();
  for (int i=0; i<ballx.length; i++){
    ballx[i]=(width/2);
      bally[i]=(height/2);
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
   background(75,150,100);
   
  for (int i=0; i<ballx.length; i++){
 
   if((bally[i]>height) || (bally[i]<0 )){
   diry[i]=diry[i]*-1;
   
  
   }
   if((ballx[i]>width) || (ballx[i]<0)){
   dirx[i]=dirx[i]*-1;
   
  
   }
    

 bally[i]=  bally[i]+diry[i]; 
  ballx[i]=  ballx[i]+dirx[i];
  fill(255,125);
 ellipse(ballx[i],bally[i],r[i],r[i]);
}
}


