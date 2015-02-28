
int offset;
int x,y,value1,color1;
float angle1;
void setup(){
  size(500,500);
  value1=65;
 noStroke();  
 background(0);
}
void draw(){
  println(mouseX+" "+mouseY);
   
  x=mouseX;
  y=mouseY;
  offset=40;
  colorMode(HSB); 
  fill(color1,255,255);
  
  translate(x,y);
 // rotate(sin(x+y));
 rotate(angle1);
   
      triangleA(0,0,offset);
}
 
void triangleA(int a,int b,int offset){
  triangle(a,b,a-offset/2,b-offset,a+offset/2,b-offset);
   triangle(a,b,a-offset,b-offset/2,a-offset,b+offset/2);
  triangle(a,b,a-offset/2,b+offset,a+offset/2,b+offset);
  triangle(a,b,a+offset,b-offset/2,a+offset,b+offset/2);
}
 
void mouseMoved(){
  if(value1>=255){
    value1=0;
  
  }
  else{
   value1=value1+1;
     
  }
   if (angle1>=2*PI){
   angle1=0;}
   else{
   angle1=angle1+PI/45;
   }
    if (color1>255){
   color1=0;}
   else{
   color1=color1+2;
   }
}
