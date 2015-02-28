
int offset;
int x,y,value1,value2,value3;
void setup(){
  size(500,500);
  value1=9;
  
}
void draw(){
  println(mouseX+" "+mouseY);
  
  x=mouseX;
  y=mouseY;
  offset=40;
  background(255-value1);
  fill(value1);
  for(int y=0;y<500;y=y+100){
    for(int x=0;x<500;x=x+60){
  triangleA(x,y+offset,offset);
}
  }
}
void triangleA(int a,int b,int offset){
  triangle(a,b-5,a-offset/2,b-offset,a+offset/2,b-offset);
   
  triangle(a,b+5,a-offset/2,b+offset,a+offset/2,b+offset);
  
}

void mouseMoved(){
  if(value1>=255){
    value1=0;
 
  }
  else{
   value1=value1+2; 
    
  }
  
}
