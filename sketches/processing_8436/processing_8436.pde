
// int imix(int p,int maxp,int a,int b){ return (a*(maxp-p)+p*b)/maxp; }
// int iscl(int p,int a,int b,int e,int f){ return (p-a)*(f-e)/(b-a)+e; }
   int imix(int p,int maxp,int a,int b){ return (a*(maxp-p)+p*b +maxp/2)/maxp; }
   int iscl(int p,int a,int b,int e,int f){ return ((p-a)*(f-e)+(b-a)/2)/(b-a)+e; }
// int imix(int p,int maxp,int a,int b){ return (a*(maxp-p)+p*b +maxp-1)/maxp; }
// int iscl(int p,int a,int b,int e,int f){ return ((p-a)*(f-e)+(b-a)-1)/(b-a)+e; }
//float mix(float p,float a,float b){ return a*(1.0-p)+p*b; }
float mix(float p,float a,float b){ return a+p*(b-a); } //faster
float mod(float v, float m){ v=v/m; return (v-floor(v))*m; }
float mod(float v, float L,float H){ float m=H-L; v=(v-L)/m; return (v-floor(v))*m+L; }
boolean between(float a,float l,float h){ return (l<=a)&&(a<=h); }
boolean between(  int a,  int l,  int h){ return (l<=a)&&(a<=h); }
float getZFromHalfHeight(float h){ PGraphics3D g3=((PGraphics3D)g);
  float vfov=tan(g3.cameraFOV/2f);
  return (-h/vfov + g3.cameraZ);
}
float getHalfHeightFromZ(float z){ PGraphics3D g3=((PGraphics3D)g);
  float vfov=tan(g3.cameraFOV/2f);
  return -(z - g3.cameraZ)*vfov;
}

//import processing.opengl.*;
import pogg.*;

TheoraMovie myMovie;
PImage projImg,projImgBlur,projImgDot;
PFont font;
AirFont A[];
int finishTime;
int fps=16;
int lastParticleNum=5000;
boolean showGlow=true;
boolean showScreen=false;
boolean showProjector=true;
boolean highQuality=false;
boolean paused=false;

void setup(){
  //size(1920,1100,P3D);
  //size(1280,720,P3D);
  size(840,360,P3D);
  //size(840,840,P3D);
  hint(DISABLE_OPENGL_2X_SMOOTH);
  hint(DISABLE_DEPTH_TEST);
  hint(DISABLE_OPENGL_ERROR_REPORT);

  aspectRatio=1f*width/height;
  HH=height/2; //height half

  font=createFont("",14,true);
  initAir();
  A=new AirFont[30000];
  for(int i=0;i<A.length;i++) A[i]=new AirFont(i);

  background(0);
  finishTime=millis()+1000/fps; // time to finish drawing
  
  myMovie = new TheoraMovie(this, "superman_cut3.ogg");
  myMovie.loop();
  //projImg=loadImage("tokyo-tower.jpg");
}

void draw(){
  if(highQuality) smooth(); else noSmooth();
  if(!paused) myMovie.read();
  projImg = myMovie;

  projImgBlur=projImg.get();
  //projImgBlur.filter(BLUR,3);
  projImgBlur.blend(projImgBlur ,0,0,projImgBlur.width,projImgBlur.height ,0,0,projImgBlur.width,projImgBlur.height ,SCREEN);
  projImgBlur.blend(projImgBlur ,0,0,projImgBlur.width,projImgBlur.height ,0,0,projImgBlur.width,projImgBlur.height ,ADD);

  if(!paused) frameBrightness = random(0.8,1); //movie flicker

  //placing the projector window at left
//   projZ=map(sin(frameCount/50f)/1f,  -1,1,  0,1);
   projZ=map( (mouseX!=0)?mouseX:width/2 ,0,width ,0,1);
//   projZ=map( (noise(frameCount/50f)-0.5)*3f,  -1,1,  0,1);
//   projZ=((int)(projZ*6f))/6f; // number of projector windows
//   projZ=(projectorWindow)/6f; // number of projector windows
  projZ=map(projZ, 0,1, ZL,ZH);
  //if(random(0,100)<1) projZ = map(round(random(0,6)), 0,6, ZL,ZH);
  //if((frameCount-1)%50==0) projZ = map(round(random(1,5)), 0,6, ZL,ZH);
  //projZ=map( (noise(frameCount/10f)<0.5?-1:+1)/2f,-1,1,ZL,ZH);

  //projY=map(cos(frameCount/100f),-1,1,YL,YH);
  projY=YL;
  projX=XL-(XH-XL)*0.15;

  boolean showExtras = (showProjector)||(showScreen);
  PImage glow=null;

  if(showGlow){ // then pre-render particles + glow, and store the result
    background(0);
    doParticles();
    glow = doGlow(showExtras); // no extras -> no copy of stage
  }

  if(!showGlow || showExtras){ // then we need new background
    projImgDot=projImg.get(); projImgDot.resize(3,3); int dotc=projImgDot.get(1,1);
    background( red(dotc)*0.03*frameBrightness,  green(dotc)*0.03*frameBrightness,  blue(dotc)*0.03*frameBrightness );
  }
  if(showExtras){
    noStroke();
    pushMatrix(); translate(width/2,height/2,0);
      //draw projector window glass
      if(showProjector){
        pushMatrix();
          float PWX=map(XL,projX,screenX,0,1);
          translate(XL,mix(PWX,projY,YL),-mix(PWX,projZ,ZL));
          rotateY(radians(-90));
          imageMode(CORNER);
          tint(255,255);
          //tint(255*frameBrightness ,255);
          float piW = mix(PWX,projZ,ZH)-mix(PWX,projZ,ZL);
          float piH = mix(PWX,projY,YH)-mix(PWX,projY,YL);
          image(projImgBlur, -piW,0 ,piW,piH );
        popMatrix();
      }

      //draw screen
      if(showScreen){
        pushMatrix();
          translate(screenX,YL,-ZL);
          rotateY(radians(-90));
          imageMode(CORNER);
          tint(255*brighnessMulAtScreen*frameBrightness ,255);
          float siW = ZH-ZL;
          float siH = YH-YL;
          translate(-siW,0);
          PImage screenImg=projImg.get();
          //screenImg.blend(screenImg ,0,0,screenImg.width,screenImg.height ,0,0,screenImg.width,screenImg.height ,MULTIPLY);
          image(screenImg, 0,0 ,siW,siH);
          //slicedVImage(screenImg,siW,siH);
        popMatrix();
      }
    popMatrix();
  }

  if(!showGlow){ // draw plain particles
    doParticles();
  }else if(showGlow && showExtras){ // draw prepared glowing particles over extras
    blend(glow, 0,0,glow.width,glow.height, 0,0,glow.width-1,glow.height-1, ADD);
  }else{ // if(showGlow && !showExtras){
    ; // glowing particles still on screens
  }
}

void doParticles(){
  pushMatrix(); translate(width/2,height/2,0);
    noStroke();
    int minParticleNum = max(500,round(lastParticleNum*0.9));
    int maxParticleNum = min(A.length,round(lastParticleNum*1.1));
    for(lastParticleNum=0; lastParticleNum < maxParticleNum; lastParticleNum++){
      if(!paused) A[lastParticleNum].iterate();
      A[lastParticleNum].draw();
      if(lastParticleNum > minParticleNum) if(lastParticleNum % 16==0) if(millis() > finishTime){ break; }
    }
    if(!online) println(lastParticleNum+"   "+minParticleNum+"   "+maxParticleNum+"   "+fps+"   "+round(frameRate)+"   "+millis()+"   "+finishTime);
    finishTime = millis()+1000/fps; // time to finish drawing
  popMatrix();
}

PImage doGlow(boolean needResult){
  myInitLUT();
  PImage glow = get();
  glow = myResizeForGlow(glow,4);
  glow.filter(BLUR,1);
  myLUT(glow,lut2);
  //glow.blend(glow, 0,0,glow.width,glow.height, 0,0,glow.width,glow.height, ADD);
  blend(glow, 0,0,glow.width,glow.height, 0,0,width,height, ADD);
  if(needResult) return get(); else return null;
}

int lut1[],lut2[];
void myInitLUT(){
  lut1=new int[256];
  for(int i=0; i<256; i++){
    float x=i/256f;
    x=max(0,mix(x,1f-particleSize,1f));
    x=1-x;
    x=x*x;
    x=x*x;
    x=x*x;
    x=1-x;
    lut1[i]=round(255*(x));
  }
  lut2=new int[256];
  for(int i=0; i<256; i++){
    float x=i/256f;
    x=max(0,mix(x,0f,1f));
    x=1-x;
    x=x*x;
    x=1-x;
    lut2[i]=round(255*(x));
  }
}

void myLUT(PImage img, int lut[]){
  int r,g,b;
  int pixels[] = img.pixels;

  int len=pixels.length;
  int rgb;
  for(int i=0; i<len; i++){
    rgb = pixels[i];
    r=lut[(rgb & 0x00FF0000)>>16];
    g=lut[(rgb & 0x0000FF00)>> 8];
    b=lut[(rgb & 0x000000FF)    ];
    pixels[i] = 0xFF000000 | (r<<16) | (g<<8) | (b);
  }
}

PImage myResizeForGlow(PImage src,int z){
  int iw = src.width;
  int ih = src.height;
  int ow = src.width /z;
  int oh = src.height/z;
  int r,g,b,pi,po;
  int zz=z*z;
  PImage img = createImage(ow,oh,RGB);
  int  inPixels[] = src.pixels;
  int outPixels[] = img.pixels;

  for(  int oy=0; oy<oh; oy++){
    for(int ox=0; ox<ow; ox++){
      r=0;g=0;b=0;
      pi = z*(iw*(oy)+(ox));
      po =   (ow*(oy)+(ox));
      for(  int iy=0; iy<z; iy++){
        for(int ix=0; ix<z; ix++){
          int rgb = inPixels[pi+ix];
          r += lut1[(rgb & 0x00FF0000)>>16];
          g += lut1[(rgb & 0x0000FF00)>> 8];
          b += lut1[(rgb & 0x000000FF)    ];
        }
        pi+=iw;
      }
      r=(r+zz/2)/zz;
      g=(g+zz/2)/zz;
      b=(b+zz/2)/zz;
      outPixels[po] = 0xFF000000 | (r<<16) | (g<<8) | (b);
    }
  }
  return img;
}

void slicedVImage(PImage img,float ww, float hh){
  int w=floor(ww);
  int h=floor(hh);
  int slices=20;
  PImage sImg;
  int sh =round(1f*h/slices);
  int shi=round(1f*img.height/slices);
  for(int i=0; i<slices; i++){
    int sy =round(map(i, 0,slices, 0,h));
    int syi=round(map(i, 0,slices, 0,img.height));
    sImg=img.get(0,syi,w,shi);
    image(sImg,0,sy,w,sh);
  }
}
void slicedHImage(PImage img,float ww, float hh){
  int w=floor(ww);
  int h=floor(hh);
  int slices=2;
  PImage sImg;
  int sw =round(1f*w/slices);
  int swi=round(1f*img.width/slices);
  for(int i=0; i<slices; i++){
    int sx =round(map(i, 0,slices, 0,w));
    int sxi=round(map(i, 0,slices, 0,img.width));
    sImg=img.get(sxi,0,swi,h);
    image(sImg,sx,0,sw,h);
  }
}

String letters="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
//String letters="abcdefghijklmnopqrstuvwxyz";
float aspectRatio;
float frameBrightness=1f;
float brighnessMulAtScreen=0.7;
int particleSize=4;
float HH; //height half
float XL,XH,XC,YL,YH,YC,ZL,ZH,ZC;
float projZ,projY,projX,screenX;
void initAir(){
  XL     =HH* -aspectRatio; // left
  XH     =HH* +aspectRatio*1.1; // right, +aspectRatio=projection screen touching right edge
  screenX=HH* +aspectRatio;
  YL=HH*-1f; //top y
  YH=HH*+1f; //bottom y
  ZL=HH*0f;  // near
  ZH=HH*2f;  // far
  XC=HH*(XL+XH)/2f;
  YC=HH*(YL+YH)/2f;
  ZC=HH*(ZL+ZH)/2f;
}

class AirFont {
  float x,y,z; // 3d coordinates
  float rx,ry,rz; // rotation positions
  float rsx,rsy,rsz; // rotation speeds
  float zoom;
  int smokeIndex=0;
  int index=0;
  String txt;


  void draw(){
    if(smokeIndex < 0){ smokeIndex += 5; return; }
    int c;
    float x01=map(x,projX,screenX,0,1);
    int imgX=round(map(
      z
      ,mix(x01,projZ,ZL)
      ,mix(x01,projZ,ZH)
      ,projImg.width,0 // horizontal mirror
    ));
    int imgY=round(map(
      y
      ,mix(x01,projY,YL)
      ,mix(x01,projY,YH)
      ,0,projImg.height
    ));
    if( !between(imgX,0,projImg.width) || !between(imgX,0,projImg.width) ) return;
    c=projImg.get(imgX,imgY);

    //if(brightness(c)<20)return;
    //c=color((  1-(dist(y,z,0,1))  )*(1.01)*255);
    //c=color( mix(noise(x*14,y*14,z*14),-2*255,3*255) );
    //c=color( map(sin((y/(x+2.1)+frameCount/150f)*10) ,-1,1, -1.5*255,1.5*255) );
    //c=color(25);
    boolean needDraw=true;
    pushMatrix();
      translate(x,y,-z);
      rotateX(rx);rotateY(ry);rotateZ(rz);

      float nX = abs(modelX(0,0,0) - modelX(0,0,1));
      //nX=1f-sq(1f-nX);
      float brighnessMul = brighnessMulAtScreen * sq(XH-projX)/sq(x-projX);
      brighnessMul *= nX*frameBrightness;
      float r1 =   red(c)*brighnessMul;
      float g1 = green(c)*brighnessMul;
      float b1 =  blue(c)*brighnessMul;
//       float maxChannel = min(255,max(r1,g1,b1)); //brightest
//       if(maxChannel<1) needDraw=false;
//       r1 *=  255f/maxChannel;
//       g1 *=  255f/maxChannel;
//       b1 *=  255f/maxChannel;
//       c=color(r1,g1,b1, maxChannel);
      c=color(r1,g1,b1);

      //c=lerpColor(0xFF000000,c,brighnessMul);
      //c=c&0x80FFFFFF;
      //if(brightness(c)<20) needDraw=false;

      //c=0xFFFFFFFF; needDraw=true; // show all in white

      if(needDraw){
        fill(c);
        textFont(font);
        textMode(MODEL);
        textAlign(CENTER,CENTER);

        //scale(zoom);
        //scale(0.5f);
        //text(txt,0,0,0);
        //rectMode(CENTER);rect(0,0,8,8);
        triangle(0,-particleSize,  -particleSize,+particleSize,  +particleSize,+particleSize);
      }
    popMatrix();
  }

  void iterate(){ float M;
    if(smokeIndex<0) return;
//     M=0.01;
//     x  +=random(-1f,+1f)*M;
//     y  +=random(-1f,+1f)*M;
//     z  +=random(-1f,+1f)*M;
//     M=0.04; float d=frameCount/100f;
//     x  +=(noise(x+d,y,z)-0.5)*M;
//     y  +=(noise(y,z+d,x)-0.5)*M;
//     z  +=(noise(z,x,y+d)-0.5)*M;
    if(mouseY==0) mouseY=width*50/1000;
    M=HH*map(mouseY,0,height,0,0.1);
    //M=0;// no motion
    float d =PI/HH*1.2f;
    float d1=-PI/HH*1.7f;
    float d2=PI*frameCount/200f;
    float x0=x;
    float y0=y;
    float z0=z;
    x  +=(sin(d*y0+d1*z0 +d2))*M;
    y  +=(sin(d*z0+d1*x0 +d2))*M;
    z  +=(sin(d*x0+d1*y0 +d2))*M;

    x  =mod(x,XL,XH);
    y  =mod(y,YL,YH);
    z  =mod(z,ZL,ZH);

    M=0.15;
    //M=0;// no rotation
    rx +=rsx*M;
    ry +=rsy*M;
    rz +=rsz*M;
    M=0.001;
    rsx+=random(-1f,+1f)*M;
    rsy+=random(-1f,+1f)*M;
    rsz+=random(-1f,+1f)*M;
  }

  AirFont(int aIndex){
    index=aIndex;
    initDefault();
    initSmoke();
  }
  void initDefault(){
    smokeIndex=0;
    txt=""+letters.charAt(floor( random(0,letters.length()) ));
    zoom=random(0.3,1.0);
      x=random(XL,XH);
      y=random(YL,YH);
      z=random(ZL,ZH);
     rx=random(-1f,+1f);
     ry=random(-1f,+1f);
     rz=random(-1f,+1f);
    rsx=random(-1f,+1f);
    rsy=random(-1f,+1f);
    rsz=random(-1f,+1f);
  }
  void initSphere(){
    x=random(-1,+1);
    y=random(-1,+1);
    z=random(-1,+1);
    float rad=1f/mag(x,y,z)*0.9;
    x=map(x*rad, -1,+1, XH,XH-(YH-YL))  -(XH-XL)*0.1;
    y=map(y*rad, -1,+1, YL,YH);
    z=map(z*rad, -1,+1, ZL,ZH);
  }
  void initCube(){
    x=random(-1,+1);
    y=random(-1,+1);
    z=random(-1,+1);
    float rad=1f/max(abs(x),abs(y),abs(z))*0.7;
    x=map(x*rad, -1,+1, XH-(YH-YL),XH);
    y=map(y*rad, -1,+1, YL,YH);
    z=map(z*rad, -1,+1, ZL,ZH);
  }
  void initScreen(){
    //x=mix(0.02, mix(0.99,XL,XH), random(XL,XH));
    x=screenX;
    rx=radians(0);
    ry=radians(90);
    rz=radians(0);
  }
  void initSmoke(){
    smokeIndex=-index;
    float m=0.09;
    x=random(-1,+1)*m;
    y=random(-1,+1)*m;
    z=random(-1,+1)*m;
    x=map(x, -1,+1, XH,XH-(YH-YL)) -(XH-XL)*0.3;
    y=map(y, -1,+1, YL,(YL+YH)/2f);
    //y=map(y, -1,+1, YL,YH);
    z=map(z, -1,+1, ZL,ZH);
  }
}

void keyPressed(){
  if(key==CODED){
    if(1==2){
    }else if(keyCode==LEFT ){ particleSize= max(  1,particleSize-1);
    }else if(keyCode==RIGHT){ particleSize= min(999,particleSize+1);
    }else if(keyCode==DOWN ){ fps=max(  1,fps-1);
    }else if(keyCode==UP   ){ fps=min(999,fps+1);
    }else if(keyCode==java.awt.event.KeyEvent.VK_PAGE_DOWN ){ 
    }else if(keyCode==java.awt.event.KeyEvent.VK_PAGE_UP   ){ 
    } 
  }else if(key=='1'){  for(int i=0;i<A.length;i++){ A[i].initDefault(); }
  }else if(key=='2'){  for(int i=0;i<A.length;i++){ A[i].initDefault();  A[i].initScreen(); }
  }else if(key=='3'){  for(int i=0;i<A.length;i++){ A[i].initDefault();  A[i].initCube(); }
  }else if(key=='4'){  for(int i=0;i<A.length;i++){ A[i].initDefault();  A[i].initSphere(); }
  }else if(key=='5'){  for(int i=0;i<A.length;i++){ A[i].initDefault();  A[i].initSmoke();}
  }else if(key=='s'){  showScreen=!showScreen;
  }else if(key=='p'){  showProjector=!showProjector;
  }else if(key=='g'){  showGlow=!showGlow;
  }else if(key=='q'){  highQuality=!highQuality;
  }else if(key==' '){  paused=!paused;
  }
  //redraw();
}
void keyReleased(){
}

