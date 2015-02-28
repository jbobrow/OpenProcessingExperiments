
void setup(){
  size(1050,100);
  background(255);
}

void draw(){
  int i;
  for(i = 1;i <= 20;i++){
    if(i%3 == 0){
      fill(255,0,0);
      ellipse(50*i,50,20,20);
    }
    if(i%5 == 0){
      fill(0,0,255);
      ellipse(50*i,50,20,20);
    }
    if(i%3 == 0 && i%5 == 0){
      fill(200,0,255);
      ellipse(50*i,50,20,20);
    }
    else{
      noFill();
      ellipse(50*i,50,20,20);
    }
  }
}

