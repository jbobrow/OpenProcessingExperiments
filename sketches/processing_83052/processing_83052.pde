
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.signals.*;

Minim minim;
AudioInput in;
FFT fft;

float loudestFreqAmp = 0;
float loudestFreq = 0;
int timerCounter = 0;

PImage img,oriimg;
int qr[];
int WH,HW;
int qri=0;
int lineY[];
int W,H;
void setup(){
  size(1280,720);
  frameRate(260);
  
  minim = new Minim(this);
 minim.debugOn();
 
 
  in = minim.getLineIn(Minim.STEREO, 1024);
 fft = new FFT(in.bufferSize(), in.sampleRate());

 
  W=round(width /2f);
  H=round(height/4f);
 
  img=createImage(W,H,RGB);
  for(int y=0;y<H;y++)
  for(int x=0;x<W ;x++) img.set(x,y,color(random(255),random(255),random(255)));
 
img=loadImage("1.jpg");  img.resize(W,H);

 
  oriimg=createImage(img.width,img.height,RGB);
  oriimg.set(0,0,img);
 
  qr=new int[0xFF+1];
  for(int i=0;i<qr.length;i++) qr[i]=1+floor(random(HW*500)/1000*WH);
 
  lineY=new int[H];
  for(int i=0;i<H;i++) lineY[i]=round(1f*W/2 + sin(1f*i/6f)*10f );
 
  image(img,0,0,width,height);
}
 
void mousePressed(){
  img.set(0,0,oriimg);
  noTint();
  image(img,0,0,width,height);
}
 
//boolean sortHappens;
void draw(){
  noSmooth();
  //smooth();
  //noTint();
  tint(WH*4,HW);
  image(img,0,0,width,height);
  //sortHappens=false;
  
  
  
  
  
  if(millis()>WH)
    for(int i=0;i<1;i++){
      //sortXY0011();
      //sortXY0110();
      sortX();
      sortY();
    }
}
 
void sortX(){
  color a,b;
  int forbid;
  
  fft.window(FFT.HAMMING);
 for(int i = 0; i < fft.specSize(); i++)
 {
   // draw the line for frequency band i, scaling it by 4 so we can
   //see it a bit better
   //line(i, height, i, height - fft.getBand(i)*4);
   if (fft.getBand(i) > loudestFreqAmp && fft.getBand(i) > 10)
   {
     loudestFreqAmp = fft.getBand(i);
     loudestFreq = i * 4;
     //sine.setFreq(loudestFreq);
     
     if(loudestFreq < 25)
     {
       WH=int(loudestFreq);
     }
     else
     {WH=int(loudestFreqAmp);}
     timerCounter = 0;
   }
 }
 loudestFreqAmp = 0;

 // draw the waveforms
 /*  for(int i = 0; i < in.bufferSize() - 1; i++)
  {
  line(i, 50 + in.left.get(i)*50, i+1, 50 + in.left.get(i+1)*50);
  line(i, 150 + in.right.get(i)*50, i+1, 150 + in.right.get(i+1)*50);
  }*/

 fft.forward(in.mix);
 timerCounter++;
 if(timerCounter >= 90)
  
  
  for(  int y=0;y<H  ;y++){
    for(int x=0;x<W-1;x++){
      a=img.get(x  ,y);
      b=img.get(x+1,y);
      //if(saturation(a)<hue(b)){
      //if(  (red(a)<blue(b))^(green(a)>blue(b)) ){
      if(  (brightness(a)<green(b))^( x>lineY[y] )^( 8<(y&31))  ){
        //sortHappens=true;
        img.set(x  ,y,b);
        img.set(x+1,y,a);
        //x++;
        x+=qr[qri];  qri=(qri+1) & 0xFF;
      }
    }
  }
}
void sortY(){
  color a,b;
  for(  int x=0;x<W  ;x++){
    for(int y=0;y<H-1;y++){
      a=img.get(x,y  );
      b=img.get(x,y+1);
      if(  (brightness(a)>brightness(b))   ){
        //sortHappens=true;
        img.set(x,y  ,b);
        img.set(x,y+1,a);
        //y++;
        y+=qr[qri];  qri=(qri+1) & 0xFF;
      }
    }
  }
  
  
    fft.window(FFT.HAMMING);
 for(int i = 0; i < fft.specSize(); i++)
 {
   // draw the line for frequency band i, scaling it by 4 so we can
   //see it a bit better
   //line(i, height, i, height - fft.getBand(i)*4);
   if (fft.getBand(i) > loudestFreqAmp && fft.getBand(i) > 10)
   {
     loudestFreqAmp = fft.getBand(i);
     loudestFreq = i * 4;
     //sine.setFreq(loudestFreq);
     
     if(loudestFreq < 25)
     {
       HW=int(loudestFreq);
     }
     else
     {HW=int(loudestFreqAmp);}
     timerCounter = 0;
   }
 }
 loudestFreqAmp = 0;

 // draw the waveforms
 /*  for(int i = 0; i < in.bufferSize() - 1; i++)
  {
  line(i, 50 + in.left.get(i)*50, i+1, 50 + in.left.get(i+1)*50);
  line(i, 150 + in.right.get(i)*50, i+1, 150 + in.right.get(i+1)*50);
  }*/

 fft.forward(in.mix);
 timerCounter++;
  
  
  
}
void sortXY0011(){
  color a,b;
  for(  int x=0;x<W-1;x++){
    for(int y=0;y<H-1;y++){
      a=img.get(x  ,y  );
      b=img.get(x+1,y+1);
      if(red(a)<green(b)){
        //sortHappens=true;
        img.set(x  ,y  ,b);
        img.set(x+1,y+1,a);
      }
    }
  }
}
void sortXY0110(){
  color a,b;
  for(  int x=0;x<W-1;x++){
    for(int y=0;y<H-1;y++){
      a=img.get(x+1,y  );
      b=img.get(x  ,y+1);
      if(brightness(a)<brightness(b)){
        //sortHappens=true;
        img.set(x+1,y  ,b);
        img.set(x  ,y+1,a);
      }
    }
  }
}



