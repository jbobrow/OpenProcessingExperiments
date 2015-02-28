

import ddf.minim.*;
import ddf.minim.signals.*;
Minim minim;
AudioOutput out;
StringSignal signal;


float[] x;
float[] Xcopy;
float[] v;
float[] f;
float k = 0.9;
float c = 0.0003;
int num = 256;
int monitorPoint = num/18;


void setup(){
  size(1200,500);
  minim = new Minim(this);
  out = minim.getLineOut();
  signal = new StringSignal();
  out.addSignal(signal);
  stroke(255);
//  smooth();
  ellipseMode(CENTER);
  noFill();
  x = new float[num];
  Xcopy = new float[num];
  v = new float[num];
  f = new float[num];
  
  
}


void draw(){
  println(frameRate);
//  stringUpdate();
  background(0);
  arrayCopy(x,Xcopy);
  for(int i=1;i<num;i++){
    rect(float(i-1)/(num-1)*width,(0.5+Xcopy[i-1]*0.5)*height,0,float(i)/(num-1)*width,(0.5+Xcopy[i]*0.5)*height,0);
  }
  ellipse(float(monitorPoint)/(num-1)*width,
    (0.5+Xcopy[monitorPoint]*0.5)*height,5,5);
}


void stringUpdate(){
  for(int i=1;i<num;i++){
    float F = (x[i]-x[i-1])*k+(v[i]-v[i-1])*c;
    f[i-1] += F;
    f[i] -= F;
  }
  for(int i=0;i<num;i++){
    v[i] += f[i];
    f[i] = 0;
    x[i] += v[i];
    x[i] = constrain(x[i],-1,1);
  }
  x[0] = 0;
  v[0] = 0;
  x[num-1] = 0;
  v[num-1] = 0;
//  v[num-2] = 0;
  if(mousePressed&&mouseY>=0&&mouseY<height){
    float b = constrain(1f*(mouseX+0.5)/width*(num-1),0,num-1);
    int a = floor(b);
    int c = ceil(b);
    if(mouseButton==RIGHT){
      float V = v[a]+(v[c]-v[a])*(b-a);
      float F = V*-0.95;
      float Fa = (c-a)*F;
      float Fc = (b-c)*F;
      f[a] += Fa;
      f[c] += Fc;
    }else if(mouseButton==LEFT){
      float X = x[a]+(x[c]-x[a])*(b-a);
      float Xm = float(mouseY)/(height/2)-1;
      float F = (Xm-X)*1f;
      float Fa = (c-b)*F;
      float Fc = (b-a)*F;
      f[a] += Fa;
      f[c] += Fc;
    }
  }
}


class StringSignal implements AudioSignal{
  void generate(float[] samp){
    for(int i=0;i<samp.length;i++){
      samp[i] = x[monitorPoint];
      stringUpdate();
    }
  }
  
  
  
  void generate(float[] left, float[] right){
    for(int i=0;i<left.length;i++){
      left[i] = x[monitorPoint];
      right[i] = x[monitorPoint];
      stringUpdate();
    }
  }
}


void keyPressed(){
  if(keyCode==RIGHT){
    monitorPoint++;
    if(monitorPoint>=num){monitorPoint=num-1;}
  }
  if(keyCode==LEFT){
    monitorPoint--;
    if(monitorPoint<0){monitorPoint=0;}
  }
  
}


