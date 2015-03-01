
int verde =(220000);
float aga =15;
void setup(){
  size(800,800);
  }
void draw(){
  aga=aga*1.0075;
  verde=verde*2;
  fill(verde);
  rect(aga,aga,aga,aga);
  line(width/2,height/2,0,aga);
   line(width,0,width/2,aga);
}
