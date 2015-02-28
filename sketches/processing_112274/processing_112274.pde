
size(400,400);
colorMode(HSB,100);
background(99); 
smooth(); 
noStroke(); 

int myDiameter=20; 
int myInterval=40; 
int myRepeat=int(width/myInterval);

int range=3; 

for(int j=0; j<=myRepeat; j++){
  for(int i=0; i<=myRepeat; i++){
    fill(55,random(10,30),99); 
    
    if (j%2==0){ 
      ellipse(i*myInterval+random(-range,range),j*myInterval+random(-range,range),myDiameter,myDiameter);
    }else{
      ellipse(i*myInterval+myInterval/2+random(-range,range),j*myInterval+random(-range,range),myDiameter,myDiameter); 
    }
  }
}


