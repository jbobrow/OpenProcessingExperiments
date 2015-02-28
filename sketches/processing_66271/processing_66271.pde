
int y;
boolean ball= false;

void setup(){
  size(400,400);
  background(0);
}

void draw(){
  fill(0,255,255);
  ellipse (200, y, 20, 20);
  
  if( y>=0 && ball==false){
    y+=1;}
    if( y>=390){
      ball=true;}
    if(y<=400 && ball==true){
    y-=1;}
    if(y<=10){
      ball=false;}
}
  


