
void setup(){
  size(200,200);
  background(255);
}
  int x=0;

void draw(){

for(;x<200;x+=4){
  for(int y=0; y<=200; y+=30){
  rect(x*x/4,y+30,5,5);
  }
}
}



