
void setup(){
  size(200,200);
  background(255);
}
  int x=0;
 
void draw(){
 
for(;x<200;x+=2){
  fill(255,0,0);
  for(int y=0; y<=200; y+=25){
  ellipse(x*x/4,y,5,5);
  }
}
}
