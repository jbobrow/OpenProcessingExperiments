
void setup(){
  size(640,480);
  background(255);
}

void draw(){
  
  for (int i=0;i<height; i=i+5){
    rect(0,i,i,10);
  }
  
  for(int j=0; j<height; j=j+5){
   
  rectMode(RADIUS);
  rect((height), j, j/2, 10);
  }
}  


