
//import processing.opengl.*;

float mod(float v, float m){ v=v/m; return (v-floor(v))*m; }
float mix(float p,float a,float b){ return a*(1.0-p)+p*b; }
float scl(float p,float a,float b,float e,float f){ return (p-a)/(b-a)*(f-e)+e; }
float gauss(float x){ return exp(-x*x/2.0) / sqrt(2*PI); }
float gaussI(float z){ // integrated gauss [0..1]
  if(z<-8.0) return 0.0;
  if(z> 8.0) return 1.0;
  float sum=0.0, term=z;
  for (int i=3; sum+term!=sum; i+=2){
    sum =sum+term;
    term=term*z*z/i;
  }
  return 0.5+sum*gauss(z);
}
float gaussE(float z){ return gaussI(z)*2-1; }// gauss error func==> [-1..0..1]
float fade01trig(float v){ return sin(2.0*PI*v+PI)/(2.0*PI)+v; }
float fadealpha01(float p){ return sin(PI*p-PI/2.0)/2.0+0.5; }
float randomGauss(){ float x=0,y=0,r,c;
  do{ x=random(-1.0,1.0); y=random(-1.0,1.0);  r=x*x+y*y; }while(r==0 || r>1);
  c=sqrt(-2.0*log(r)/r);  return x*c; //return [x*c, y*c];
}
float randomGaussIn(float L, float H, float mul){ return constrain( randomGauss()*(H-L)*mul + (L+H)/2.0  ,L,H);  }
float randomGaussAt(float L, float H, float mul){ return randomGauss()*(H-L)*mul + (L+H)/2.0;  }
float sin1(float v){ return sin(2.0*PI*v); }
float cos1(float v){ return cos(2.0*PI*v); }
float sin2(float v){ return sin(PI*v); }
float cos2(float v){ return cos(PI*v); }
/////////////////////////////////////////////
class Spiral {
  float reduction;
  float xx;
  float y0,y1;
  float phase,speed;
  float shapeTwistUniform,shapeTwistTop,shapeTwistBottom,shapeTwistPos;
  float[] shape; // twist angles vertically
  final int shapeSliceMax=1000;
  float shapeWidth;
  float colornoiseshift;
  int ind;
  PImage img;
  Spiral(int aind, PImage aimg, float axx){
    img=aimg;
    ind=aind;
    reduction=6.0/(6.0+ind);
    shapeWidth=100.0*reduction;
    xx=axx;
    y0=0.0;
    y1=mix(0.9,height,height*reduction);
    phase=1.0;
    speed=random(-0.1,0.1);
    shapeTwistUniform =random(-0.0,0.6);
    shapeTwistBottom  =random(-0.5,0.5);
    shapeTwistTop     =random(-1.0,1.0);
    shapeTwistPos     =random( 0.0,1.0);
    colornoiseshift=random(1000);
    shape=new float[shapeSliceMax+1+4];
    for(int i=0;i<shapeSliceMax+4;i++){ float yp=scl(i,0+2,shapeSliceMax+2,0.0,1.0);
      shape[i]=0.0
               +shapeTwistUniform*yp
               //+shapeTwistBottom*(pow(yp,shapeTwistPos)*pow(1-yp,1.0-shapeTwistPos))
               +shapeTwistBottom *pow(  yp,4)
               //+shapeTwistTop    *pow(1-yp,4)
             ;
    }
  }
  float getAngle1(float yp){ return phase+ shape[round(yp*shapeSliceMax)];}
  float getSin(float yp){ return sin1(getAngle1(yp)); }
  float getSinDerivated(float yp){
    int i=round(yp*shapeSliceMax);
    //return (shape[i+1]-shape[i])*shapeSliceMax;
    return (sin1(phase+shape[i+1])
           -sin1(phase+shape[i  ]))*shapeSliceMax;
  }

  void updateMouse(){
    int i=5+ind*3; // air distance -> delay
    if(pminited){
      float d=getPM(i+1).x-getPM(i).x;
      float x=getPM(i).x;
      speed+=abs(1.0/(1.0+150.0*sq((xx-x)/width))*d/width)*0.2;
    }
    speed=speed*0.95;
    phase+=speed;
  }
    void draw(){
    float xp,yp,w,d,angle,mirrorangle,x0,x1, iw,ih;
    int y,yl,yh, x,xl,xh;
    iw=img.width; ih=img.height;
    yl=floor(y0); yh=ceil(y1);
    float rr,gg,bb,cmin,cmax,cmul,cmulbase;
    cmulbase=(1.0-1.0*ind/nn); // farther->darker
    cmulbase*=fade01trig(constrain(time/30.0-ind/5.0,0.0,1.0)); // fade in, by depth
    for(y=yl;y<yh;y++){ yp=scl(y,y0,y1,0.0,1.0);
      angle=getAngle1(yp);
      mirrorangle=mod(angle*2.0,1.0); // 0=left 0.5=front 1=right
      w=abs(getSin(yp));
      w=w*shapeWidth;
      //w=w*(sqrt(1.0-yp));
      //w=w*pow(4.0*(1.0-yp)*(yp) ,1.0/4.0);
      w=w*pow(1.5-yp ,1.0/1.5); // general shape
      w=w*pow(1.0-yp ,1.0/8.0); // soft bottom rounding
      //w=w*pow(    yp ,1.0/8.0); // soft top rounding
      d=getSinDerivated(yp);

      rr=noise(yp/14.0,1+colornoiseshift+mirrorangle*2.0,time/1000.0);
      gg=noise(yp/14.0,2+colornoiseshift+mirrorangle*2.0,time/1000.0);
      bb=noise(yp/14.0,3+colornoiseshift+mirrorangle*2.0,time/1000.0);
      //cmin=min(rr,gg,bb);  //cmax=max(rr,gg,bb); <-- too sharp color transitions
      cmin=0.3;
      cmax=0.5;
      cmul=cmulbase*mix(1.0,1.0,1.0-((1.0-sin2(mirrorangle)))  ); // front->shiny edge->dark
      rr=constrain(scl(rr,cmin,cmax,128.0*cmul,255.0*cmul),0.0,255.0);
      gg=constrain(scl(gg,cmin,cmax,128.0*cmul,255.0*cmul),0.0,255.0);
      bb=constrain(scl(bb,cmin,cmax,128.0*cmul,255.0*cmul),0.0,255.0);
      color cm=color(rr,gg,bb);
      color c;

      x0=xx-w;  x1=xx+w;  xl=floor(xx-w);  xh=ceil(xx+w);
      final float border=0.1;
      float iyp=ih*scl(yp,0.0,1.0,  border,1.0-border); // image y position, to avoid top/bottom clipping
      d=atan(d/10.0)/(PI/2)*ih*border; // reflection tilting amount
      //d=d*40.0; // reflection tilting amount
      for(x=xl;x<xh;x++){
        xp=scl(x,x0,x1,0.0,1.0);
        c=img.get(floor( iw*mix(0.8,xp,mirrorangle) ),
                  floor( iyp-(xp-0.5)*d ));
        c=blendColor(c,cm,MULTIPLY);
        set(x,y, c);
      }
    }
  }
}
//////////////////////////////////////////////
ArrayList pm;
PVector getPM(int i){ return (PVector)pm.get(i); }
boolean pminited=false;
float time;
int nn=10;
int Wi,Hi;
//String[] imgfiles={"IMG_7990.JPG","IMG_8006.JPG","IMG_8172.JPG"};
String[] imgfiles={
//"hajmasker1.jpg","IMG_6901.jpg","IMG_7085.jpg","IMG_7020.jpg","IMG_6956.jpg","IMG_6966.jpg","IMG_6902.jpg"};
"IMG_6918.jpg","IMG_6939.jpg","IMG_6956.jpg","IMG_6966.jpg","IMG_6989.jpg","IMG_7020.jpg","IMG_7085.jpg","IMG_7129.jpg","IMG_7990.jpg","IMG_8172.jpg","IMG_8951.jpg","IMG_9388.jpg","IMG_9471.jpg","IMG_6902.jpg"
};

PImage[] img;
Spiral[] s;

float minDistance(float x){
  float d=666666.0;
  for(int i=0;i<s.length;i++){ if(s[i]!=null) d=min(d,abs(x-s[i].xx)); }
  return d;
}
float getBestX(){
  float bestd=0.0;
  float x,d,bestx=0.0;
  for(int i=0;i<4;i++){
    x=random(50.0,width-50.0);
    d=minDistance(x);
    if(d>bestd){ bestd=d; bestx=x; }
  }
  return bestx;
}
void initSpirals(){
  int ii=floor(random(img.length));
  s=new Spiral[nn];
  for(int i=0;i<nn;i++){ s[i]=new Spiral(i,img[(i+ii)%img.length],getBestX()); }
  time=0.0;
}

void setup(){
  Wi=screen.width; Hi=screen.height/2-80;
  //Wi=1680+1920; Hi=1920;
  if(online){ Wi=900; Hi=600; }
  Wi=900; Hi=600;
  //size(Wi, Hi, P2D);
  size(Wi, Hi, P3D);
  // size(Wi, Hi, OPENGL);
  background(0);
  img=new PImage[imgfiles.length];
  for(int i=0;i<img.length;i++){ img[i]=loadImage(imgfiles[i]); }
  initSpirals();
  pm=new ArrayList();
}

void draw(){
  if(mouseX!=0.0){
    pminited=true;
    while(pm.size()<100*nn) pm.add(0, new PVector(mouseX,mouseY)); //fill mouse
  }
  //for(int i=0;i<pm.size();i++){ println(getPM(i).x); }
  background(0);
  loadPixels();
  time+=1.0;
  for(int i=nn-1;i>=0;i--){
    s[i].updateMouse();
    s[i].draw();
  }
  if(pminited) pm.remove(pm.size()-1);
  if(pminited) pm.add(0, new PVector(mouseX,mouseY));
  updatePixels();
}

void mousePressed(){
  initSpirals();
}

