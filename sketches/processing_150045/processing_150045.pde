
int x=50;
int y=50;
int a=0;
int b=0;
void setup(){
  size(600, 400);
  frameRate(100);
  smooth();
}
void draw(){
  background(255);
  fill(150, 60, 90);
  ellipse(x, y, 100, 100);
  if(a==0){
    x=x+1;
  }else{
    x=x-1;
  }
  if(x==550){
    a=1;
  }
  if(x==50){
    a=0;
  }
  if(b==0){
    y=y+1;
  }else{
    y=y-1;
  }
  if(y==350){
    b=1;
  }
  if(y==50){
    b=0;
  }
}
