
void setup(){
  size(300,300);
  background(255);
}

void draw(){
  int i;
  int j;
  
  for(i = 1;i <= 5;i++){

    for(j = 1;j <= 5;j++){
      if(i == 3 && j == 3){
        fill(255,255,0);
        ellipse(i*50,j*50,30,30);
      }     
      else if(j%2 == 0){
        fill(0,0,255);
        ellipse(i*50,j*50,30,30);
      }
      else{
        fill(255,0,0);
        ellipse(i*50,j*50,30,30);
      }
    }
  }
}

