
int x=0;
float n = 0;
float r = 2;
void setup(){
  size(500,500);
  frameRate(50);
  background(1);
  stroke(255,0,244);
}
void draw(){
  if(x<=290){
    x=x-1;
  }else{
    x=x+1;
  }
  for(n=0; n<= 280; n+=6){
    for(r=2; r<=280; r+=6){
      point(width/2 + cos(n+r+x) * 2*r, height/2 + sin(n+r+x) * 2*r);
      n = n + 1;
      r = r + 1;
    }
  }
}
 

