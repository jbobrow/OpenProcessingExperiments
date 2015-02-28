
import pitaru.sonia_v2_9.*;

String path = "/";
final int Fs = 44100;
Sample mySample;

int filecount = 1;
float pitch = 1.0;
Spline spline;

float[] data;

ArrayList x = new ArrayList();
ArrayList y = new ArrayList();

float[] xs;
float[] ys;

void setup()
{
  try{
    size(600,300);
    background(255);
    
    Sonia.start(this);
    mySample = new Sample(Fs,Fs);
  }catch(Exception e){
    text("You need to install Sonia Browser Plugin !", 100,10);
    noLoop();
  }
}

void draw(){
  background(255);
  drawInfo();
  drawSpline(x,y);
  
  noFill();
  stroke(200);
  if(ys.length>0) line(0,ys[0],width,ys[0]);
}

void drawInfo(){
  fill(0);
  
  text("click:draw, C:clear, space:play",30,30); 
}

void mousePressed(){
  x.add(new Float(mouseX));
  y.add(new Float(mouseY));
}

void keyPressed(){

  if(key==' '){
    writeData();
    //frame.setTitle("Playing...");
  }else if(key=='r'){
    filecount = 1;
  }else if(key=='w'){
    writeData();
    mySample.saveFile(path + "wave" + filecount++);
    //frame.setTitle("Exported to " + path + "wave" + (filecount-1) + ".wav");
  }else if(key=='u'){
    pitch *= 2.0;
    println("pitch: " + pitch);
  }else if(key=='d'){
    pitch /= 2.0;
    println("pitch: " + pitch);
  }else if(key=='c'){
    x.clear();
    y.clear();
    //frame.setTitle("Cleared");
  }else{
    if(x.size()<1) return;
    
    x.remove(x.size()-1);
    y.remove(y.size()-1);
  }
}

void writeData(){
  int x_min = (int)xs[0];
  int x_max = (int)xs[xs.length-1];
  int len = (int)((x_max - x_min)/pitch);
  
  int N = (int)(22050/(float)len);
  
  float[] mywave0 = new float[len];
  float[] mywave = new float[len*N];
  
  spline.init();
  
  for(int t=0; t<len; t++){
    mywave0[t] = spline.calc(t*pitch+x_min)/(height/2.) - 1.0;
  }
  
  for(int t=0; t<len; t++){
    for(int i=0; i<N; i++){
      mywave[i*len + t] = mywave0[t];
    }
  }
  
  mySample.stop();
  mySample = new Sample(len*N,Fs);
  mySample.write(mywave);
  mySample.play();
  
  println("Playing...");
}

void drawSpline(ArrayList x, ArrayList y){
  int s = x.size();
  xs = new float[s];
  ys = new float[s];
  
  for(int i=0; i<s; i++){
    xs[i] = ((Float)x.get(i)).floatValue();
    ys[i] = ((Float)y.get(i)).floatValue();
  }
  
  drawSpline(xs,ys);
}

void drawSpline(float[] x, float[] y)
{
  if(x.length<1) return;
  
  Spline s;
  s = new Spline(x,y);
  s.init();
  
  stroke(0);
  noFill();
  beginShape();
  
  float x_min = x[0];
  float x_max = x[x.length-1];
  
  for(float t=x_min; t<=x_max; t++){
    vertex(t, s.calc(t));
  }
  
  endShape();
  
  spline = s;
  
  noStroke();
  fill(255,0,0);
  ellipseMode(CENTER);
  
  for(int i=0; i<x.length; i++){
    ellipse(x[i],y[i],4,4);
  }
}

class Spline
{
  int n;
  int counter;
  float[] a, b, c, d;
  float[] x, y;
  
  Spline(float[] x, float[] y)
  {
    float[] w, h;
    float tmp;
    n = y.length;
    
    a = new float[n];
    b = new float[n];
    c = new float[n];
    d = new float[n];
    h = new float[n-1];
    w = new float[n];
    
    for(int i=0; i<n-1; i++){
      h[i] = x[i+1]-x[i];
    }
    
    for(int i=0; i<n; i++){
      a[i] = y[i];
    }
    
    c[0] = 0.0;
    c[n-1] = 0.0;
    
    for(int i=1; i<n-1; i++){
      c[i] = 3.0 * ((a[i+1] - a[i])/h[i] - (a[i]-a[i-1])/h[i-1]);
    }
    
    w[0] = 0.0;
    for(int i=1; i<n-1; i++){
      tmp = 2*(h[i-1]+h[i]) - w[i-1];
      c[i] = (c[i] - c[i-1]*h[i-1])/tmp;
      w[i] = h[i] / tmp;
    }
    
    for(int i=n-2; i>0; i--){
      c[i] = c[i] - c[i+1] * w[i];
    }
    
    b[n-1] = 0.0;
    d[n-1] = 0.0;
    
    for(int i=0; i<n-1; i++){
      d[i] = (c[i+1] - c[i])/(3.0*h[i]);
      b[i] = (a[i+1] - a[i])/h[i] - h[i]*(c[i+1]+2*c[i])/3;
    }
    
    this.x = x;
    this.y = y;
  }
  
  void init(){
    counter = 0;
  }
  
  float calc(float t)
  {
    int j;
    float dx;
    
    if(x.length > counter+2 && t > x[counter+1]) counter++;
    
    j = counter;
    
    //point(t, j*20);
    
    if(j<0) j=0;
    else if(j>n-1) j=n-1;
   
    dx = t - x[j];
    
    return a[j] + (b[j] + (c[j] + d[j]*dx)*dx)*dx;
  }
}

public void stop(){
  Sonia.stop();
  super.stop();
}

float[] makeSine(float freq, int len){
  float[] d = new float[len];
  
  for(int i=0; i<len; i++){
    d[i] = sin(i/(float)Fs*TWO_PI*freq);
  }
  
  return d;
}

