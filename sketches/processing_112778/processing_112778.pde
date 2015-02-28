
int x,y,d,color1;
float angle;
void setup(){
 size(500,500); 
 angle=0;
}
void draw(){
  x=mouseX;
  y=mouseY;
  println(x+" "+y);
  colorMode(HSB);
   
 translate(width/2,height/2);
 fill(color1,255,255);
rotate(angle);
for (int i=0;i<10;i++){
 rotate(PI/5); 
A(0,d,50);
if(d>500){
  d=0;
}else{
  d=d+1;
  }
}
if(angle>2*PI){
  angle=0;
}else{
  angle=angle+PI/12;
}
if(color1>255){
  color1=0;
}else{
  color1=color1+2;
}
}

void A (int x,int y,int offset){
  triangle(x,y,x-offset/2,y+offset,x+offset/2,y+offset);
}
