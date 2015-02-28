
void setup(){
  size(300,300);
}
void draw(){
  background(255);
  
  for(int i=0; i<width; i=i+30){
    for(int j=0;j<height; j=j+48){
      
      fill(0);
      
      rect(i,j,30,40);
    }
  }
}
