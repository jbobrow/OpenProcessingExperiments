
//import processing.opengl.*;

// Shining Particle by harukit
// Created with Processing 68 alpha on September 11 , 2004
// http://www.harukit.com

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

int[] blogPx = { 0, 90, 90 };
int[] blogPy = { 0, 120, 45 };

// Movement vector for each blob
int[] blogDx = { 1, 1, 1 };
int[] blogDy = { 1, 1, 1 };

PGraphics pg;
int[][] vy,vx;

//import processing.video.*;
int cm = 1;

int c=1;
int kx,ky,ka;
int pNum =14;
Particle[] p = new Particle[pNum];
float rr,gg,bb,dis;
int gain = 5;
float[] cc = new float[3];
PImage kl;
void setup(){
 loadPixels();

 frameRate(100);
 cm++;
// mm = new MovieMaker(this, width, height, "drawing"+str(cm+1)+".mov", 100,
     //              MovieMaker.ANIMATION, MovieMaker.HIGH);

 //size(280,280,P3D);

 //pg = createGraphics(width/(numBlobs+1), height/(numBlobs+1),P3D);

//kl= new PImage(200,200);
 kl=loadImage("cats.gif");
 size(kl.width,kl.height,P3D);
  pg = createGraphics(width, height,P3D);
  colorMode(RGB,350);
  hint(ENABLE_OPENGL_4X_SMOOTH);
//smooth();
   lights();
 noStroke();
 background(110);
 for(int i=0;i<3;i++){
  cc[i]=random(40)+random(40)+random(40)+random(40)+random(40);
 }
 for(int i=0;i<pNum;i++){
  p[i] = new Particle(random(width),random(height),random(0.1,0.3));
 }
  vy = new int[numBlobs][pg.height];
 vx = new int[numBlobs][pg.width];
 
 asize=width*height;
  rainfall=1;
  step=false;
  initmaps();
  show=false;
  
}

void draw(){
 //scale(1.5);
// background(kl);

//pool();
 for (int i=0; i<numBlobs; ++i) {
   blogPx[i]+=blogDx[i];
   blogPy[i]+=blogDy[i];

   // bounce across screen
   if (blogPx[i] < 0) {
     blogDx[i] = 1;
   }
   if (blogPx[i] > pg.width) {
     blogDx[i] = -1;
   }
   if (blogPy[i] < 0) {
     blogDy[i] = 1;
   }
   if (blogPy[i] > pg.height) {
     blogDy[i]=-1;
   }

   for (int x = 0; x < pg.width; x++) {
     vx[i][x] = int(sq(blogPx[i]-x));
   }

   for (int y = 0; y < pg.height; y++) {
     vy[i][y] = int(sq(blogPy[i]-y));
   }
 }

 c++;
 if (c < 40){
 colorMode(RGB,350);
 filter(BLUR,1.4f);
 }


 if (c == 80){
 c= 0;
 }

 stroke(-1);
// line(0,10,width,height+10);
// line(0,0,width,height);
//line(0,0,width/5,height/5);
//line(width/3,height/3,width,height);
 stroke(200);
// line(0,c,0,c);
 //line(width/2,height/2,width/2,height/2);
 //filter(BLUR,1.4f);
// translate(0,0);
 point(mouseY,mouseX);
noStroke();
lights();
//translate(58, 48, 0);
//fill(144,34);
//sphere(28);
//translate(52, 48, 0);
//fill(244,34);
//box(28);
//translate(052, 48, 0);
//fill(344,34);
//box(18);
//stroke(c);

 for(int i=0;i<pNum;i++){
  p[i].update();
 }
 ky=0;
 kx=0;
  pg.beginDraw();
 pg.loadPixels();
 pg.image(kl,width/2,0,width/2,height);
 for(int y=0;y<pg.height;y++){

  for(int x=0;x<pg.width;x++){
    kx+=0.5;
      int pos=y*pg.width+x;
      int ka =int(ky)*pg.width/2+int(kx);
      color col = pg.pixels[pos];

      rr = col >> 16 & 0xff;
      gg = col >> 8 & 0xff;
      bb = col  & 0xff;
      for(int i=0;i<pNum;i++){
        dis =dist(p[i].xpos,p[i].ypos,x,y)/2;
        rr += cc[0]/dis-gain;
        gg += cc[1]/dis-gain;
        bb += cc[2]/dis-gain;
      }

       int m = 1;
     for (int i = 0; i < numBlobs; i++) {
       // Increase this number to make your blobs bigger
       m += 60000/(vy[i][y] + vx[i][x]+1);
     }

      kx=0;
      ky+=0.5;
      //pixels[pos]=color(rr,gg,bb);
        // pg.pixels[x+y*pg.width] = color(0, m+x, (x+m+y)/2);
     pg.pixels[x+y*pg.width]= color(rr,gg,bb);
   //   kl.pixels[ka]=color(rr,gg,bb);
  }
 }
 pg.updatePixels();
 pg.endDraw();
 //image(pg, 0, 0);
 image(pg, 0, 0, width, height);
 //image(kl,0,height/2,width/2,height/2);
 //image(pg, 0, height/2, width/2, height/2);
 // image(kl,0,height/2);
 pool();
// if (mm!= null){
//  mm.addFrame();
// }
}

void mousePressed(){
 //background(0);
 Particle[] p = new Particle[pNum];
}

void mouseReleased(){
 for(int i=0;i<3;i++){
  cc[i]=random(40)+random(40)+random(40)+random(40)+random(40);
 }
 // background(0);
 for(int i=0;i<pNum;i++){
  p[i] = new Particle(random(width),random(height),random(0.1,0.3));
 }
}

class Particle{
 float xpos,ypos,del;
 Particle(float x,float y,float d){
  xpos=x;
  ypos=y;
  del = d;
 }
 void update(){
  xpos += (mouseX-xpos)*del;
  ypos += (mouseY-ypos)*del;
 //   xpos += (random(width)-xpos)*del;
 //   ypos += (random(height)-ypos)*del;
 }
}

void keyPressed() {

 if (key =='2'){
 // rain2(); 
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
  mapIn[mouseX+mouseY*width]+=mouseX+mouseY*width/8;
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
    //pg.pixels[i]=0xff000000 | p<<16 | p<<8 | p;
    pixels[i]=0xff000000 | p<<16 | p<<8 | p;
  }

}

void rendermap(){
  int o,p,i,x,y,xo,yo,r,g,b,shade;
  //int[] pix=pg.pixels;
  int[] pix=pixels;
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
      pixels[i++]=pix[xo+yo*width];
      }
      else
      {
       pg.pixels[i++]=pix[xo+yo*width];
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

