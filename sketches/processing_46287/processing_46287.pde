
/* Processing Water Simulation
 * adapted by: Rodrigo Amaya
 *
 * Based on "Java Water Simulation", by: Neil Wallis
 * For more information visit the original article here:
 * http://neilwallis.com/projects/java/water/index.php
 *
 * How does it work? "2D Water"
 * http://freespace.virgin.net/hugo.elias/graphics/x_water.htm
 *
 */

//New remix by Owaun Scantlebury
//November 17th 2011
int cthru=111;
//import processing.opengl.*;
PVector [] cc;
PVector [] cci=new PVector [3];
PImage img;
int w = 255;
int h = 155;

int siz;
int hwidth,hheight;
int riprad;

int ripplemap[];
int ripple[];
int texture[];
int [] pix;
int oldind,newind, mapind;

int i;
int a;
int b;
PImage k;
PGraphics latex;
PImage [] top = new PImage[4];
void setup(){
  // img = loadImage("background.jpg");
  //w = img.width;
  //height = img.height;
  //size(w, h);
  size(510, 310,P2D);
  latex=createGraphics(w,h,P2D);
  top[0]=createImage(w,h,ARGB);
  top[1]=createImage(w,h,ARGB);
  top[2]=createImage(w,h,ARGB);
  top[3]=createImage(w,h,ARGB);
  latex.loadPixels();
  latex.beginDraw();
  cc= new PVector[w*h];
  for(int i=0;i<3;i++){
    cci[i]=new PVector(random(40)+random(40)+random(40)+random(40)+random(40),
    random(40)+random(40)+random(40)+random(40)+random(40),
    random(40)+random(40)+random(40)+random(40)+random(40));
  }
  //smooth();
  pix = new int [w*h];
  loadPixels();
  A=latex.pixels;
  //A = new int [w*h];
  B = new int [w*h]; 
  img = createImage(w,h,ARGB);
  k = createImage(w,h,ARGB);
  for (int x=0;x<w;x++){
    for (int y=0;y<h;y++){
      color c = color(w-x,y,h-y); //karl
      //  color c=color(x-y,w-x,h-y); //pryje
      //color  c= color(h-x,y-x,w-y); //jencee1
      int j = color(255,255,0);
      // color c = color(h-x,j,w-y); //jencee2
      //pr_yje@live.com
      //jen_cupcake@live.com
      img.set(x,y,c);
      k.set(x,y,c);
      pix[x+w*y]=c;
    }
  }
  frameRate(4000);

  hwidth = w>>1;
  hheight = h>>1;
  riprad=5; //test with 3

  siz = w * (h+2) * 2;

  ripplemap = new int[siz];
  ripple = new int[w*h];
  texture = new int[w*h];

  oldind = w;
  newind = w * (h+3);

  image(img, 0, 0);
  //loadPixels();
  tex=createImage(w,h,ARGB);
  for(int i=0;i<tex.pixels.length;i++){
    color c=img.pixels[i];

    float rr=c>>16&255;
    float gg=c>>8&255;
    float bb=c&255;
    tex.pixels[i]=color(rr,gg,bb,111);
  }

  // smooth();
}
int lmode = 1;
int by = 5; //2
int gain = 5;
float dis;
int [] A;
int [] B;

PImage tex;
void draw() {
  latex.image(tex, 0, 0);
  //   image(k,0,0);
  //k = createImage(w,h,ARGB);
  // loadPixels();
  //  blend(k,0,0,w,h,0,0,w,h,REPLACE);
  // texture = pixels;

  newframe();

  for (int i = 0; i < pix.length; i++) {
    color col = ripple[i];
    float rr = col >> 16 & 0xff;
    float     gg = col >> 8 & 0xff;
    float  bb = col  & 0xff;
    // img.pixels[i]= ripple[i];
    int y = int(i/w);
    int x = i-(y*w);
    for (int q=0;q<2;q++){
      if(q==1){
        if( lmode ==1){
          dis =distx(mouseX,mouseY,x,y)/by;

        }
        if( lmode ==2) dis =distx(mouseX,mouseY,mouseX,y)/by;
      }
      if(q==0){
        if( lmode ==1){
          dis =distx(w-mouseX,mouseY,x,y)/by;

        }
        if( lmode ==2) dis =distx(mouseX,mouseY,mouseX,y)/by;
      }   


      //  }
      rr += cci[0].x/dis-gain;
      gg += cci[1].y/dis-gain;
      bb += cci[2].z/dis-gain;
    }
    A[i]=color(rr,gg,bb,rr);


    // ripple[i]=color(rr,gg,bb,rr);
    // texture[i]=color(rr,gg,bb,rr);
    // pixels[i]=k.pixels[i];
  }

  // updatePixels();
  // image(k,0,0);
  //copy(k,0,0,w,h,0,0,w,h); //kicker
  //image(k,0,0);
  //k.copy(img,0,0,w,h,0,0,w,h); //kicker
  //k.copy(img,0,0,w,h,0,0,w,h); //kicker
  //tex.copy(g,0,0,w,h,0,0,w,h);
  //updatetex();
  image(latex, 0, 0);
  image(top[0],w,0);
  image(top[1],w,h);
  image(top[2],0,h);
}

public void disturb(int dx, int dy) {

  if (kd){
    //top[1].pixels[i]=ripplemap[newind+i]; // <<<kicker
    // top[1].filter(BLUR);
    //top[1].mask(top[2]);
    top[1].copy(top[1],0,0,w,h,0,0,w,h);
    for (int i =0;i<top[0].pixels.length;i++){
      int y = int(i/w);
      int x= i-(y*w);
      float dis =distx(x,y,mouseX,mouseY);
      if(dis<10)    ripplemap[i]=top[1].pixels[i];
    }
    kd =false;
  }

  for (int j=dy-riprad;j<dy+riprad;j++) {
    for (int k=dx-riprad;k<dx+riprad;k++) {
      if (j>=0 && j<h && k>=0 && k<w) {
        ripplemap[oldind+(j*w)+k] += 128;   //test with 512
      }
    }
  }
}

float distx(float a,float b,float c,float d){
  float retval = 0;
  retval = abs(a-c)+abs(b-d);
  // retval = dist(a,b,c,d);
  return retval;
}

void newframe() {
  //Toggle maps each frame
  i=oldind;
  oldind=newind;
  newind=i;

  i=0;
  mapind=oldind;
  for (int y=0;y<h;y++) {
    for (int x=0;x<w;x++) {
      short data =
        (short)((ripplemap[mapind-w]+ripplemap[mapind+w]+ripplemap[mapind-1]+ripplemap[mapind+1])>>1);
      data -= ripplemap[newind+i];
      data -= data >> 5;
      ripplemap[newind+i]=data;

      //where data=0 then still, where data>0 then wave
      data = (short)(1024-data);

      //offsets
      a=((x-hwidth)*data/1024)+hwidth;
      b=((y-hheight)*data/1024)+hheight;

      //bounds check
      if (a>=w) a=w-1;
      if (a<0) a=0;
      if (b>=h) b=h-1;
      if (b<0) b=0;

      // ripple[i]=texture[a+(b*w)];
      ripple[i]=A[a+(b*w)];
      top[0].pixels[i]=ripple[i];
      top[1].pixels[i]=ripplemap[newind+i]; //<--kicker
      top[2].pixels[i]=img.pixels[a+(b*w)];
      // A[a+(b*w)]=img.pixels[i];
      mapind++;
      i++;
    }
  }
}

//Try switching between using the disturb method in mousePressed or mouseMoved
void mousePressed()
{
  //disturb(mouseX, mouseY);
}

void mouseMoved()
{
  disturb(mouseX, mouseY);
}

void mouseReleased()
{
}

void keyPressed() {

  if (key=='l')lmode =1;
  if (key=='L')lmode =2;

  if (keyCode==UP){
    if(cthru<255){
      cthru++;
      updatetex();
    }
  }
  if(keyCode==DOWN){

    if(cthru>1) {
      cthru--;
      updatetex();
    }
  }
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
}


void updatetex(){
  for(int i=0;i<tex.pixels.length;i++){
    color c=img.pixels[i];

    float rr=c>>16&255;
    float gg=c>>8&255;
    float bb=c&255;
    tex.pixels[i]=color(rr,gg,bb,cthru);
  }
}

boolean kd=false;

void keyReleased(){

  if(key=='f')kd = true;
}


