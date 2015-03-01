
import ddf.minim.*;
Minim minim;
AudioInput in;
float z;float i;



void setup(){
 background(0); 
size(600,705);
frameRate(8);
smooth();
frameRate(28);
 
}




void draw(){
  
 

z=-150+random(0,900);
  stroke(random(255));
  
  
  
fang(z+10,6,5,34,225,33);
fang(z+30,45,10,50,220,33);
fang(z-30,100,20,84,190,34);
fang (z,190,25,200,160,30);
fang(z-130,397,30,300,150,25);



}


void fang (float z,int y,int d,int c,int a,int b ){

 
  

  
fill(a,b);
rect(z,y,c,d);
rect(z,y,d,c);
rect(z,y+c-d,c,d);
if(2*d<c)
{rect(z+c-d,y,d,c);}

  
  
}
  
  
  












