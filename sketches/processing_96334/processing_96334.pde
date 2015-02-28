
void setup(){
  size(200,200);
  background(206,125,25);
}
  int x=0;
 
void draw(){
 
for(;x<400;x+=2){
  for(int y=0; y<=400; y+=45){
  fill(96,106,25);
  noStroke();
  rect(x*x/8,y+45,5,5);
  }
}
}
