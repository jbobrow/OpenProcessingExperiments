
int x;
int y;
float c;
int ps = 5;
int i;

void setup(){
  size(400,400);
  background(0);
  x= width/2;
  y= height/2;
}

void draw(){
  // drawing cube
  c=random(10,255);
  stroke(c);
  fill(0);
  quad(x-ps/2,y-ps/2,x+ps/2,y-ps/2,x+ps/2,y+ps/2,x-ps/2,y+ps/2);
  
  // movement
  x=x+round(random(-1,1))*ps;
  y=y+round(random(-1,1))*ps;
 
 //borders
 if(x<=0){
   x=x+ps;
 }if(x>=width){
   x=x-ps;
 }if(y<=0){
   y=y+ps;
 }if(y>=height){
   y=y-ps;
 }
}

