
class Shape{
 
 //data
 float[]origVertex = new float[8];
 float[]noises = new float[8];
 float[]drawPoints = new float[8];
 float increment = .01;
 int token;
 float startinc;
 
 
 //constructor
 Shape(float startinc_, color filler_){
  startinc = startinc_;
  fill(filler_);
   for(int i=0;i<origVertex.length;i++){
    if(i%2==0){
     token=width; 
    }else{
     token=height; 
    }
    origVertex[i] = random(token);
  }
 }
 
 void jitter(){
  //generate jitter values
  for(int i=0;i<noises.length;i++){
   noises[i] = noise(i*startinc+increment)*2.;
  }
  //increase perlin noise index
  increment+=.005;
 }
  
 void drawShape(){
  //add jitters and origVertex points together 
  for(int i=0;i<origVertex.length;i++){
   drawPoints[i] = noises[i]*origVertex[i]; 
  }
  //draw points to screen
  quad(drawPoints[0],drawPoints[1],drawPoints[2],drawPoints[3],drawPoints[4],drawPoints[5],drawPoints[6],drawPoints[7]);
 }
}

