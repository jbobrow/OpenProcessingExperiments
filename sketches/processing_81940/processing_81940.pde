

int r=0;
int end=565;
int alphaC=255;

int sizeB=100;
int sizeM=97;
int sizeT=80;
int sizeP=82;


void setup(){
  size(650,650);
  background(0);
  smooth();
  
  
}

void draw(){
  
  
  
  //grow out circle
  pushMatrix();
 
    
  
  fill(0);
  stroke(185,229,255,alphaC);
  
  strokeWeight(4);
  ellipse(325,325,r,r);
  r+=4.5;
  
  
  
  if(r>320){
    alphaC-=3;
  }
  
  if(alphaC==-720){
    r=0;
    alphaC=255;
  }
  popMatrix();
  
 
 
 // the center Based circle 
 fill(255,236,21);
 ellipse(width/2,height/2,sizeB,sizeB);
 noStroke();
 
 // Poping! Basement.
 if(r<255){
  sizeB-=4;
  if(r<200){
  sizeB+=5;
}
if(sizeB<95){
  sizeB=100;
}
}

 // the center Middle circle
 
 fill(16,51,124,240);
 ellipse(width/2,height/2,sizeM,sizeM);
 noStroke();
  
 // Poping! Middle.
 if(r<255){
  sizeM-=4;
  if(r<200){
  sizeM+=5;
  }
  if(sizeM<92){
    sizeM=97;
  }
 } 
 
  
 // the center Top circle
 
 fill(255,255,142);
 ellipse(width/2,height/2,sizeT,sizeT);
 noStroke();
 
 // Poping! Top.
 if(r<255){
  sizeT-=4;
  if(r<200){
  sizeT+=5;
  }
  if(sizeT<75){
    sizeT=80;
  }
 }
 
 // growing pizza time
 
 int s = second();
 
 fill(27,76,155);
 translate(width/2,height/2);
 
 pushMatrix();
 

 rotate(radians(6*s));
 arc(0,0,sizeP,sizeP,0,radians(20));
 
 // Poping! Pizza!
 if(r<255){         
  sizeP-=4;
  if(r<200){
  sizeP+=5;
  }
  if(sizeP<77){
    sizeP=82;
  }
 }
 
 popMatrix();

} 

    


