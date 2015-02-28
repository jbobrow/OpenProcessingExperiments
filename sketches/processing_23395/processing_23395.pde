
/* *********************************************************************
   foreverwater2 by Owaun Scantlebury               
   applet page : http://openprocessing.org/visuals/?visualID=8224
   author page : http://openprocessing.org/portal/?userID=990

   Source files retrieved from openProcessing.org on Saturday 12 March 2011, 02:07:29 (CET)
   using http://emoc.org/opcode/ 
   Code licensed under Creative Commons Attribution-Share Alike 3.0 and GNU GPL license.
   http://creativecommons.org/licenses/by-sa/3.0/
   http://creativecommons.org/licenses/GPL/2.0/

********************************************************************* */



/* *********************************************************************
   foreverwaterv2.pde
********************************************************************* */

//import processing.opengl.*;

// Shining Particle by harukit
// Created with Processing 68 alpha on September 11 , 2004
// http://www.harukit.com
public int lmode =2;
public boolean dowater= true;
public int cmode =1;
//----
int[] map1;
int[] map2;
int[] mapIn;
int[] mapOut;
int asize;
boolean step;
int rainfall;
boolean show;
int strength=8000;

//----
int numBlobs = 3;
public int by = 8;
int[] blogPx = { 0, 90, 90 };
int[] blogPy = { 0, 120, 45 };

// Movement vector for each blob
int[] blogDx = { 1, 1, 1 };
int[] blogDy = { 1, 1, 1 };

PImage pg;
int[][] vy,vx;


int cm = 1;

int c=1;
int kx,ky,ka;


public color [] A,B;
float rr,gg,bb,dis;
int gain = 5;
float[] cc = new float[3];
PImage kl;
int w = 200;
int h = 50;
void setup(){


 frameRate(3000);
 cm++;



//kl=loadImage("b.png");
 kl=createImage(w,h,ARGB);
 size(200,50);

loadPixels();

  pg =createImage(width,height,ARGB);
   A= new color [pg.pixels.length];
 // createGraphics(width, height,JAVA2D);
  B = new color [pg.pixels.length];
  colorMode(RGB,350);
 // hint(ENABLE_OPENGL_4X_SMOOTH);
//smooth();
   //lights();
 noStroke();
 background(110);
 for(int i=0;i<3;i++){
  cc[i]=random(40)+random(40)+random(40)+random(40)+random(40);
 }

  vy = new int[numBlobs][pg.height];
 vx = new int[numBlobs][pg.width];
// arraycopy(kl.pixels,B);
//B  = new color [w*h];
 asize=width*height;
  rainfall=1;
  step=false;
  initmaps();
  show=false;
  
}

void draw(){
 

 c++;



 if (c == 80){
 c= 0;
 }





 ky=0;
 kx=0;

 for(int y=0;y<pg.height;y++){

  for(int x=0;x<pg.width;x++){
    kx+=0.5;
      int pos=y*pg.width+x;
      int ka =int(ky)*pg.width+int(kx);
    color col = B[pos];
 // color col =A[pos];
      rr = col >> 16 & 0xff;
      gg = col >> 8 & 0xff;
      bb = col  & 0xff;
   
      if( lmode ==1) dis =dist(mouseX,mouseY,x,y)/by;
        if( lmode ==2) dis =dist(mouseX,mouseY,mouseX,y)/by;
        rr += cc[0]/dis-gain;
        gg += cc[1]/dis-gain;
        bb += cc[2]/dis-gain;
      

       int m = 1;


      kx=0;
      ky+=0.5;
 
  A[x+y*pg.width]= color(rr,gg,bb);
  if( mousePressed && cmode ==2) A[x+y*pg.width] = blendColor(A[x+y*pg.width],color(height-y,x,x-y),ADD);
  if( mousePressed && cmode ==1) A[x+y*pg.width] = blendColor(A[x+y*pg.width],kl.pixels[x+y*pg.width],ADD);

  }
 }

if (dowater)pool();
 
 for (int x=0;x<A.length;x++){
 color c = A[x];
 stroke(c);
 int _y=(int)x/width;
 int _x = x - (_y*width);
 //set(_x,_y,c);
 pixels[x]=c;
// point (_x,_y);
}
updatePixels();
 }



void mouseReleased(){
 for(int i=0;i<3;i++){
  cc[i]=random(40)+random(40)+random(40)+random(40)+random(40);
 }

}



void keyPressed() {
if (key=='w')dowater = !dowater;
  if (key=='l')lmode =1;
    if (key=='L')lmode =2;
   if (key=='c')cmode =1;
    if (key=='C')cmode =2;
  if (key=='g')show =!show;
  if (key=='k')step =!step;
  
  if (key=='u'){
    if (by<128){
     by++; 
    }
  }
  
    if (key=='d'){
    if (by>2){
     by--; 
    }
  }

  if (key =='3'){
  rain3(); 
 }
if (key == 'h'){
 colorMode(HSB,350); 
}

if (key == 'g'){
 colorMode(RGB,350); 
}

if (key == 'r'){
setup();
}


}

void rain(){
  //mapIn[int(random(asize-1))]+=int(random(-strength,strength));
  //mapIn[mouseX+mouseY*width]+=int(random(-strength,strength));
  if(mouseY>2 && mouseY<height-2){
  mapIn[mouseX+mouseY*width]+=mouseX+mouseY*width/by;
  }
}

void initmaps(){
  map1=new int[asize];
  map2=new int[asize];
}

void updatemap(){
  int x,y,yw,i;
  for (y=1;y<height-1;y++){
    yw=y*width;
    for (x=1;x<width-1;x++){
      i=x+yw;
      mapOut[i] = ((mapIn[i-1] + mapIn[i+1] + mapIn[i+width] + mapIn[i-width])>>1) - mapOut[i];
      mapOut[i] -=mapOut[i]>>8;
    }
  }
}

void showmap(){
  int p;
  for (int i=0;i<asize;i++){
    p=mapOut[i]+128;
    if (p<0) p=0;
    if (p>255) p=255;
  
    A[i]=0xff000000 | p<<16 | p<<8 | p;
    
  }

}

void rendermap(){
  int o,p,i,x,y,xo,yo,r,g,b,shade;

  int[] pix=A;
  i=0;

  for (y=0;y<height;y++){
    for (x=0;x<width;x++){
      if (x==0){
        xo=mapOut[i]-mapOut[i+1];
      } else if (x==width-1){
        xo=mapOut[i-1]-mapOut[i];
      }else{
        xo=mapOut[i-1]-mapOut[i+1];
      }
      if (y==0){
        yo=mapOut[i]-mapOut[i+width];
      } else if (y==height-1){
        yo=mapOut[i-width]-mapOut[i];
      }else{
        yo=mapOut[i-width]-mapOut[i+width];
      }
      //shade=(xo+yo)>>2;
      xo+=x;
      yo+=y;
      while (xo<0) xo+=width;
      while (yo<0) yo+=height;
      while (xo>=width) xo-=width;
      while (yo>=height) yo-=height;

      /*
      // Additional Shading
      p=pix[xo+yo*width];
      r=(p&0xff0000)>>16;
      g=(p&0x00ff00)>>8;
      b=(p&0x0000ff);
      r+=shade;
      g+=shade;
      b+=shade;
      if (r<0) r=0;
      if (r>255) r=255;
      if (g<0) g=0;
      if (g>255) g=255;
      if (b<0) b=0;
      if (b>255) b=255;
      pixels[i++]=0xff000000 | r<<16 | g<<8 | b;
      */
      if (keyPressed &&  key =='l')
      {
  
    A[i++]=pix[xo+yo*width];
      }
      else
      {
    
        B[i++]=pix[xo+yo*width];
      }
    }
  }

}

void fastblur(){
  int w=width;
  int h=height;
  int wm=w-1;
  int hm=h-1;
  int wh=w*h;
  int div=3;
  int r[]=new int[wh];
  
  int sum,x,y,i,p,p1,p2,yp,yi,yw;
  int vmin[] = new int[max(w,h)];
  int vmax[] = new int[max(w,h)];

  yw=yi=0;

  for (y=0;y<h;y++){
    sum=0;
    for(i=-1;i<=1;i++){
      p=mapOut[yi+min(wm,max(i,0))];
      sum+= p;
    }
    for (x=0;x<w;x++){

      r[yi]=sum/div;

      if(y==0){
        vmin[x]=min(x+2,wm);
        vmax[x]=max(x-1,0);
      }
      p1=mapOut[yw+vmin[x]];
      p2=mapOut[yw+vmax[x]];

      sum+= p1 -p2 ;
      yi++;
    }
    yw+=w;
  }

  for (x=0;x<w;x++){
    sum=0;
    yp=-w;
    for(i=-1;i<=1;i++){
      yi=max(0,yp)+x;
      sum+=r[yi];

      yp+=w;
    }
    yi=x;
    for (y=0;y<h;y++){
      mapOut[yi]=sum/div;
      if(x==0){
        vmin[y]=min(y+2,hm)*w;
        vmax[y]=max(y-1,0)*w;
      }
      p1=x+vmin[y];
      p2=x+vmax[y];

      sum+=r[p1]-r[p2];

      yi+=w;
    }
  }

}

void pool()
{
 if(keyPressed == true && key == 'v'){
  
  if (!step){
    mapIn=map2;
    mapOut=map1;
  } else {
    mapOut=map2;
    mapIn=map1;
  }
  
 }
 
if (keyPressed == true  && key == 'f'){
  
  if (!step){
    mapIn=map2;
    mapOut=map1;
  } else {
    mapOut=map1;
    mapIn=map2;
  }
  
  
  
}
 
 if (keyPressed == false)
 
 {
  if (!step){
    mapIn=map1;
    mapOut=map2;
  } else {
    mapOut=map1;
    mapIn=map2;
  }
 }
  
  rain();
  updatemap();
  fastblur();
  if (show){
    showmap();
  } else {
    rendermap();
  }
  step=!step; 
}

void rain2(){
  //mapIn[int(random(asize-1))]+=int(random(-strength,strength));
  mapIn[mouseX+mouseY*width]+=int(random(-strength,strength));
 // mapIn[mouseX+mouseY*width]+=mouseX+mouseY*width/8;
}
void rain3(){
  mapIn[int(random(asize-1))]+=int(random(-strength,strength));
 // mapIn[mouseX+mouseY*width]+=int(random(-strength,strength));
 // mapIn[mouseX+mouseY*width]+=mouseX+mouseY*width/8;
}

                
