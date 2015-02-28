
  int j=5;
  int i=150;
void setup(){
  size(400,400);
  background(0);
  smooth();
}

void draw(){
  frameRate(20);
  if(mousePressed==true){
  i=i+j;
  if((i<0)||(i>=255)){
    j=j*-1;
    }
  float k=random(0,200);
  float m=random(200,400);
  for (int x=0;x<=400;x=x+50){
    noStroke();
    fill(0,350-i,i+50,10);
    triangle(200,175,200,225,k,x);
    triangle(200,175,200,225,m,x);
  }
  }
}
