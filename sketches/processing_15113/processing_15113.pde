
void setup(){
  size(200,200);
}

void draw(){
  for(int a=10; a<200; a=a+10){
    for(int b=10; b<200; b=b+10){
      fill(0);
      noStroke();
     ellipse(a,b,5,5);
     fill(255);
     rect(45,45,110,110);
    }
  }
}
