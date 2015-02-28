
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioInput in;
float sx;
float sy;
int x;
int a;
int num = 12;
float c;
color[] colors = new color[num];
void setup(){
  size(400,400,P3D);
  colorMode(HSB,512);
  smooth();
  minim=new Minim(this);
  minim.debugOn();
  in = minim.getLineIn(minim.STEREO,512);
sx=0;
sy=0;
x=0;
a=0;
c=0;

}

void draw(){
  
  sx+=1;
  sy+=1;
  x=4;
  a=18;
  c=random(0,512);
  
  background(0);
  translate(200,200);
  
  for(int i=0; i<12; i+=1){
    colors[i] = color(100 * (i+1)/num, 100 * (num-i)/num, 255 * (num-i)/num); 
    stroke(512+colors[i]*(mouseX+mouseY)/300);
  //fill(256+i*6,512,512);
  rotateX(radians(sx));
  rotateY(radians(sy));
  
  pushMatrix();
  rotate(radians(i*a));
  translate(i*x,0);
  noFill();
  popMatrix();
  //stroke(sx,sy,sx);
  //stroke(0,in.left.get(i)*500,in.left.get(i)*500);
  box(175+in.left.get(i)*1000);
  stroke(random(0,512),random(0,512),random(0,512));
  ellipse(0,0,50,50);
   
  }
  for(int j=0; j<1; j+=1){
  fill(512);
  sphere(in.left.get(j)*1000); 

}
}


void stop()
{
  in.close();
  minim.stop();
 
  super.stop();
}

