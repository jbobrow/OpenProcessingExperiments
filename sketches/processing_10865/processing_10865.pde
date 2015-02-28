
float mix(float p,float a,float b){ return a*(1.0-p)+p*b; }
float mod(float v, float m){ v=v/m; return (v-floor(v))*m; }

float nonlin(float v){
  //v= sq(sq(v+0.1)-0.35);  // vuvu harmonics from sine
  v= sq(sq(v+0.08)-0.35);  // vuvu harmonics from sine
  v=(pow(5,v)-1)/4;
  v=(pow(4,v)-1)/3;
  v=(pow(3,v)-1)/2;
  v=(pow(2,v)-1)/1;
  //v= v/2f + v*v*v;
  //v= v + v*v*v;
  v=v*4f;
  //v= v/2f + v*v*v*v*v/64f;
  //v= v* noise(ttt*300f);
  //v= noise(ttt*300f);
  return v;
}
class AvgRand {
  float x=0;
  float get(float p,float L, float H){
    x=mix(p,x,random(L,H));
    return x;
  }
}
class AvgNoise {
  float x=0;
  float t=0;
  float get(float p,float d){
    x=mix(p,x,noise(t));
    t+=d;
    return x;
  }
}
class Brownie {
  float x=0;
  float t=0;
  float get(float L, float H){
    float xx;
    do{ xx=(x+random(-1,+1));
    }while((xx<L)||(H<xx) );
    x=xx;
    return x;
  }
}

boolean stopped=false;
boolean silenced=false;
float rr=0;
float ttt=0;
float tL=0;
float tR=0;
float PI2=2f*PI;
float freqTrigStep= PI2*  (235f)/(44100f);
int cLen=2048;
int ci=0;
float cL[], cR[];  // chorus
float chMixTarget=0.4;
float chMix=0.4;
// AvgNoise arl = new AvgNoise();
// AvgNoise arr = new AvgNoise();
Brownie arl = new Brownie();
Brownie arr = new Brownie();

float interpolate(float a[], float x){
  int i=floor(x);
  float p=x-i;
  return mix(p, a[i%a.length], a[(i+1)%a.length] );
}

class VuvuzelaSignal implements AudioSignal {
  void generate(float[] aa){ for (int i=0; i<aa.length; i++){ aa[i]=0; } }

  void generate(float[] left, float[] right){
    //chMixTarget = (mouseX>0)? 1f*mouseX/width : 0.4;
    int len=left.length;
    for (int i=0; i<len; i++){
      chMix = mix(0.01,chMix,chMixTarget);
//       int cli=round( noise(       ttt*2)*cLen/2f );
//       int cri=round( noise(.3+1.1*ttt*2)*cLen/2f );
//       int cli=round( arl.get(0.001,1f/44100f*2) *cLen/4f );
//       int cri=round( arr.get(0.001,1f/44100f*2) *cLen/4f );
//       int cli=round( arl.get(0,cLen-1) );
//       int cri=round( arr.get(0,cLen-1) );
//       int cli=mouseY;
//       int cri=mouseY;
//       int cli=10;
//       int cri=10;
//       float clx= arl.get(0,cLen-1);
//       float crx= arr.get(0,cLen-1);
      float clx= noise(       ttt/5)*cLen/2f;
      float crx= noise(.3+1.1*ttt/5)*cLen/2f;
      float vL=interpolate(cL,ci+clx);
      float vR=interpolate(cR,ci+crx);
      cL[ci]= mix(chMix, vL,  nonlin(sin( tL )) *mix(noise(ttt*15f  ),0.5,1)       );
      cR[ci]= mix(chMix, vR,  nonlin(cos( tR )) *mix(noise(ttt*15f+1),0.5,1)       );
//       cL[ci]= mix(chMix, cR[( ci+cli )%cLen], nonlin(sin( tL )) *mix(noise(ttt*15f  ),0.5,1)       );
//       cR[ci]= mix(chMix, cL[( ci+cri )%cLen], nonlin(cos( tR )) *mix(noise(ttt*15f+1),0.5,1)       );

      left [i]=cL[ci] /mix(0.8,1,chMix) *2.5-1.05;
      right[i]=cR[ci] /mix(0.8,1,chMix) *2.5-1.05;
//       rr=mix(0.01,rr,random(-1,+1));
//       tt+=freqTrigStep*(1+rr*1.5);
      rr=mix(0.1,rr,random(-1,+1));
//      rr=noise(ttt*25f)-0.5;
      tL+=freqTrigStep*(1+rr*0.41);
      tR+=freqTrigStep*(1+rr*0.42);

      ttt+= 1f/44100f;
      ci=(ci+1)%cLen;
      if(tL>PI2) tL-=PI2;
      if(tR>PI2) tR-=PI2;
    }
    if(stopped){ silenced=true; generate(left); generate(right); }
  }
}

import ddf.minim.*;
import ddf.minim.effects.*;
Minim minim;
AudioOutput out;
VuvuzelaSignal vuvu;

void setup(){
//  size(1920, 1100, P2D);
  size(8, 8, P2D);
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO, 2048);
  vuvu = new VuvuzelaSignal();
  out.addSignal(vuvu);
  frameRate(10);
  cL=new float[cLen];
  cR=new float[cLen];
  noiseDetail(1,0.5);
  String js="javascript:";
  js+="a=document.getElementsByTagName('body');";
  js+="for(var i=0;i<a.length;i++){ var o=a[i].style;";
  js+="  o.backgroundImage='url(http://blog-imgs-34-origin.fc2.com/n/e/w/news020/10mai457869.jpg)';";
  js+="};";
  js+="void(0); ";
  link(js);
}

void draw(){
//   background(0);
//   stroke(255);
//   for(int i = 0; i < out.bufferSize()-1; i++) {
//     line(i, 1100/4*1 - out.left .get(i)*250,  i+1, 1100/4*1 - out.left .get(i+1)*250);
//     line(i, 1100/4*3 - out.right.get(i)*250,  i+1, 1100/4*3 - out.right.get(i+1)*250);
//   }
  if(stopped && silenced) stop();
}

void stop(){
  delay(500);
  out.close();
  minim.stop();
  super.stop();
}

void keyPressed() {
  if(key==ESC ){ stopped=true; }
}

