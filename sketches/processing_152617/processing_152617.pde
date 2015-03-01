

float x, s, control;
void setup(){
  size(600,600);
 
}
void draw(){
   background(#FFFFFF);
 strokeWeight(8);
  for(x=0; x<= 300; x+=0.02){
  point(300+cos(x)*x*s,300+sin(x)*x*s);
  
  }
 if(control==0 ){
    s=s+1;
  }else{
    s=s+0.01;}

if(s>=2){
  control=1;
}
}
