
void setup(){
  size(500,500);
}

void draw(){
  background(10,125,250);
  
  for(int i=0; i<600; i = i + 30){
  for(int j=0; j<600; j = j + 100){
    fill(0,i,j);
    triangle(i-10,j+20,i,j-6,70,i-20);
    
    fill(10,i,j,15);
    ellipse(j,j,500,i);
   
   
  }
  }
}

