
void setup(){
  size(200,200);
  background(0);
}
void draw(){
stroke(180,180,250);
  for(int x=0; x<200; x+=15){
    rect(x,100,5,5);
    rect(x,115,5,5);
    rect(115,x,5,5);
    rect(100,x,5,5);
  }
}
