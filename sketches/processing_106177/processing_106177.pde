
float endP;
int r=int(random(0,255));
int g=int(random(0,255));
int b=int(random(0,255));


void setup(){
  size(400,400);
  background(255);
  fill(r,g,b);
}
  
void draw(){
  endP=map(second(),0,30,0,TWO_PI);
  arc(width/2,height/2,150,150,0,endP);
  if(second()>30){
       endP=map(second(),30,60,TWO_PI,0);
       fill(255);
      } 
}
