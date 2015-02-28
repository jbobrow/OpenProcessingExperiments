
//Bubble Wrap by Owaun Scantlebury
//October 26th 2012


import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;
PeasyCam cam;
public int w = 512;
public int h = 512;
public PVector [] karl ;
public PVector place;
PImage k,p;
int ix;
void setup(){
  size(w,h,P3D);
  
  for (int i =0;i<w*h;i++){
    int y=int(i/w);
    int x = i-(w*y);
   plane[i]=new PVector(x,y,0); 
  }
   k = ball(100,100,100,"normal");
   p = ball(100,100,100,"invert");
place=new PVector(w/2,h/2,0);

  int radius = 100;


  ix=0;
  place.x=w/3;
  place.y=h/3;
  
  for (int pawx=100;pawx<w-100;pawx+=100){
    for (int pawy=100;pawy<h-100;pawy+=100){
  ix=0;
  place.x=pawx;
  place.y=pawy;
   for (int x=(int)place.x-(radius/2);x<((int)place.x+(radius/2));x++){
   for (int y=(int)place.y-(radius/2);y<((int)place.y+(radius/2));y++){
    int i = (x*w)+y;
    float dis = dist(x,y,place.x,place.y);
    int _y=int(ix/100);
    int _x=ix-(_y*100);
    color c = p.get(_x,_y);
    float bb = c&255;
  
    ix++;
   } 
  }
  
    }
  }
  
  

  cam = new PeasyCam (this,w);
}
int radius;

PVector [] plane = new PVector [w*h];
void draw(){
 translate(-w/2,-h/2);
 background(255);

  ix=0;
  radius=100;
  place.x=mouseX;
  place.y=mouseY;
  if(mouseX>12 && mouseY >12 && mouseX<w-12 && mouseY < h-12 && keyPressed && key== 'p'){
    for (int x=(int)place.x-(radius/2);x<((int)place.x+(radius/2));x++){
   for (int y=(int)place.y-(radius/2);y<((int)place.y+(radius/2));y++){
    int i = (x*w)+y;
    float dis = dist(x,y,place.x,place.y);
    int _y=int(ix/radius);
    int _x=ix-(_y*radius);
    color c = p.get(_x,_y);
    float bb = c&255;
    if(dis<radius/2){
     if(i<plane.length-2 && i >0) 
     if((bb-215)>plane[i].z)plane[i].z=bb-215;
  
 
    }
    ix++;
    
   } 
  }
  }
   
 for (int i=0;i<w*h;i+=6){
point(plane[i].x,plane[i].y,plane[i].z); 
  
 }
  
   
  
}
float lz=0;
void keyPressed(){
 if(key==' '){
   for (int i =0;i<w*h;i++){
    int y=int(i/w);
    int x = i-(w*y);
   plane[i]=new PVector(x,y,0); 
  }
 } 
  
}

PImage ball(int w,int h,int radius,String what){
karl = new PVector [radius];
  
  PImage retval = createImage(w,h,ARGB);
  PGraphics space = createGraphics(w,h,P3D);
 space.loadPixels();
 space.beginDraw();
 space.ellipseMode(CENTER);
 space.background(255);
 space.noStroke();
 space.fill(255,0,0);
  space.ellipse(w/2,h/2,radius-2,radius-2);
 space.endDraw();
 space.updatePixels();
 
 int hitc=0;
  for (int x=0;x<w;x++){
  for (int y=0;y<h;y++){
  color c = space.get(x,y);
 if(c==color(255,0,0)){
  karl[hitc]=new PVector(x,y,y);
  stroke(1);
  point(x,y);
  hitc++;
   y=h;
 } 
  }
  }
  
 for (int x=0;x<w;x++){
   for (int y=0;y<h;y++){
     float dis=dist(x,y,w/2,h/2);

     int k = int(dis);
    
   if(dis<radius) retval.set(x,y,int(karl[abs(k-(radius/2))].z));
     
   }
    }
    
  if(what=="invert")retval.filter(INVERT);
  return retval;
}

float dist2(float a,float b,float c,float d){
  float retval = abs(a-c)+abs(b-d);
 return retval; 
}


