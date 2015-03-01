
void setup(){
  size(1024,720);
  background(255,255,0);
}
int a=0;
int b=0;

void draw(){
 for(int a=0;a<width;a+=60){
  for(int b=0;b<height;b+=60){
  mm(a,b);  
}
 }
}
void mm(int x,int y){
  pushMatrix();
  translate(x,y);
  rectMode(CENTER);
  fill(255,0,0);
  rect(x,y,100,100);
  fill(0,0,255);
  ellipse(x,y,50,50);
  popMatrix();
}
  
