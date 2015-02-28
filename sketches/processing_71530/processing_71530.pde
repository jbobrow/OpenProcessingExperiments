
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

AudioInput in;
Minim minim;
float largo,ancho,m,r,s,t,u,v,w,x,y,a,b;
int d=0;
PFont letra1;

void setup(){
  size(800,500);
  smooth();
  frameRate(5);
  minim= new Minim(this);
  in=minim.getLineIn(Minim.MONO,512);
  background(0);
  letra1=loadFont("GillSans-UltraBold-48.vlw");
}
void draw(){
  
if(largo<=900){
background(0);
fill(255,255,0);
m=abs(in.mix.get(0)*40);
r=abs(in.mix.get(0)*60);
ancho+=m;
largo+=r;
ellipse(400,250,ancho,largo);}

else{
frameRate(20);
background(0);
r=int(random(800));
s=int(random(500));
fill(255);
ellipse(r,s,5,5);
t=int(random(800));
u=int(random(500));
fill(255);
ellipse(t,u,5,5);
v=int(random(800));
w=int(random(500));
fill(255);
ellipse(v,w,5,5);
x=int(random(800));
y=int(random(500));
fill(255,0,0);
ellipse(x,y,5,5);
textFont(letra1,a);
text("Boooooooom!!!",100,250);
fill(255);
textFont(letra1,b);
text("Boooooooom!!!",105,255);
a+=1;
b+=1;
}

}
  

