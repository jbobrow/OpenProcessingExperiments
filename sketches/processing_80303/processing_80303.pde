
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;
PeasyCam cam;
int w =255;
int h= 255;
int dp = 255;
PImage a,b,c,d;

void setup(){
 size(510,510,P2D); 
//  cam = new PeasyCam (this,w);
a=createImage(w,h,ARGB);
b=createImage(w,h,ARGB);
c=createImage(w,h,ARGB);
d=createImage(w,h,ARGB);

}

void draw(){
for (int x=0;x<w;x++){
 for (int y=0;y<h;y++){
   float q = dist(x,y,mouseX,mouseY);
   float A = q/x*255;
   float B = q/y*255;
   float C = q/(x+w)*255;
  color ca = color(A,B,C);
    color cb = color(B,C,A);
      color cc = color(A,C,B);
        color cd = color(C,B,A);
        int pos = x+w*y;
 a.pixels[pos]=ca; 
   b.pixels[pos]=cb;
   c.pixels[pos]=cc;
    d.pixels[pos]=cd;
 } 
}

//smooth();
//}
//
//void draw(){
//  background(255);
  
 // translate(-w/2,-h/2);
  image(a,0,0);
  image(b,w,0);
  image(c,0,h);
  image(d,w,h);
}
