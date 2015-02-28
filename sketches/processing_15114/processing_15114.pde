
void setup(){
  size(200,200);
}
void draw(){
  for(int a=20; a<190; a=a+10){
    for(int b=20; b<190; b=b+10){
      ellipse(a,b,5,5);
      fill(0);
      rect(50,50,100,100);
    }
  }
}

                
                
