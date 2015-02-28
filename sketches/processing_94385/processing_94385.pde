
void setup(){
  size(200,200);
  background(255);
}

void draw(){
  for(int x=0; x<200; x+=15){
    rect(x,90,4,4);
    rect(x,105,4,4);
    rect(105,x,4,4);
    rect(90,x,4,4);
  }
}


