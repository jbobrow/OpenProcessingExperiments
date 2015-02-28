
void setup(){
  size(600,600);
  background(0);
  noLoop();
}

void draw(){
  
  for(int i = 20; i<width; i=i+80){
   for(int j = 20; j<height; j=j+80){
    rect(i,j,20,100);
   }
  }
} 
