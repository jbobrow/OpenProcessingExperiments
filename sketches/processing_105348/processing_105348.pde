
//define x,y,r,l,v
float v;
float a;
int r=10;
int l=500;
float x=250;
float y=250;
float t;


void setup(){
  size(500,500);
  frameRate(60);
  
}

void draw(){
 background(255);
  ellipse(x,y,r,r);
 t++;
 v=a*t/60;
 y=y+v*t/120;
if(t<81) {
a=9.8;}
 else if(t==81){
a=0;


}




}



