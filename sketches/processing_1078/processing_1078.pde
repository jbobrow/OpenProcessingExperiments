
PImage frames[];
PImage img;
PImage P1,P2;
int C1[],C2[]; //grey channels
int pix[];
int shinePix[],embossPix[];
int originalWidth,originalHeight;
int aaWidth,aaHeight; //enlarged size for anti-aliasing
float aaZoom=1.0; //anti-alias quantity
float p,t;

color darkChocolateColor, lightChocolateColor, shineChocolateColor;
void setup(){
  size(900,256,JAVA2D);
  colorMode(HSB, 360, 100, 100);
  darkChocolateColor =color(20,99,25);
  lightChocolateColor=color(20,80,70);
  shineChocolateColor=color(20, 5,95);
  colorMode(RGB,255);

  frames=new PImage[10]; // number of .gifs
  for(int i=0;i<frames.length;i++){ frames[i]=loadImage("letters"+nf(i+1+1,4)+".gif"); }
  originalWidth=frames[0].width;
  originalHeight=frames[0].height;
  aaWidth=round(aaZoom*originalWidth);
  aaHeight=round(aaZoom*originalHeight);
  for(int i=0;i<frames.length;i++){ frames[i].resize(aaWidth,aaHeight);  }

  img=new PImage(aaWidth,aaHeight);
  P1=new PImage(aaWidth,aaHeight);
  P2=new PImage(aaWidth,aaHeight);
  int imgs=img.width*img.height;
  C1=new int[imgs];
  C2=new int[imgs];
  pix=new int[imgs];
  shinePix=new int[imgs];
  embossPix=new int[imgs];
  p=0.0;
  t=0.0;
}

int firstFrame;
int secondFrame;
int iteration=0;
void draw(){
  float maxBlur=1.0*aaWidth*(mouseX==0?width/2:mouseX)/width;

  t=mod(t,frames.length);
  firstFrame=floor(t);
  secondFrame=(firstFrame+1)%frames.length;
  p=mod(t,1.0);
  //p=fade01(p);
  t+=1.0/50;

  arrayCopy(frames[ firstFrame].pixels, P1.pixels);
  arrayCopy(frames[secondFrame].pixels, P2.pixels);
  int black1=calcBlack(P1);
  int black2=calcBlack(P2);

  quickBlur(P1,maxBlur*sq(    p),22);
  quickBlur(P2,maxBlur*sq(1.0-p),22);
  imgToChannel(P1, C1);
  imgToChannel(P2, C2);

  autoLevelsChannel(C1,1.0/100.0);
  autoLevelsChannel(C2,1.0/100.0);

  img.loadPixels();
  float L=min(p,1.0-p)*255.0;
  float H=max(p,1.0-p)*255.0;

  int imgs=img.width*img.height;
  int ip=round(1024.0*p);
  for(int i=0;i<imgs;i++)
    pix[i]=imix(ip,1024, C1[i], C2[i] );
    //pix[i]=C1[i]; // first picture

  thresholdTo(pix,pix,(int)imix(ip,1024,black1,black2));
  arrayCopy(pix,shinePix);
  float chocolateBlur=2.5+sq(p*(1.0-p))*2.0*20.0;
  stackblurChannel(     pix,aaWidth,aaHeight,round(aaZoom*chocolateBlur)); // height map in chocolatify()
  stackblurChannel(shinePix,aaWidth,aaHeight,round(aaZoom*embossBlur   )); // embossed in chocolatify()

  img.loadPixels();
    //channelToImg(pix,img);
    chocolatifyChannelToImg(pix,shinePix,img);
  img.updatePixels();

  background(darkChocolateColor);
  smooth();
    image(img,(900-256)/2,0,originalWidth,originalHeight);
  noSmooth();
  iteration++;
  //save("img"+nf(iteration,4)+".tif");
}

float embossBlur=5;

////////// Image processing functions ///////////
void chocolatifyChannelToImg(int pix[],int shinePix[], PImage destImg){
  int chocogram[]=new int[256];
  for(int i=0;i<=255;i++){ float p=(float)i/255.0;
    color c=lerpColor(darkChocolateColor,lightChocolateColor,p);
    float cp=constrain(  (p-1.0)*8.0 +1.0 ,0.0,1.0);
    //c=lerpColor(c,shineChocolateColor, 1.0-sq(sq(1.0-cp)) );
    c=lerpColor(c,shineChocolateColor, 1.0-sq(sq(1.0-cp)) );
    chocogram[i]=c;
  }

  //stackblurChannel(destImg.pixels,aaWidth,aaHeight,round(aaZoom*1));
  int l=pix.length;
  int ed=(1+aaWidth*2); // emboss pixel position
  int le=l-ed;
  int p,c,s;
  int embossMul=round(aaZoom*embossBlur*4.0);
  for(int i=0;i<le;i++){
    //embossPix[i]=shinePix[i+0+aaWidth]+shinePix[i+1+aaWidth]+shinePix[i+1]-shinePix[i]*3;
    embossPix[i]=(shinePix[i+ed]-shinePix[i])*embossMul+128;
    p=embossPix[i]; if(p<0){p=0;}else if(p>255){p=255;} embossPix[i]=p;
  }
  for(int i=le;i<l;i++) embossPix[i]=128;

  stackblurChannel(embossPix,aaWidth,aaHeight,round(aaZoom*5));

  for(int i=0;i<l;i++){
    s=embossPix[i]-128;
    //if(s<0)s=0;
    c=255-pix[i]; // black->background, white->content
    p=(c*7+ s*1)/8;
    //p=(c*7+ (c>1?s*2:0)  )/8;
    //p=(c*7+ (255-c)*c*s/1500)/8;
    if(p<0){p=0;}else if(p>255){p=255;}
    //destImg.pixels[i]=chocogram[p];
    destImg.pixels[i]=p;
  }
  //stackblurChannel(destImg.pixels,aaWidth,aaHeight,round(aaZoom*1));
  for(int i=0;i<l;i++) destImg.pixels[i]=chocogram[destImg.pixels[i]];

  //for(int i=0;i<l;i++){ int p=(pix[i]*7+shinePix[i])/8; if(p<0){p=0;}else if(p>255){p=255;}  destImg.pixels[i]=chocogram[p]; }
}


void thresholdTo(int pix[], int destPix[], int blacks){
  int histogram[];
  histogram=new int[256];
  int l=pix.length;
  for(int i=0;i<l;i++) histogram[pix[i]]++;

  int C=0;
  int T=0;
  for(int i=0;i<256;i++){
    int h=histogram[i];
    if(C+h>blacks) break;
    C+=h; T=i;
  }

  for(int i=0;i<l;i++) destPix[i]=(pix[i]>T)?255:0;
  //for(int i=0;i<l;i++) destPix[i]=(pix[i]>T)?0xFFFFFFFF:0xFF000000;
  //for(int i=0;i<l;i++) destPix[i]=color(constrain((pix[i]-T)*64+128,0,255));
}

void channelToImg(int pix[], PImage destImg){
  int l=pix.length;
  for(int i=0;i<l;i++){ int p=pix[i]; if(p<0){p=0;}else if(p>255){p=255;} destImg.pixels[i]=0xFF000000 | p<<16 | p<<8 | p; }
}

void imgToChannel(PImage srcImg,int pix[]){
  int l=srcImg.width*srcImg.height;
  for(int i=0;i<l;i++) pix[i]=srcImg.pixels[i] &0xFF; // blue channel
}

int calcBlack(PImage img){
  int imgs=img.width*img.height;
  int blackCount=0;
  for(int i=0;i<imgs;i++) if((img.pixels[i] & 0xFF)<128) blackCount++;
  return blackCount;
}

PImage quickBlur(PImage img, float blurRadius, float overSampling){
  int ow=img.width;
  int oh=img.height;
  float zoom;
  int realBlurRadius;
  if(overSampling<blurRadius){        // no larger work image
    realBlurRadius=round(overSampling); // will be used as actual blur radius on the reduced image
    zoom=overSampling/blurRadius;     // work wh=original wh*zoom, actual blur radius=overSampling
  }else{
    realBlurRadius=round(blurRadius);
    zoom=1.0;
  }
  int w=max(1,round(ow*zoom));
  int h=max(1,round(oh*zoom));
  smooth();
  noSmooth();
  img.resize(w,h);
    int pix[]=new int[w*h];
    imgToChannel(img, pix);
    stackblurChannel(pix,w,h,(int)realBlurRadius);
    channelToImg(pix,img);
  img.resize(ow,oh);
  noSmooth();
  return img;
}

PImage autoLevelsChannel(int pix[], float clipPercent){
  int histogram[];
  histogram=new int[256];
  int imgs=pix.length;
  for(int i=0;i<imgs;i++) histogram[pix[i]&0xFF]++; // warning: clipping

  int clip=(int)(imgs*clipPercent);

  int C=0; int L=0;
  for(int i=0;i<=255;i++){ int h=histogram[i]; if(C+h>clip) break; C+=h; L=i; }

  C=0; int H=255;
  for(int i=255;i>=0;i--){ int h=histogram[i]; if(C+h>clip) break; C+=h; H=i; }

  int W=H-L;
  if(W<4){ int C2=H+L;
    W=max(  4,W);
    L=max(  0,(C2-W)/2);
    H=min(255,(C2+W)/2);
    W=H-L;
  }

  int P,COL;
  for(int i=0;i<imgs;i++){
    COL=(pix[i]-L)*255/W;
    if(COL<0){COL=0;}else if(COL>255){COL=255;}
    pix[i]=COL;
  }
  return img;
}


//////// Math functions //////////////////////////////////////////////
float fade01trig(float v){ return sin(2.0*PI*v + PI    )/(2.0*PI)+v; }
float fade01(float v){     return sin(    PI*v - PI/2.0)/2.0+0.5; }
float unease(float p,float mixp){ return mix(mixp,p,sin(2.0*PI*p)/(2.0*PI)+p); }
float mod(float v, float m){ v=v/m; return (v-floor(v))*m; }
float mix(float p,float a,float b){ return a*(1.0-p)+p*b; }
int imix(int p,int maxp,int a,int b){ return (a*(maxp-p)+p*b)/maxp; }
float sin1(float v){ return sin(2*PI*v); }
float cos1(float v){ return cos(2*PI*v); }
float cos11(float v){ return cos(2*PI*v)/2.0+0.5; }

//////////////////////////////////////////////////////////////////
// Stack Blur Algorithm by Mario Klingemann <mario@quasimondo.com>
void stackblurChannel(int pix[], int w, int h, int radius){
  if (radius<1) return;
  int wm=w-1;
  int hm=h-1;
  int wh=w*h;
  int div=radius+radius+1;
  int c[]=new int[wh];
  int csum,x,y,i,p,yp,yi,yw;
  int vmin[] = new int[max(w,h)];
  int divsum=(div+1)>>1;
  divsum*=divsum;
  int dv[]=new int[256*divsum];
  for (i=0;i<256*divsum;i++) dv[i]=(i/divsum);
  yw=yi=0;
  int[][] stack=new int[div][1];
  int stackpointer;
  int stackstart;
  int[] sir;
  int rbs;
  int r1=radius+1;
  int coutsum;
  int cinsum;
  for (y=0;y<h;y++){
    cinsum=coutsum=csum=0;
    for(i=-radius;i<=radius;i++){
      p=pix[yi+min(wm,max(i,0))];
      sir=stack[i+radius];
      sir[0]=p;
      rbs=r1-abs(i);
      csum+=sir[0]*rbs;
      if(i>0)  cinsum+=sir[0];
         else coutsum+=sir[0];
    }
    stackpointer=radius;
    for (x=0;x<w;x++){
      c[yi]=dv[csum];
      csum-=coutsum;
      stackstart=stackpointer-radius+div;
      sir=stack[stackstart%div];
      coutsum-=sir[0];
      if(y==0) vmin[x]=min(x+radius+1,wm);
      p=pix[yw+vmin[x]];
      sir[0]=p;
      cinsum+=sir[0];
      csum+=cinsum;
      stackpointer=(stackpointer+1)%div;
      sir=stack[(stackpointer)%div];
      coutsum+=sir[0];
      cinsum-=sir[0];
      yi++;
    }
    yw+=w;
  }
  for (x=0;x<w;x++){
    cinsum=coutsum=csum=0;
    yp=-radius*w;
    for(i=-radius;i<=radius;i++){
      yi=max(0,yp)+x;
      sir=stack[i+radius];
      sir[0]=c[yi];
      rbs=r1-abs(i);
      csum+=c[yi]*rbs;
      if(i>0)  cinsum+=sir[0];
         else coutsum+=sir[0];
      if(i<hm) yp+=w;
    }
    yi=x;
    stackpointer=radius;
    for (y=0;y<h;y++){
      pix[yi]=dv[csum];
      csum-=coutsum;
      stackstart=stackpointer-radius+div;
      sir=stack[stackstart%div];
      coutsum-=sir[0];
      if(x==0) vmin[y]=min(y+r1,hm)*w;
      p=x+vmin[y];
      sir[0]=c[p];
      cinsum+=sir[0];
      csum+=cinsum;
      stackpointer=(stackpointer+1)%div;
      sir=stack[stackpointer];
      coutsum+=sir[0];
      cinsum-=sir[0];
      yi+=w;
    }
  }
}

