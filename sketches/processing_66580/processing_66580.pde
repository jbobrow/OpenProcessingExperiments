

int[] myInt = new int[15];
 
void setup(){
  size(500,500);
  for (int i=0; i<15; i++){
    myInt[i]=i*45;
  }
}
 
void draw(){
  smooth();
  background(225);
  for(int i=0; i<15; i++){
     
    ellipse(250,myInt[i],myInt[i] ,30);
  }
  for(int i=0; i<15; i++){
     
    ellipse(myInt[i],250,30 ,500-myInt[i]);
  }
}
