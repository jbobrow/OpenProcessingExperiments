
void setup(){
  size(400,400);
  
}
int o=400;
int co=5;
void draw(){
  frameRate(12);
  for(int i=0; i<400; i=i+1){
    float ez = random(400);
    theHook(i, 4, ez);}
  for(int t=0;t<400;t=t+2){
  theHook(t,t,t);}
 float coo = random(100);
  theHook(o, coo, o);
  o=o-co;
  if((o<0)||(o>=400)){
    co=co*-1;
  }
}

void theHook(float x, float y, float z){
  fill(50,y,x);
  rect(x,z,y+(y/2),y);
  rect(x,z,y,y+(y/2));
}
