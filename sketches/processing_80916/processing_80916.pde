
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
Minim miaudio;
AudioPlayer ladrido;
Minim miaudio2;
AudioPlayer maullido;
int x= 100;
int y =100;
int dy=1;
void setup (){
  size (500,500);
  smooth ();
  background (0);
  miaudio=new Minim (this);
  miaudio2=new Minim (this);
}
void draw (){
  pelota();
  fill(0,0,255);
  line(5,10,5,490);
  line(495,10,495,490);
  ellipse(x,y,50,50);
  if(x==470){
    ladrido=miaudio.loadFile("guau.mp3");
    ladrido.play();
    miaudio.stop();
  }
  if(x==30){
    maullido=miaudio2.loadFile("miau.mp3");
    maullido.play();
    miaudio2.stop();
  }
}
void pelota(){
  if(x<=30||x>=height-50){
    dy*=-1;
  }
  x+=dy;
}
