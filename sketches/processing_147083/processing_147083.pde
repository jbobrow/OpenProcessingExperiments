
void setup(){
  size(1000,800);
  noStroke();
 
}
void draw(){
   
  for(int i = 10; i < width ; i=i+10){
    for(int j = 10; j < height ; j=j+10){
     
      fill(i/2,j/2,i/4);
    ellipse(i,j,10,10); 
  
  }
  }
}



