
int x=50;
int y=50;
int speed=4;
void setup(){
  size(1000,600);
}
void draw(){
  background(0);
  carDesign();
  movement();
 
}
void carDesign(){
fill(0,255,255);
 rect(x,y,200,50);
 fill(0,255,255);
 rect(x-20,y+30,20,20);
 fill(255,0,0);
 rect(x+200,y+10,x,10);
 fill(255,0,0);
 rect(x+200,y+25,x,10);
 fill(255,0,0);
 rect(x+200,y+40,x,10);
 fill(255);
 rect(x+5,y+10,10,10);
 fill(181,241,242);
 ellipse(x+5,y+60,20,20);
 fill(181,241,242);
 ellipse(x+150,y+60,20,20);
 
}
void movement(){
  x=x+speed;
y=y+speed;


if(x>width ||x<0){
  speed=speed*-1;
}
if(y>height ||y<0){
  speed=speed*-1;
} 


 

}
