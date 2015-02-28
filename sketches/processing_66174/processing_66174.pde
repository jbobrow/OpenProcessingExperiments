
import processing.video.*;
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioInput in;
Capture video;
float sig=0;
int rad=0;
  float []a=new float [200];
  float []b=new float [200];

void setup(){
  size(640,480);
 // video = new Capture (this,640,480,60);
  smooth();
  minim=new Minim(this);
  minim.debugOn();
  in =minim.getLineIn(Minim.STEREO,1024);
}

void draw(){
  //if (video.available()){
    //video.read();
  //}
  for(int i=0;i<1024;i+=64){
    float proxy;
    proxy=abs(in.left.get(i))*200;
    //colorMode(HSB,360,100,100);//HSB mode if necessary...
    if (sig<proxy){
      sig=proxy;
    }else sig-=sig*sig/3600;   
    background(sig*2,0,255-sig*4);
    proxy=sig;    
  }
  //image(video,0,0);
  //below ripple code
  stroke(255);
  for (int i=0;i<200;i++){
    a[i]=0;
    b[i]=0;
  }

  for (int i=0;i<int (sig);i++){
    a[i]=int(random(640));
    b[i]=int(random(480));
  }
  for(int j=0;j<int(sig);j++){
    noFill();
    ellipse(a[j],b[j],sig,sig);
    fill(0);
    if(sig>30){
    ellipse(a[j],b[j],sig/3,sig/3);
    }
  }

}



