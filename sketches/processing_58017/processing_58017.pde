
void setup(){
  size(300,300);
  background(204,204,100);
  frameRate(8);
}
 
int a = 0;
int b = 100;
int c = 0;
 
void draw(){
   
  rectMode(CENTER);
   fill(204,102,149);

 rect(width/2,height/2,c,c);
  a+=10;
  b-=10;
  c+=10;
 
  if (a>100){
    a=0;
  }
     
  if (b<0){
    b=0;
  }
   
  if (c>400){
    background(204,204,100);
    c=0;
  }
}
  

