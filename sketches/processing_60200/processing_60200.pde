
void setup(){
size(500,500);
background(#F4F4F4);
}
int x=0;
int speed=10;


 
void draw(){
 

 
frameRate(30);
noStroke();
fill(x,0,x*.5,80);
 for (int i=3; i<6; i+=1){
rect(x,height*.1*i,160,90);
 
x=x+speed;
if ((x>=(width-160)||x<0))
{speed=(-1)*speed;
}}
 
}


