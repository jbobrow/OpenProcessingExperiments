
import processing.opengl.*;

Tracer myTracer;
PFont infoFont;
float currentHeight=0;
float currentWidth=0;
int xCenter;
int yCenter;

boolean rose=false;
boolean pinwheel=false;
boolean floatRose=false;
boolean lissajous=true;
boolean lissajousFloat=false;

void setup(){
  size(720,480,P2D);
  xCenter=width/2;
  yCenter=height/2;
  currentHeight=height/2;
  noSmooth();
  background(10);
  infoFont=loadFont("SansSerif-10.vlw");
  textFont(infoFont);
  textMode(SCREEN);
  myTracer=new Tracer(get(),color(16,64,32),false);
}

void draw(){
  //background(0);
  myTracer.clear();
  myTracer.loadTracer();
  float A;
  float B=A=150;
  float a;
  float b; 
  if(lissajousFloat){
    a=mouseX/5.0;
    b=mouseY/5.0;
  }
  else{
    a=mouseX/5;
    b=mouseY/5;
  }
  float d=radians(frameCount);
  float n;
  if(!floatRose){
    n=(float)ceil(mouseX/10.0);
  }
  else{
    n=mouseX/10.0;
  }
  float d2;
  int turns;
  if(pinwheel){
    turns=10;
    if(!floatRose){
      d2=(float)ceil(((mouseY)/10.0)+1);
    }
    else{
      d2=((mouseY)/10.0)+1;
    }
  }
  else{
    turns=1;
    d2=1;
  }
  float k=n/d2;
  if(lissajous){
    for(float i=0;i<TWO_PI;i+=0.001){

      //Lissajous curve POWER MUTHANFUKAN!
      //http://en.wikipedia.org/wiki/Lissajous_curve
      myTracer.polarTrace(xCenter+A*sin(a*i+d),yCenter+B*sin(b*i));
    }
  }
  if(rose){
    for(float i=0;i<TWO_PI*turns;i+=0.01){
      float r=A*cos((k)*i);
      //coordenadas polares
      myTracer.trace(xCenter+r*cos(i+d),yCenter+r*sin(i+d));  
    }
  }
  myTracer.drawTracer(0,0);

  fill(255);
  text(nf(frameRate,2,2)+"fps",10,20);
 // text("Lissajous, A="+A+", B="+B+", a="+a+", b="+b+", d="+d,10,height-20);
}

void keyPressed(){
  if(key=='R'||key=='r'){
    rose=!rose;
  }
  if(key=='l'){
    lissajous=!lissajous;
  }
  if(key=='L'){
    lissajousFloat=!lissajousFloat;
  }
  if(key=='P'||key=='p'){
    pinwheel=!pinwheel;
  }
  if(key=='F'||key=='f'){
    floatRose=!floatRose;
  }
}






