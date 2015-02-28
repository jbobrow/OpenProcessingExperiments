
int x=0;
float a=0.0;
void setup (){
  size(400,400);
  smooth();
}
void draw (){
  background(0);
  stroke(255,255,0);
  fill(255,255,0);
  arc(50+x,150,70,70,QUARTER_PI-a,TWO_PI-QUARTER_PI+a); 
  stroke(0);
  if(QUARTER_PI-a <=0){
    a=0.0;
    }
  a+=0.02;
  x+=1;
}
