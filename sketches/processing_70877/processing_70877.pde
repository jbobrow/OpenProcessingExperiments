
void setup(){
  size(500,500);
  background(0);
  noStroke();
  smooth();
}

void draw(){
  for(int i = 0; i <= 3; i++){
    for(int j = 0; j <= 3; j++){
      int x = 1;
      for(int k = 10; k > 0; k--){
        if (x==1){
          x = 0;
          fill(255,0,0);
        } else {
          x = 1;
          fill(255,255,255);
        }
        ellipse(100+i*100,100+j*100,k*8,k*8);
      }
    }
  }
}
