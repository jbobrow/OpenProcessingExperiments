
 
//Owaun Scantlebury
//zdraw
//August 31st 2011

import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;

PeasyCam cam;


int w = 255;
int h = 255;
int d = 255;
PVector [] points = new PVector [512];
void setup(){
 size(w,h,P3D);
 cam = new PeasyCam (this,width);
  
smooth();  
}

float xm = w/2;
float ym = h/2;
float zm = d/2;
PVector A= new PVector (xm,ym,zm);
PVector B= new PVector (random(w),random(h),random(zm));
void draw(){
background(255);


translate(-xm,-ym,-zm);
line(0,0,0,w,0,0);
line(w,0,0,w,h,0);
line(w,h,0,0,h,0);
line(0,h,0,0,0,0);

line(A.x,A.y,A.z,B.x,B.y,B.z);

translate(0,0,d);
line(0,0,0,w,0,0);
line(w,0,0,w,h,0);
line(w,h,0,0,h,0);
line(0,h,0,0,0,0);
if(dist(A.x,A.y,A.z,B.x,B.y,B.z)>1){
move(A,B);
}
if(dist(A.x,A.y,A.z,B.x,B.y,B.z)<1){
keyPressed();
}



}
float xd;
float yd;
float zd;
float dx;
float dy;
float dz;
float totd;
float xby;
float yby;
float zby;
PVector move(PVector A, PVector B){
 xd = A.x-B.x;
if (xd<0)xd = -xd;

 yd = A.y-B.y;
if (yd<0)yd = -yd;

 zd = A.z-B.z;
if (zd<0)zd = -zd;

totd = xd+yd+zd;

xby = xd/totd;
yby = yd/totd;
zby = zd/totd;

PVector retval = new PVector (A.x+xby,A.y+yby,A.z+zby);
if (B.x>A.x && B.y > A.y && B.z>A.z){ //+++
A.x+=xby;
A.y+=yby;
A.z+=zby;
}

if (B.x<A.x && B.y > A.y && B.z>A.z){ //-++
A.x-=xby;
A.y+=yby;
A.z+=zby;
}
if (B.x<A.x && B.y < A.y && B.z>A.z){ //--+
A.x-=xby;
A.y-=yby;
A.z+=zby;
}

if (B.x<A.x && B.y < A.y && B.z<A.z){//---
A.x-=xby;
A.y-=yby;
A.z-=zby;
}

if (B.x>A.x && B.y > A.y && B.z<A.z){//++-
A.x+=xby;
A.y+=yby;
A.z-=zby;
}
if (B.x>A.x && B.y < A.y && B.z<A.z){//+--
A.x+=xby;
A.y-=yby;
A.z+=zby;
}
if (B.x<A.x && B.y > A.y && B.z<A.z){//-+-
A.x-=xby;
A.y+=yby;
A.z-=zby;
}
if (B.x>A.x && B.y < A.y && B.z>A.z){//+-+
A.x+=xby;
A.y-=yby;
A.z+=zby;
}




return retval;  
}

int pass = 0;
void keyPressed(){
  B= new PVector (random(w),random(h),random(zm));
  
}


