

int x = 0;
int y = 0;

boolean Yspeed=true;
boolean Xspeed=true;



void setup(){
  size(400,400);
   background(240,0,150);
  
}


void draw(){
 noStroke();
fill(120,120,30,100);  
ellipse(x,y,30,30);

 noStroke();
fill(120,255,30,100);  
ellipse(x+100,y,40,40);


if(Yspeed){
y+=10;
} else {
y-=10;  
}  

if(y>=height){
Yspeed=false;
}

if(y<=0){
Yspeed=true;

}

if(Xspeed){
x+=3;
} else {
  x-=3;
}
  
if(x>width){
  Xspeed=false;
} 

if(x<0){
  Xspeed=true;
}



}



