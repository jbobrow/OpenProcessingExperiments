
void setup(){
  size(300,300);
  background(255);
}

void draw(){
  int i;
  int j;
  
  for(i = 1;i <= 5;i++){
    for(j = 1;j <= 5;j++){
      ellipse(i*50,j*50,30,30);
    }
  }
}

