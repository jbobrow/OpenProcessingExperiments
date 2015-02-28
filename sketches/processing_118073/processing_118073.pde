


float b;
int k;

void setup(){
  size(600,700);
  //background(y,x,100,x);
  
  frameRate (30);
}
void draw(){
  b+=200;
  k+=1000;
  
for (int i = 0; i < 600; i = i+10) {
  for (int j = 0; j < 700; j = j+5) {
 fill(b,k,123,50);
 ellipse(i,j,b,j);
     
      if(b > 900){
        b=-k;
  }
} 
}
}


